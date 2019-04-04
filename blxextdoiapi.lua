blxextdoiapi = blxextdoiapi or {}

local blxextdoiapi_module = {
  name          = "blxextdoiapi",
  version       = "v0.7a",
  date          = "2019/04/04",
  description   = "Obtain open access information from DOI via unpaywall.org",
  author        = "Moritz Wemheuer",
  license       = "LPPL v1.3c",
  url           = "https://github.com/moewew/biblatex-ext/",
}
-- inspired by Eric Marsden's answer to https://tex.stackexchange.com/q/459449/


-- luatexbase's luatexbase.provides_module returns the loggers directly
local err, warn, info, log = luatexbase.provides_module(blxextdoiapi_module)

-- Does it even make sense to try and make use of the extra luatexbase stuff
-- from luatexbase.sty? Since we don't want to assume that package in general,
-- we have to manually recode it anyway...

-- for ltluatex's luatexbase.provides_module we need to construct the loggers
local error   = err  or
  (function (s,...)
     return luatexbase.module_error(blxextdoiapi_module.name, s:format(...))
   end)
local warning = warn or
  (function (s,...)
     return luatexbase.module_warning(blxextdoiapi_module.name, s:format(...))
   end)
local info    = info or
  (function (s,...)
     return luatexbase.module_info(blxextdoiapi_module.name, s:format(...))
   end)
local log     = log  or
  (function (s,...)
     return luatexbase.module_info(blxextdoiapi_module.name, s:format(...))
   end)


local http        = require("socket.http")
local url         = socket.url or require("socket.url") --- #17, LuaTeX 1.07
local json        = utilities.json
local os_time     = os.time
local os_date     = os.date
local os_difftime = os.difftime
local gsub        = string.gsub
local texwrite    = tex.write

-- cf. fontspec.lua and microtype.lua
-- http://mirrors.ctan.org/macros/latex/contrib/fontspec/fontspec-lua.dtx
-- http://mirrors.ctan.org/macros/latex/contrib/microtype/microtype.dtx
-- as well as luatexja.lua (luatexbase.catcodetables['latex-package'])
-- http://mirrors.ctan.org/macros/luatex/generic/luatexja/src/luatexja.lua
-- and luaotfload-auxiliary.lua (luatexbase.catcodetables["latex-package"])
-- http://mirrors.ctan.org/macros/luatex/generic/luaotfload/luaotfload-auxiliary.lua
local catpackage
if luatexbase.catcodetables then
  catpackage = luatexbase.catcodetables["latex-package"]          -- luatexbase
else
  catpackage = luatexbase.registernumber("catcodetable@atletter") -- ltluatex
end

local function texsprint(s)
  tex.sprint(catpackage, s)
end

-- global database of DOIs
-- is going to be loaded from \jobname.oai beforehand if the file exists
oadb = oadb or {}

-- parse YYYY-MM-DD date as string (UTC time!)
-- os.time is usually local time, hence the utc_offset to get UTC
-- see also https://stackoverflow.com/q/4105012
local function ymdstr_to_date(date_str)
  local date_pattern = "(%d+)-(%d+)-(%d+)"
  local utc_offset = os_difftime(os_time(), os_time(os_date("!*t")))
  local year, month, day = date_str:match(date_pattern)

  if year and month and day then
    return os_time({year = year, month = month, day = day, sec=utc_offset})
  end

  return nil
end

local TODAY_STR = os_date("!%Y-%m-%d")
local TODAY = ymdstr_to_date(TODAY_STR)

local SECONDS_PER_DAY = 86400

-- info in oadb expires after blxextdoiapi.cache_expire days
-- if the info is older than that is_recent_info will return false
-- can be set with \SetDOIAPICacheExpiration
local cache_expire = 7

-- this includes a test if there is info at all
local function is_recent_info(doi, days, api)
  if oadb[doi] and oadb[doi]["cache_date_" .. api] then
    return os_difftime(TODAY, ymdstr_to_date(oadb[doi]["cache_date_" .. api]))
           < days * SECONDS_PER_DAY
  end

  return false
end

local function query_json_api(req_url)
  body, code, headers = http.request(req_url)
  if body then
    -- JSON escapes don't quite work for Lua
    -- https://tools.ietf.org/html/rfc8259, section 7
    -- http://lua-users.org/lists/lua-l/2017-04/msg00100.html
    -- query DOI 10.1371/journal.pbio.2005099 from Unpaywall
    -- to see what goes wrong
    body = body:gsub("\\u(%x%x%x%x)","\\u{%1}")
    return json.tolua(body), code
  end

  return nil, code
end

