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


tagfiles = {"*.bbx", "*.cbx", "*.def", "*.tex"}

function update_tag(file, content, tagname, tagdate)
  local isodatescheme = "%d%d%d%d%-%d%d%-%d%d"
  local ltxdatescheme = "%d%d%d%d%/%d%d%/%d%d"
  local versionscheme = "%d+%.%d+%.?%d?%w?"
  local latexdate = string.gsub(tagdate, "%-", "/")
  if string.match(file, "%.bbx$")  or string.match(file, "%.cbx$") 
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
    return string.gsub(content, "date={\\DTMDate{" .. isodatescheme .. "}}}",
                                "date={\\DTMDate{" .. tagdate .."}}}")
  end
  return content
end