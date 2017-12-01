#!/usr/bin/env texlua

-- Build script for "biblatex-ext" files

-- Identify the bundle and module
module = "biblatex-ext"

unpackfiles = { }

-- Install biblatex style files and use these as the sources
installfiles = {"*.cbx", "*.bbx"}
sourcefiles  = installfiles

checkengines = {"pdftex"}
checkruns    = 3

function runtest_tasks(name)
  return "biber -q " .. name 
end

-- Release a TDS-style zip
packtdszip  = true


versionfiles = {"*.bbx", "*.cbx"}

function setversion_update_line (line, date, version)
  local date = string.gsub(date, "%-", "/")
  if string.match(line, "%d%d%d%d/%d%d/%d%d v%d%.%d%w? extended") then
    line = string.gsub(line, "%d%d%d%d/%d%d/%d%d", date)
    line = string.gsub(line, "v%d%.%d%w?", "v" .. version)
  end
  return line
end

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))