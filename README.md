# SLURMquamapR
R scripts to generate aquamaps using SLURM supercomputing scheduler

# usage
Here we assume you have a USF account on the CIRCE supercomputing cluster or similar SLURM scheduler.

1. `ssh tylarmurray@circe.rc.usf.edu`  # sign into an access node.
2. `cd /work/t/tylarmurray/repos/SLURMquamapR/`  # move to repo location.
3. `git pull`  # ensure code is updated
4. edit `sbatch submit_jobs.sh` to set `#SBATCH --array=` (and others) as desired
    * to set `array` to all species use the output of `cat species_names.txt | wc -l`
6. `sbatch submit_jobs.sh`  # submit the jobs
7. `watch squeue -u tylarmurray`  # watch your jobs in action (ctrl-C to stop)
8. once complete the .out files will include logs for each jobs and the data files will be in place if the processes succeeded.
