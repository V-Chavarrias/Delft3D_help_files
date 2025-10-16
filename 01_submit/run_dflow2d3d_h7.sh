#!/bin/bash
#
# This is an h7 specific script for single or multi-node simulations.
#
# Usage:
#   - Copy this script into your working folder, next to the config (and wave) file.
#   - Modify this script where needed (e.g. number of nodes, number of tasks per node).
#	- Start a command line in H7.
#	- Execute: `dos2unix ./run_dflow2d3d_h7.sh`
#   - Execute: `./run_dflow2d3d_h7.sh`
#

# stop after an error occured:
set -e
 
# Set numbers of hosts and cores per host
NODES=1
TASKS_PER_NODE=16
TIME_LIMIT="7-00:00:00"
WAVES=rb_ny_wave_wit4_feiner.mdw
CONFIG=config_dflow2d3d.xml 
PARTITION="16vcpu" #`scontrol show partition` to see available partitions and time limit

# set Delft3D4 version to be used
delft3d4dir=/p/d-hydro/delft3d4/Delft3D-FLOW_WAVE_AL8/6.04.03.997c59b

# jobName: $FOLDERNAME
export jobName="delft3d4_${PWD##*/}"

#if FLOW
#$delft3d4dir/lnx64/bin/submit_dflow2d3d_AL8.sh -n $NODES -c $TASKS_PER_NODE -j $jobName -t $TIME_LIMIT -p $PARTITION -m $CONFIG

#if FLOW+WAVES
$delft3d4dir/lnx64/bin/submit_dflow2d3d_AL8.sh -n $NODES -c $TASKS_PER_NODE -j $jobName -w $WAVES -t $TIME_LIMIT -p $PARTITION -m $CONFIG
