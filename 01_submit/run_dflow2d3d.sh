# usage: in PuTTY: ./run_set.sh
#
# if it doesn't work (permission issue), try:
#    dos2unix run_set.sh
#    ./run_set.sh
#
# chmod a+rwx run_set.sh
#!/bin/bash

# INPUT
runid=${PWD##*/}
nodes=1
cores=1
queue=test # available queue's: normal-e3 , normal-e5 , test
mdu=config_d_hydro.xml 
# END OF INPUT

# ../../02_software/6.03.00.65936/lnx64/flow2d3d/bin/run_dflow2d3d.sh -m $mdu -n $nodes -c $cores -j $runid -q $queue
../../02_software/6.03.00.65936/lnx64/flow2d3d/bin/submit_dflow2d3d.sh -m $mdu -n $nodes -c $cores -j $runid -q $queue
