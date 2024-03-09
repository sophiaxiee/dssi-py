model = readRDS("../models/car_price.rds")# this is the model that we saved earlier in Step 1

#* @apiTitle Car price API
#* @apiDescription Resale of used cars in the US market


#* Test connection
#* @get /connected
function(){
  list(status = paste("Welcome", Sys.getenv('username'), "to DSSI. We are a go!"),
       time = Sys.time())
  }

## Model: Price ~ Age + KM + FuelType + HP + Automatic + CC + Weight

#* predict the price of a used car
#* 
#* @param Age this is the age of the car as input by the user
#* @param KM distance ran in kms
#* @param FuelType takes one of the 3 values out of Diesel/Petrol/CNG
#* @param HP horsepower
#* @param Automatic 1 or 0
#* @param CC vehicle fuel capacity
#* @param Doors 2/3/4/5 doors
#* @param Weight weight of vehicle

#* @post /predict
function(Age, KM, FuelType, HP, Automatic, CC, Doors, Weight){
  newdata = data.frame(Age = as.numeric(Age), KM = as.numeric(KM),
                       FuelType = FuelType, HP = as.numeric(HP),
                       Automatic = as.numeric(Automatic),
                       CC = as.numeric(CC), Doors = as.numeric(Doors),
                       Weight = as.numeric(Weight)) 
  
  # predict car price using predict function in R
  predict(model, newdata)
  }
