Sub-util
================

## Usage

This is a utility for submitting jobs via slurm to remote and pulling
down the job when it’s finished.

For help and usage info, enter `sub -h` on the command line:

    usage: sub-util [-h] [--noGPU] [-g] [-mn] [-sn] [-t] [-n] [-mem] [-sp] [-jn]
                    [-wt] [-@] [-n@] [-st] [-sf]
    
    Utility for submitting jobs (in this case an R script) to remote cluster. This
    uses an rsync to sync from the local directory to the remote directory. You
    need to include this script in your directory with 'rsync' in it's name. You
    also need to specify the output you want to pull down (sync_from) and the
    location (sync_to) in your Rscript. An example is included in this directory.
    You also need a folder called bash where all the bash & slurm scripts will be
    stored.
    
    optional arguments:
      -h, --help           show this help message and exit
      --noGPU              Do not write GPU line (default: True)
      -g, --gpu            Write the GPU line (default: True)
      -mn, --multinode     Do not write the node line (multinode jobs with rMPI)
                           (default: True)
      -sn, --single        Write the node line for running job on single node
                           (default: True)
      -t , --time          Number of hours to run (default: 24)
      -n , --ntasks        Number of tasks across all nodes (default: 1)
      -mem , --memCPU      Megabyte of memory per CPU (default: 4000)
      -sp , --scriptPath   Name of R script (default: myscript.R)
      -jn , --jobName      Name of job/slurm script (default: myjob)
      -wt , --wait         time to wait before checking if job complete (default:
                           1m)
      -@, --email          whether to email or not (default: True)
      -n@, --noemail       don't email (default: True)
      -st , --syncto       Directory to pull TO, if NULL so will look in Rscript
                           passed for sync_to (default: NULL)
      -sf , --syncfrom     Remote directory to pull FROM, if NULL will look in
                           Rscript passed for sync_from (default: NULL)

## Setting-up

The main bits you’ll need are

First, clone & edit so that your email is passed through.

Then add to .bashrc and also add bit that sources it when you start the
terminal (for MacOS)

For the example:

run this

you should see something like this

CTRL + Esc if you want to get out of it (in which case it will pull down
then)

## References

Adapted from princeton computing folks here. Should be easily adaptable
to whatever type of commands/scripts you want to run.

Relies on argparser library in R.

## Extensions

[ ] Add option to use cron instead of rsync for longer jobs
[ ] More flexible abt user & type of script being run
