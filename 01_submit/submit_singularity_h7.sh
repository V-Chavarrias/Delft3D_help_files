#! /bin/bash
#SBATCH --job-name=QHag20_QRMM700_nosurge
#SBATCH --exclusive
#SBATCH --partition=48vcpu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48

module purge
module load apptainer/1.1.8
module load intelmpi/2021.9.0

#---You will need to modify the input below this line---

# The root folder of the model, i.e. the folder that contains ALL of the input files and sub-folders:
#modelFolder=/p/11208440-hpc-benchmark-set/tests_h7_linux-cluster/delft3dfm/dflowfm3d-ijsselmeer-j19_6-v2a
# Or, for large models that generate a lot of output, copying the model to your scratch file space '/scratch-shared/<username>' and running from there might be faster.
# See: https://servicedesk.surf.nl/wiki/display/WIKI/Snellius+hardware+and+file+systems#Snelliushardwareandfilesystems-Filesystems
# Don't forget to copy your results back to a permanent location on Snellius since data on the scratch space is removed automatically!

# The folder containing the dimr config file:
dimrconfigFolder=${PWD}
mdufileFolder=${PWD}
###dimrFile=dimr_config.xml

singularityFolder=/p/11209260-001-rmm-hagestein/05_3Dmodel/02_model/02_simulations/matrix_h7/2023.02_sif

PROCESSSTR="$(seq -s " " 0 $((nPart-1)))"
sed -i "s/\(<process.*>\)[^<>]*\(<\/process.*\)/\1$PROCESSSTR\2/" $dimrFile
# Retrieve the name of the mduFile from dimrFile.
###mduFile="$(sed -n 's/\r//; s/<inputFile>\(.*\).mdu<\/inputFile>/\1/p' $dimrFile)".mdu
mduFile=RMM_dflowfm.mdu

echo ""
echo "Partitioning..."
cd $mdufileFolder
srun -n 1 $singularityFolder/execute_singularity_h7_cdm.sh -p 3 run_dflowfm.sh --partition:ndomains=$SLURM_NTASKS:icgsolver=6 $mduFile

echo ""
echo "Simulation..."
cd $dimrconfigFolder
srun $singularityFolder/execute_singularity_h7_cdm.sh -p 3 run_dflowfm.sh $mduFile