#!/bin/bash

#scp -i ~/.ssh/cyclecloud/cyclecloud.pem setup.sh cyclecloud@$1:~/
#ssh -i ~/.ssh/cyclecloud/cyclecloud.pem cyclecloud@$1 'nohup sh setup.sh;'
stdin=$(cat)
for ip in $stdin
do
  echo "Installing on $ip"
  scp -i ~/.ssh/cyclecloud/cyclecloud.pem tmux_born.sh cyclecloud@$ip:~/
  ssh -i ~/.ssh/cyclecloud/cyclecloud.pem cyclecloud@$ip 'nohup sh tmux_born.sh'
done
