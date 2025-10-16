#!/bin/bash

#
# INPUT
#
   
export nNodes=1 #number of nodes
export nProc=2 #number of processors
# export OMP_NUM_THREADS=1 %number of OpenMP threads. If commented, maximum is used. 
export dimrFile="dimr_config_par.xml" #dimr configuration filename
export queue=test-c7 #queue. One of: normal-e3, normal-e3-c7, test-c7
export dimrdir=/p/d-hydro/dimrset/2022/2022.04 #directory with executables

#
# CALL
#

export nPart=$((nNodes * nProc))

# Replace number of processes in DIMR file
PROCESSSTR="$(seq -s " " 0 $((nPart-1)))"
sed -i "s/\(<process.*>\)[^<>]*\(<\/process.*\)/\1$PROCESSSTR\2/" $dimrFile

# Read MDU file from DIMR-file
export mduFile="$(sed -n 's/\r//; s/<inputFile>\(.*\).mdu<\/inputFile>/\1/p' $dimrFile)".mdu

# jobName: DIMR_$FOLDERNAME_$DIMRFILENAME
export jobName="DIMR_${PWD##*/}_$dimrFile"

if [ "$nPart" = "1" ]; then 
    $dimrdir/lnx64/bin/submit_dimr.sh -m $dimrFile -d 9 -j $jobName -q $queue &> out_submit.txt
else
	#when calling with <genpolygon>, the partitioned grids do not have subdomain numbers and the partition polygon needs to be added to the mdu-file. 
	#$dimrdir/lnx64/bin/run_dflowfm.sh --partition:ndomains=$nPart:icgsolver=6:genpolygon=1 $mduFile  &> out_partitioning.txt 
	$dimrdir/lnx64/bin/run_dflowfm.sh --partition:ndomains=$nPart:icgsolver=6 $mduFile  &> out_partitioning.txt 
    $dimrdir/lnx64/bin/submit_dimr.sh -c $nProc -n $nNodes -m $dimrFile -d 9 -q $queue -j $jobName &> out_submit.txt
fi
