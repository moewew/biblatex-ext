testfiledir  = "testfiles-pdflatex-dev"
testsuppdir  = "testsupport"
checkengines = {"pdflatex-dev"}
stdengine    =  "pdflatex-dev"
checkruns    = 3

function runtest_tasks(name, run)
  local run = run or 1
  if run == 1 or not fileexists(testdir .. "/" .. name .. ".bbl") then
    return "biber -q " .. name
  else
    return ""
  end
end
