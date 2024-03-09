# call in the libraries

#install.packages("pacman")# run this only once if you do not have pacman package

pacman::p_load(tidyverse, caret, corrplot,car, relaimpo)

# set path to folder containing data on your computer
# I have set the directory on my computer using setwd() function

setwd("D:/Workspace/R/dssi")

# read the data file & inspect it's structure
cars = read.csv('data/cars.csv')
summary(cars)

#set initial seed for reproducibility
set.seed(123)

# collect the data indices returned in a list
inds = createDataPartition(cars$Price, p=0.7, list=FALSE,times=1)

train_set = cars[inds,]

test_set = cars[-inds,]

# initial model with the transformed variables s_Age, s_KM
# train_set
model = lm(Price ~. , data = train_set)

final_model = stepAIC(model)
summary(final_model)

# save your final
saveRDS(final_model, "models/car_price.rds")
# RDS (R Data Serialization) files are a common format for saving R objects in RStudio, 
# and they allow you to preserve the state of an object between R sessions.
