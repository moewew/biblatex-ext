#!/bin/bash

for citestylefile in ./*.cbx ; do
  stylebasename=$(basename -- "$citestylefile")
  stylename="${stylebasename%.*}"
  echo "$stylename"
  cp "./testfiles/template-boxed-style.lvtemplate" "./testfiles/style-$stylename.lvt"
  sed -i "s/<style>/$stylename/g" "./testfiles/style-$stylename.lvt"
done