local function get_doi_info(doi)
  local req_url = "https://doi.org/api/handles/" .. url.escape(doi)
  local doi_info, code  = query_json_api(req_url)

  if doi_info then
    oadb[doi] = oadb[doi] or {}
    oadb[doi]["cache_date_doi"] = TODAY_STR
    oadb[doi]["is_valid"] = (doi_info["responseCode"] == 1)
    info("Successfully queried doi.org for info on\n" .. doi)
    return oadb[doi]["is_valid"]
  end

  warning("Failed to obtain DOI info\nfrom doi.org for\n"
          .. doi .. "\nerror code " .. code)
  return false
end

local function is_valid_doi(doi)
  if is_recent_info(doi, blxextdoiapi.cache_expire, "doi") then
    return oadb[doi]["is_valid"]
  end

  return get_doi_info(doi)
end

-- email is required, error out if not given
-- Unfortunately, this gives a weird Lua dump as well and one has to scroll
-- up to see the error, but it felt like cheating shoehorning in
-- a usual TeX error instead of the generic LuaTeX error provided by ltluatex.
-- Only makes sense if the DOI is valid.
local function get_unpaywall_info(doi)
  if not is_valid_doi(doi) then
    return nil
  elseif not blxextdoiapi.mail or blxextdoiapi.mail == "" then
    error("No mail address supplied.\n" ..
          "You must give a valid email address\n" ..
          "to be able to use the Unpaywall API\n")
    return nil
  end

  local req_url = "https://api.unpaywall.org/v2/" .. doi
                  .. "?email=" .. blxextdoiapi.mail
  local upw_info, code = query_json_api(req_url)

  if code == 200 and upw_info then
    oadb[doi] = oadb[doi] or {}
    oadb[doi]["cache_date_upw"] = TODAY_STR
    -- Don't read "is_oa", we go to the URL directly.
    if upw_info["best_oa_location"] then
      oadb[doi]["oa_url"] = upw_info["best_oa_location"]["url_for_landing_page"]
                            or upw_info["best_oa_location"]["url"]
                            or upw_info["best_oa_location"]["url_for_pdf"]
      -- As it turns out url_for_landing_page might be null
      -- even though there is a url and a url_for_pdf.
      -- http://unpaywall.org/data-format does not explicitly list
      -- url_for_landing_page as String|Null like other null-able objects.
      -- But request 10.1007/s00163-016-0235-2 to see this issue
      -- (at least updated: "2018-07-28T00:37:18.524676").
      -- I don't understand why Unpaywall returns two objects in the first place
      -- they are clearly the same. Yet the one identified as 'best' has a
      -- longer, weird URL and no landing page. It was probably chosen because
      -- it is marked as having been updated more recently.
    else
      oadb[doi]["oa_url"] = nil
    end
    info("Successfully queried unpaywall.org\n"
         .. "for info on\n" .. doi)
    return oadb[doi]["oa_url"]
  end

  warning("Failed to obtain open access info\n"
          .. "from unpaywall.org for DOI\n" .. doi .. "\n"
          .. "error code: " .. code)
  return nil
end


local function get_openaccess_url(doi)
  if is_recent_info(doi, blxextdoiapi.cache_expire, "upw") then
    return oadb[doi]["oa_url"]
  end

  return get_unpaywall_info(doi)
end

-- returns false if there is no open access URL since the RHS ~= nil
local function openaccess_url_is_doi(doi)
  return get_openaccess_url(doi) == "https://doi.org/" .. doi
end

local function is_openaccess(doi)
  return get_openaccess_url(doi) ~= nil
end

-- For TeX. I'd have liked this better in the .sty, but the whole \ escape
-- malarkey made that a pain, so the function is here now.
local function assign_openaccess_url_to(macro, doi)
  local oa_url = get_openaccess_url(doi)
  if oa_url then
    texsprint("\\def"..macro.."{")
    texwrite(oa_url)
    texsprint("}")
  end
end

-- make conditionals usable as \<...>{<true>}{<false>} directly
local function texify_conditional(cond)
  if cond then
    texsprint("\\@firstoftwo")
  else
    texsprint("\\@secondoftwo")
  end
end

-- mail is not exported, we just expect the user to set it
return {
  module                   = module,
  cache_expire             = cache_expire,
  is_valid_doi             = is_valid_doi,
  is_openaccess            = is_openaccess,
  get_openaccess_url       = get_openaccess_url,
  assign_openaccess_url_to = assign_openaccess_url_to,
  openaccess_url_is_doi    = openaccess_url_is_doi,
  texify_conditional       = texify_conditional,
}

--
-- This file is part of the biblatex-ext bundle.
-- biblatex-ext is released under the LaTeX Project Public License v1.3c
-- or later.
--
-- A complete list of files included in that package can be found in README.md
-- or - failing that - in ext-standard.bbx.
--
-- Official releases of this package are on CTAN
--   https://www.ctan.org/pkg/biblatex-ext
-- development takes place on GitHub
--   https://github.com/moewew/biblatex-ext
--
