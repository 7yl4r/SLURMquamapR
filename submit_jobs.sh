#!/bin/bash
#SBATCH --job-name ="mbon_aquamaps"
#SBATCH --nodes=1
#SBATCH --array=0-2
## Can submit up to 10,000 jobs at once, but only 512 will run concurrently
## ============================================================================
## This script is used to submit a set of jobs (defined by array above)
## to a SLURM supercomputer scheduler.
## Works together with species_names.txt - a text file with one species 
## identifier per line.
## The array above selects the line numbers from this file that get submitted.
## ============================================================================
# Python code to check processing time:
#    starttime = datetime.today()
#    LogMsg('Image: %s' %(info.srcfn))
set -e

# === Set up input arguments & file locations
TYLAR_DIR=/work/t/tylarmurray
CODE_REPO_DIR=$TYLAR_DIR/repos/SLURMquamapR
DATA_DIR=$TYLAR_DIR/data  # TODO: set in + out data dirs

# === get species name from file
species_names=`cat $CODE_REPO_DIR/species_names.txt`
species_names_arr=($species_names)  # cast to bash array
species_name=${species_names_arr[$SLURM_ARRAY_TASK_ID]}
echo running for species \"$species_name\"

OUTPUT_FILEPATH=$DATA_DIR/$species_name.tif

## === Run the code
expected_output_filepath=$DATA_DIR/$species_name.filetype  # TODO
if [ ! -f $OUTPUT_FILEPATH ]; then  # if output file DNE
    module load apps/R/4.0.5
    Rscript $CODE_REPO_DIR/test_script.R $species_name  # TODO: create this script
fi

#### Calculate Total Time
#   endtime = datetime.today()
#   td = (endtime-starttime)
#   LogMsg("Total Processing Time: %s\n" %(td))
