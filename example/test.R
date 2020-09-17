# To run this test job, run the following on the command line:
# sub -sn -t 1 -n 1 -sp "example/test.R" -jn "test" -wt 20s # testing with single node
# sub -t 1 -n 1 -sp "example/test.R" -jn "test" -wt 20s # testing with mpi
# sub -t 1 -n 1 -sp "example/test.R" -jn "test" -md "rh/devtoolset/8 gdal" -wt 20s # testing with module loads
# sub -t 1 -n 1 -sp "example/test.R" --pulldown -wt 20s # testing pull down output from script only
# pass --dry to any of these to see which commands will be run without running them
library(here)
here::here()
writeLines("Hello world", con = here("example/hello_world.txt"))

# Parse these from bash for where to put things
syncto <- "~/Documents/Projects/subutil/example/" # wherever you want to put this locally
syncfrom <- "mrajeev@della.princeton.edu:~/subutil/example/hello*" # wherever you put this in della