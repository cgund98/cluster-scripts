#!/bin/bash
TBBPATH=$(( module show intel ) |& grep TBBROOT | tr -d '"')
TBBPATH=($TBBPATH)
TBBPATH=${TBBPATH[2]}
#echo $TBBPATH/bin/tbbvars.sh
source $TBBPATH/bin/tbbvars.sh intel64 linux auto_tbbroot
