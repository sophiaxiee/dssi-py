#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/


#* Plot a scatter plot
#* @serializer jpeg
#* GET is used to request data from a specified resource.
#* @get /scatter
function(){
        rand = rnorm(100)
        rand2 = rnorm(100)
        plot(rand, rand2, main='Scatter Plot')
}

#* compute and return BMI given weight and height
#* @param ht height of a person in meters
#* @param wt weight of a person in kilograms
#* @post /bmi
function(ht, wt){
  as.numeric(wt)/(as.numeric(ht)**2)
}

## https://www.healthhub.sg/programmes/93/bmi-calculator
