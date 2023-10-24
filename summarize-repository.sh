#!/bin/sh 

for F in `find . -type f | grep -v examples | grep -v .git | grep -v README | grep -v LICENSE`; do echo "----- $F -----"; cat  $F;  done