#!/bin/sh

for d in str_* 
do
	#echo "sim $d"
	#echo " $d/run_dimr_1738.sh "
	cd $d
	./run_dimr_21106.sh
	cd ..
	
done 
