#!/usr/bin/env texlua

-- Build script for "biblatex-ext" files

-- Identify the bundle and module
module = "biblatex-ext"

unpackfiles = { }

-- Install biblatex style files and use these as the sources
installfiles = {"*.cbx", "*.bbx", "*.def", "*.sty", "blxextdoiapi.lua"}
sourcefiles  = installfiles

typesetfiles = {"biblatex-ext.tex"}
textfiles    = {"README.md", "CHANGES.md"}

checkconfigs = {"build", "config-luatex", "config-runonce"}

testsuppdir  = "testsupport"
checkengines = {"pdftex"}
checkruns    = 3


function runtest_tasks(name, run)
  local run = run or 1
  if run == 1 or not fileexists(testdir .. "/" .. name .. ".bbl") then
    return "biber -q " .. name
  else
    return ""
  end
end

-- Release a TDS-style zip
packtdszip  = false


tagfiles = {"*.bbx", "*.cbx", "*.def", "*.tex", "*.md", "*.sty",
            "blxextdoiapi.lua"}

function update_tag(file, content, tagname, tagdate)
  local isodate_scheme = "%d%d%d%d%-%d%d%-%d%d"
  local ltxdate_scheme = string.gsub(isodate_scheme, "%-", "/")
  local version_scheme = "%d+%.%d+%.?%d?%w?"
  local tagdate_ltx  = string.gsub(tagdate, "%-", "/")
  local tagyear      = string.match(tagdate, "%d%d%d%d")
  local tagname_safe = string.gsub(tagname, "^v", "")

  if string.match(file, "^ext%-standard%.bbx$") then
    content = string.gsub(content,
                          "v" .. version_scheme
                            .. " %(" .. isodate_scheme .. "%)",
                          "v" .. tagname_safe .. " (" .. tagdate .. ")")
    content = string.gsub(content, 
                          ltxdate_scheme .. " v" .. version_scheme,
                          tagdate_ltx .. " v" .. tagname_safe)
    content = string.gsub(content,
                          "Copyright 2017%-%d%d%d%d",
                          "Copyright 2017-" .. tagyear)
    return content
  elseif string.match(file, "%.bbx$") or string.match(file, "%.cbx$")
    or string.match(file, "%.def$") or string.match(file, "%.sty$") then
    content = string.gsub(content,
                          "\\ProvidesExplPackage {(.-)}\n  {" .. ltxdate_scheme
                             .. "} {" .. version_scheme .. "}",
                          "\\ProvidesExplPackage {%1}\n  {" .. tagdate_ltx
                             .. "} {" .. tagname_safe .. "}")
    content = string.gsub(content,
                          ltxdate_scheme .. " v" .. version_scheme,
                          tagdate_ltx .. " v" .. tagname_safe)
    return content
  elseif string.match(file, "%.tex$") then
    content = string.gsub(content,
                          "\n\\newcommand%*{\\extblxversion}{"
                            .. version_scheme .."}\n",
                          "\n\\newcommand*{\\extblxversion}{"
                            .. tagname_safe .. "}\n")
    content = string.gsub(content,
                          "\n\\begin{release}{<version>}{<date>}\n",
                          "\n\\begin{release}{" .. tagname_safe .. "}{"
                            .. tagdate .."}\n")
    content = string.gsub(content,
                          "date%s*=%s*{\\DTMDate{" .. isodate_scheme .. "}}",
                          "date     = {\\DTMDate{" .. tagdate .."}}")
    content = string.gsub(content,
                          "\\textcopyright 2017%-%-%d%d%d%d",
                          "\\textcopyright 2017--" .. tagyear)
    return content
  elseif string.match(file, "%.lua$") then
    content = string.gsub(content,
                          '(version%s*=%s"v)' .. version_scheme .. '"',
                          '%1' .. tagname_safe .. '"')
    content = string.gsub(content,
                          '(date%s*=%s")' .. ltxdate_scheme ..  '"',
                          '%1' .. tagdate_ltx .. '"')
    return content
  elseif string.match(file, "^README%.md$") then
    content = string.gsub(content,
                          "Copyright 2017%-%d%d%d%d",
                          "Copyright 2017-" .. tagyear)
    return content
  elseif string.match(file, "^CHANGES%.md$") then
    content = string.gsub(content,
                          "## Unreleased\n",
                          "## Version " .. tagname_safe
                            .. " (" .. tagdate .. ")\n")
    if string.match(content,
                    "https://github.com/moewew/biblatex%-ext"
                      .. "/compare/v" .. version_scheme .. "...HEAD") then
      content = string.gsub(content,
                            "...HEAD",
                            "...v" .. tagname_safe)
    end
    return content
  end
  return content
end

kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
