# To run this test job, run the following on the command line:
# sub -sn -t 1 -n 1 -sp "test.R" -jn "test" -wt 20s

writeLines("Hello world", con = "hello_world.txt")

# Parse these from bash for where to put things
sync_to <- "~/Documents/Projects/sub-util/example/" # wherever you put this locally
sync_from <- "mrajeev@della.princeton.edu:~/example/" # wherever you put this in della