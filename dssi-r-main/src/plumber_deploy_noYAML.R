library(plumber)
library(jsonlite)

setwd("D:/Workspace/R/dssi")
pr = plumb("src/deploy_noYAML.R")

pr$run(port = 8000)
