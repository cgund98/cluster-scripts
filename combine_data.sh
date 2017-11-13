#!/bin/bash
mkdir data
for f in *.tgz
do
  f=${f%.*}
  cp $f/* data/
done

