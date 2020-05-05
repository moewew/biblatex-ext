#!/bin/bash

for citestylefile in ./*.cbx ; do
  stylebasename=$(basename -- "$citestylefile")
  stylename="${stylebasename%.*}"
  echo "$stylename"
  cp "./testfiles/template-boxed-style.lvtemplate" "./testfiles/boxed-style-$stylename.lvt"
  sed -i "s/<style>/$stylename/g" "./testfiles/boxed-style-$stylename.lvt"
done
