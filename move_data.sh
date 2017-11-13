#!/bin/bash

FIRST=true
for f in "$@"
do
  if ! ${FIRST}
  then
    scp -i ~/.ssh/cyclecloud/cyclecloud.pem $f cyclecloud@$1:/mnt/resource/
  else
    FIRST=false
  fi
done
