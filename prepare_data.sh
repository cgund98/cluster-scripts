#!/bin/bash
sudo chown -R cyclecloud /mnt/resource
cp $HOME/cluster-scripts/extract_data.sh /mnt/resource/
cp $HOME/cluster-scripts/combine_data.sh /mnt/resource/
cd /mnt/resource/
./extract_data.sh
./combine_data.sh
