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
TASKS_PER_NODE=4
JOB_NAME="test_model"
PARTITION="4vcpu" #`scontrol show partition` to see available partitions and time limit
TIME_LIMIT="24:00:00"
DIMR_FOLDER="/p/d-hydro/dimrset/weekly/2.26.25.79023_delft3dfm_2024_03"
DIMR_FILE="${PWD}/dimr_config.xml"
  
# Compute the total number of tasks (across all nodes).
NTASKS=$(( $NODES * $TASKS_PER_NODE ))

# Modify the value of the process tag in dimr_config.xml.
PROCESS_STR="$(seq -s " " 0 $(( $NTASKS - 1 )))"
sed -i "s/\(<process.*>\)[^<>]*\(<\/process.*\)/\1$PROCESS_STR\2/" $DIMR_FILE

# The name of the MDU file is read from the DIMR configuration file.
MDU_FILENAME=$(sed -n 's/\r//; s/<inputFile>\(.*[.]mdu\)<\/inputFile>/\1/p' $DIMR_FILE | sed -n 's/^\s*\(.*\)\s*$/\1/p')

# Partition data using dflowfm.
if [[ $NTASKS -gt 1 ]]; then
    #pushd dflowfm
    echo "Partitioning parallel model..."
    echo "Run dflowfm on $MDU_FILENAME with $NTASKS partitions."
	# ATTENTION! partitioning is done in the folder where the mdu-file is found
	# you have to `cd` to that location. Ideally we read it from dimr-config
	#cd dflowfm
    sbatch --job-name=partition_${JOB_NAME} \
        --partition=1vcpu \
        --time=00:15:00 \
        --nodes=1 \
        --ntasks-per-node=1 \
        --wait \
        ${DIMR_FOLDER}/lnx64/bin/submit_dflowfm_h7.sh \
            --partition:ndomains=${NTASKS}:icgsolver=6 $MDU_FILENAME
    #popd
	# ATTENTION! partitioning is done in the folder where the mdu-file is found
	# you have to `cd` up
	#cd ..
else
    echo "Sequential model..."
fi

# Run simulation using dimr.
echo "Run simulation..."
sbatch --job-name=$JOB_NAME \
    --partition=$PARTITION \
    --time=$TIME_LIMIT \
    --nodes=$NODES \
    --ntasks-per-node=$TASKS_PER_NODE \
    ${DIMR_FOLDER}/lnx64/bin/submit_dimr_h7.sh -m $DIMR_FILE
