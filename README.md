Sub 
================

## Usage

This is a bash command line tool for submitting jobs via slurm to remote and pulling
down the results when it’s finished.

For help and usage info, enter `sub -h` on the command line:
```
usage: sub [-h] [--noGPU] [-g] [-mn] [-sn] [-t] [-n] [-mem] [-sp] [-jn] [-wt]
           [-@] [-n@] [-st] [-sf] [--runsync] [-no] [-md]

Utility for submitting jobs (in this case an R script) to remote cluster. This
uses an rsync to sync from the local directory to the remote directory. You
will need to create an Rsync script with 'subrsync' in it's name that has
three commented lines of the format: ## user:={username} (specifies username);
## cluster:={cluster} (specifies cluster); and ## dirput:={dir} (specifies
where to put all your shell & slurm scripts). In each Rscript you want to run,
you can either pass the directories you want to sync from (syncfrom) from and
sync to (syncto) as command line arguments or you can include them in the
script itself. An example is included in this directory.

optional arguments:
  -h, --help           show this help message and exit
  --noGPU              Do not write GPU line, pass -g or --gpu to write the
                       GPU line
  -g, --gpu
  -mn, --multinode     Do not write the node line (multinode jobs with rMPI)
  -sn, --single        Write the node line for running job on single node
  -t , --time          Number of hours to run
  -n , --ntasks        Number of tasks across all nodes
  -mem , --memCPU      Megabyte of memory per CPU
  -sp , --scriptPath   Name of R script
  -jn , --jobName      Name of job/slurm script
  -wt , --wait         time interval to check if job complete
  -@, --email          whether to email or not
  -n@, --noemail       don't email
  -st , --syncto       Directory to pull TO, if NULL will look in Rscript
                       passed for syncto
  -sf , --syncfrom     Remote directory to pull FROM, if NULL will look in
                       Rscript passed for syncfrom
  --runsync            Rsyncs up, submits the job, and then pulls down
                       results. To only pull down results pass -no or --norun
                       and the script path (see -sp argument)
  -no, --norun
  -md , --modules      Other modules to load in slurm script, should be passed
                       as string of module names separated by a space and in
                       quotes
```

## Setting-up

For MacOS & terminal:

1. Add the following line to your `.bash_profile` file.
```
if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi
```
2. Add the following line to your `.bashrc` file.
```
export PATH=$PATH:{path/to/subutil}
```

Also you may need to make the sub file executable first, run this line in terminal from the directory the file is in: ```chmod u+x sub```

You will also need to VPN in to della (even if you are on a campus connection) so that you don't have to duo each time and you will need to [set up an sshkey](https://github.com/PrincetonUniversity/removing_tedium/tree/master/02_passwordless_logins).

## Example

In the [example](example/) folder, you will find a test case you can run.

First, download or clone the directory to your local computer. 
```
git clone https://github.com/mrajeev08/subutil.git
```

Change the rsync paths & username as to yours and then open terminal and try:
```
cd example
sub -sn -t 1 -n 1 -sp "example/test.R" -jn "test" -wt 20s
```

Note that in the example, I use the R package `here` to manage the nested directories. 

## Hat tip 

Thanks to this really useful worksop [on removing tedium from your research workflow](https://github.com/PrincetonUniversity/removing_tedium) and @jdh4 for the inspiration and bash help session, and also to [shellcheck](https://www.shellcheck.net), a very useful tool for checking your scripts.

Dependencies:
- R (version 3.6.0 or higher)
- [argparser](https://github.com/trevorld/r-argparse) package which requires python 

## To Do
- [ ] Longer jobs?
- [ ] Array jobs?
- [ ] Switch to [docopt](https://github.com/docopt/docopt.R) for fewer dependencies & cleaner code?
