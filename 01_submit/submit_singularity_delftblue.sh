#! /bin/bash

# Usage: 
#   - Modify this script where needed (e.g. number of nodes, number of tasks per node, Singularity (Apptainer) version, model folder).
#   - Execute this script from the command line using:
#     sbatch ./submit_singularity_h7.sh
#
# This is an h7 specific script for single or multi-node simulations

#SBATCH --ntasks=16               # Number of nodes.
#SBATCH --cpus-per-task=1     # The number of tasks to be invoked on each node.
                                # Note: SLURM_NTASKS is equal to "--nodes" multiplied by "--ntasks-per-node" 
#SBATCH --job-name=dimr         # Specify a name for the job allocation. 
#SBATCH --time 12:00:00         # Set a limit on the total run time of the job allocation.                                 # In many cases this option can be omitted.
#SBATCH --partition=compute
#SBATCH --account=research-ceg-he
#SBATCH --mem-per-cpu=2G								


#--- Load modules ---
module load 2022r2
module load intel/oneapi-all

#--- Setup the model ---
# The folder containing the Singularity (Apptainer) container:
containerFolder=/scratch/$USER/software

# The folder containing the 'execute_singularity_h7.sh' script:
scriptsFolder=$containerFolder

# The ROOT folder of the model, i.e. the folder that contains ALL of the input files and sub-folders:
modelFolder=${PWD}

# The folder containing the mdu file:
mdufileFolder=$modelFolder/dflowfm

# The folder containing the dimr config file:
dimrconfigFolder=$modelFolder

# The name of the dimr config file. This file must already exist!
dimrFile=dimr.xml

# Stop after an error occurred:
set -euo pipefail

# Replace the number of processes in dimr config file. 
PROCESSSTR="$(seq -s " " 0 $((SLURM_NTASKS-1)))"
sed -i "s/\(<process.*>\)[^<>]*\(<\/process.*\)/\1$PROCESSSTR\2/" $dimrconfigFolder/$dimrFile



# Read MDU file from DIMR file
mduFile="$(sed -n 's/\r//; s/<inputFile>\(.*\).mdu<\/inputFile>/\1/p' $dimrconfigFolder/$dimrFile)".mdu

if [ $SLURM_NTASKS -gt 1 ]; then  
#--- Partition ---
echo ""
echo "Partitioning..."
cd $mdufileFolder
echo "Partitioning in folder ${PWD}"
srun -n 1 -N 1 $scriptsFolder/execute_singularity_delftblue.sh -c $containerFolder -m $modelFolder dflowfm --nodisplay --autostartstop --partition:ndomains="$SLURM_NTASKS":icgsolver=6 "$mduFile" 
else 
#--- No partitioning ---
echo ""
echo "Single domain run..."
fi 

echo ""
echo "Simulation..."
cd $dimrconfigFolder
echo "Computing in folder ${PWD}"
srun $scriptsFolder/execute_singularity_delftblue.sh -c $containerFolder -m $modelFolder dimr "$dimrFile"

