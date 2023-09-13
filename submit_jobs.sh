#!/bin/bash
#SBATCH --job-name ="mbon_aquamaps"
#SBATCH --nodes=1
#SBATCH --TIME=3:00:00
#SBATCH --array=0-199
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

# === Set up input arguments & file locations
TYLAR_DIR=/work/t/tylarmurray
CODE_REPO_DIR=$TYLAR_DIR/repos/SLURMquamapR
DATA_DIR=$TYLAR_DIR/data  # TODO: set in + out data dirs

# === get species name from file
species_names=`cat $CODE_REPO_DIR/species_names.txt`
species_names_arr=($species_name)  # cast to bash array
species_name=${species_name_arr[$SLURM_ARRAY_TASK_ID]}

## === Run the code
expected_output_filepath=$DATA_DIR/$species_name.filetype  # TODO
if [ ! -f $image2 ]; then  # if output file DNE
    module add apps/R/???  # TODO: find an R module?
    Rscript /path/to/bens_script.R $species_name  # TODO: create this script
fi

#### Calculate Total Time
#   endtime = datetime.today()
#   td = (endtime-starttime)
#   LogMsg("Total Processing Time: %s\n" %(td))
