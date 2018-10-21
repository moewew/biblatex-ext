#!/bin/bash

for citestylefile in ./*.cbx ; do
  stylebasename=$(basename -- "$citestylefile")
  stylename="${stylebasename%.*}"
  echo "$stylename"
  cp "./testfiles/template-boxed.lvtemplate" "./testfiles/boxed-$stylename.lvt"
  sed -i "s/<style>/$stylename/g" "./testfiles/boxed-$stylename.lvt"
done
