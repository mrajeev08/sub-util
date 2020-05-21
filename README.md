Sub-util
================

## Usage

This is a utility for submitting jobs via slurm to remote and pulling
down the job when it’s finished.

For help and usage info, enter `sub -h` on the command line:
```
usage: sub [-h] [--noGPU] [-g] [-mn] [-sn] [-t] [-n] [-mem] [-sp] [-jn] [-wt]
[-@] [-n@] [-st] [-sf] [--runsync] [-no]

Utility for submitting jobs (in this case an R script) to remote cluster. This
uses an rsync to sync from the local directory to the remote directory. You
will need to make a directory \`bash\` where all the bash & slurm scripts will
be stored. In this directory, create an Rsync script with 'rsync' in it's
name, and that has two commented lines specifying your Princeton
email/username and the target cluster (see example/bash/rsync.sh). In each
Rscript you want to run, you can either pass the directories you want to sync
from (syncfrom) from and sync to (syncto) as command line arguments or you can
include them in each Rscript. An example is included in this directory.

optional arguments:
-h, --help           show this help message and exit
--noGPU              Do not write GPU line, pass -g or --gpu to write the
GPU line (default: True)
-g, --gpu
-mn, --multinode     Do not write the node line (multinode jobs with rMPI)
(default: True)
-sn, --single        Write the node line for running job on single node
(default: True)
-t , --time          Number of hours to run (default: 24)
-n , --ntasks        Number of tasks across all nodes (default: 1)
-mem , --memCPU      Megabyte of memory per CPU (default: 4000)
-sp , --scriptPath   Name of R script (default: myscript.R)
-jn , --jobName      Name of job/slurm script (default: myjob)
-wt , --wait         time interval to check if job complete (default: 10m)
-@, --email          whether to email or not (default: True)
-n@, --noemail       don't email (default: True)
-st , --syncto       Directory to pull TO, if NULL will look in Rscript
passed for syncto (default: NULL)
-sf , --syncfrom     Remote directory to pull FROM, if NULL will look in
Rscript passed for syncfrom (default: NULL)
--runsync            Rsyncs up, submits the job, and then pulls down
results. To only pull down results pass -no or --norun
and the script path (see -sp argument) (default: True)
-no, --norun
```
## Setting-up

Add to .bashrc and also add bit that sources it when you start the
terminal (for MacOS)

You'll also need to vpn in to della so that you don't have to duo each time (instructions here) and set up a ssh key?

For the example:

run this

you should see something like this

CTRL + Esc if you want to get out of it (in which case it will pull down
then)

## References

Adapted from princeton computing folks here. Should be easily adaptable
to whatever type of commands/scripts you want to run.

Relies on argparser library in R.

## To Do

[ ]  Add option to use cron instead of rsync for longer jobs (instead of checking schedule a cron task to check every N hours or after X hours)
[ ]  Notification when complete (beepme?)

