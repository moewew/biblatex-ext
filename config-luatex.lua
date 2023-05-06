testfiledir  = "testfiles-luatex"
testsuppdir  = "testsupport"
checkengines = {"luatex"}
checkopts    = "--socket -interaction=nonstopmode"
stdengine    =  "luatex"
checkruns    = 1


function runtest_tasks(name, run)
  return ""
end
