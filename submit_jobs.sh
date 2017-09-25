for VAR in 1 2 3 4 5 6
do
  for VAR2 in 4 8 12 16 20
  do
  qsub splotch/splotch_circle.pbs -l nodes=$VAR:ppn=$VAR2 -N "$VAR"n"$VAR2"ppn -n
  done
done
