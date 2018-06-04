#!/usr/bin/env texlua

-- Build script for "biblatex-ext" files

-- Identify the bundle and module
module = "biblatex-ext"

unpackfiles = { }

-- Install biblatex style files and use these as the sources
installfiles = {"*.cbx", "*.bbx", "*.def"}
sourcefiles  = installfiles

checkengines = {"pdftex"}
checkruns    = 3

function runtest_tasks(name)
  return "biber -q " .. name
end

-- Release a TDS-style zip
packtdszip  = true


tagfiles = {"*.bbx", "*.cbx", "*.def", "*.tex", "*.md"}

function update_tag(file, content, tagname, tagdate)
  local isodatescheme = "%d%d%d%d%-%d%d%-%d%d"
  local ltxdatescheme = string.gsub(isodatescheme, "%-", "/")
  local versionscheme = "%d+%.%d+%.?%d?%w?"
  local latexdate = string.gsub(tagdate, "%-", "/")
  local tagyear = string.match(tagdate, "%d%d%d%d")
  if string.match(file, "^ext%-standard%.bbx$") then
    content = string.gsub(content , "v" .. versionscheme .. " %(" ..
                                    isodatescheme .. "%)",
                                    "v" .. tagname .. " (" ..
                                    tagdate .. ")")
    content = string.gsub(content , ltxdatescheme .. " v" .. versionscheme,
                                    latexdate .. " v" .. tagname)
    return string.gsub(content, "Copyright 2017%-%d%d%d%d",
                                "Copyright 2017-" .. tagyear)
  elseif string.match(file, "%.bbx$")  or string.match(file, "%.cbx$")
    or string.match(file, "%.def$") then
    return string.gsub(content , ltxdatescheme .. " v" .. versionscheme,
                                 latexdate .. " v" .. tagname)
  elseif string.match(file, "%.tex$") then
    content = string.gsub(content ,"\n\\newcommand%*{\\extblxversion}{"
                                     .. versionscheme .."}\n",
                                   "\n\\newcommand*{\\extblxversion}{"
                                     .. tagname .. "}\n")
    content = string.gsub(content ,"\n\\begin{release}{<version>}{<date>}\n",
                                   "\n\\begin{release}{" .. tagname .. "}{"
                                     .. tagdate .."}\n")
    content = string.gsub(content, "date%s*=%s*{\\DTMDate{" .. isodatescheme ..
                                     "}}",
                                   "date     = {\\DTMDate{" .. tagdate .."}}")
    return string.gsub(content, "\\textcopyright 2017%-%-%d%d%d%d",
                                "\\textcopyright 2017--" .. tagyear)
  elseif string.match(file, "^README%.md$") then
    return string.gsub(content, "Copyright 2017%-%d%d%d%d",
                                "Copyright 2017-" .. tagyear)
  elseif string.match(file, "^CHANGES%.md$") then
    content = string.gsub(content, "# Version <version> %(<date>%)\n",
                                   "# Version " .. tagname .. " (" .. tagdate ..
                                   ")\n")
    if string.match(content, "https://github.com/moewew/biblatex%-ext" ..
                             "/compare/v" .. versionscheme ..
                             "...v<version>") then
      return string.gsub(content, "...v<version>",
                                  "...v" .. tagname)
    end
  end
  return content
end