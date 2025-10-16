# usage: in PuTTY from current folder: './run_set.sh'
#
# if it doesn't work (permission issue), try:
#    dos2unix run_set.sh
#    ./run_set.sh
#
#!/bin/bash

# INPUT
runid=${PWD##*/}
version=latest_dimr
# version is a folder in <p:\h6\opt\delft3dfm\>
nodes=2
cores=4
mdu=RMM_dflowfm.mdu
queue=normal-e3
# available queue's: normal-e3 , normal-e5 , test
# END OF INPUT

module load dflowfm
run_dflowfm.sh -v $version --partition:ndomains=$((nodes*cores)):icgsolver=6 $mdu        
submit_dflowfm.sh -m $mdu -n $nodes -c $cores -v $version -q $queue -j $runid
