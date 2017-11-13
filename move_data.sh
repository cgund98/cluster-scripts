#!/bin/bash

FIRST=true
for f in "$@"
do
  if ! ${FIRST}
  then
    ssh -i ~/.ssh/cyclecloud/cyclecloud.pem cyclecloud@$1 "nohup sudo chown -R cyclecloud /mnt/resource; nohup sudo chmod -R u+rwx /mnt/resource"
    scp -i ~/.ssh/cyclecloud/cyclecloud.pem $f cyclecloud@$1:/mnt/resource
  else
    FIRST=false
  fi
done
