#!/bin/bash

for testfile in ./testfiles/*.lvt ; do
  testnamebase=$(basename -- "$testfile")
  testname="${testnamebase%.*}"
  l3build save "$testname"
done
