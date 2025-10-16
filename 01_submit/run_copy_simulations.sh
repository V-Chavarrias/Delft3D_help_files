#!/bin/bash
  
# This is an h7 specific script for single or multi-node simulations.
#
# Usage:
#   - Copy this script into your working folder, next to the config (and wave) file.
#   - Modify this script where needed (e.g. number of nodes, number of tasks per node).
#	- Start a command line in H7.
#	- Execute: `dos2unix ./run_dimr_h7.sh`
#   - Execute: `./run_dimr_h7.sh`
#

# Set bash options. Exit on failures (and propagate errors in pipes).
set -eo pipefail

# These variables should be modified.
NODES=1
TASKS_PER_NODE=1
JOB_NAME="copy_data"
PARTITION="1vcpu" #`scontrol show partition` to see available partitions and time limit
TIME_LIMIT="3:00:00"
  
# Compute the total number of tasks (across all nodes).
NTASKS=$(( $NODES * $TASKS_PER_NODE ))

# Run simulation using dimr.
echo "Run simulation..."
sbatch --job-name=$JOB_NAME \
    --partition=$PARTITION \
    --time=$TIME_LIMIT \
    --nodes=$NODES \
    --ntasks-per-node=$TASKS_PER_NODE \
    ./copy_simulations.sh 
