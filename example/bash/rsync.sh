#!/bin/bash
## user:=mrajeev
## cluster:=della.princeton.edu
## -r recurse through sub-directories
## -L transform symlink into reference file/dir
## -v be verbose about printing messages
## -z compresses data before transfer and decompresses after transfer
## -t pass the timestamp when syncing

rsync -rLvzt --update --exclude '*.git' --exclude '.Rproj*' ~/Documents/Projects/subutil/example mrajeev@della.princeton.edu:~/
