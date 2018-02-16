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


versionfiles = {"*.bbx", "*.cbx", "*.def", "*.tex"}

function setversion_update_line (line, date, version)
  local latexdate = string.gsub(date, "%-", "/")
  if string.match(line, "%d%d%d%d/%d%d/%d%d v%d+%.%d+%.?%d?%w?") then
    line = string.gsub(line, "%d%d%d%d/%d%d/%d%d", latexdate)
    line = string.gsub(line, "v%d+%.%d+%.?%d?%w?", "v" .. version)
  end
  if string.match(line, "^\\newcommand%*%{\\extblxversion%}%{%d+%.%d+%.?%d?%w?%}$")
  then
    line = string.gsub(line, "%d+%.%d+%.?%d?%w?", version)
  end
  if string.match(line, "^\\begin%{release%}%{<version>%}%{<date>%}$") then
    line = string.gsub(line, "<version>", version)
    line = string.gsub(line, "<date>", date)
  end
  if string.match(line, "date=%{\\DTMDate%{%d%d%d%d%-%d%d%-%d%d%}%}") then
    line = string.gsub(line, "%d%d%d%d%-%d%d%-%d%d", date)
  end
  return line
end

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))