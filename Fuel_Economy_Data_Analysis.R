install.packages("ggplot2")
library(ggplot2)
# Access the mpg dataset and store it in a variable called mpg_data
mpg_data <- ggplot2::mpg
#Make data ready for analysis doing preprocessing techniques
head(mpg_data)
table(mpg_data)
summary(mpg_data)
str(mpg_data)
# Handling Missing Data (if any)
na.omit(mpg_data)
# Data Visualization
# Example: Scatter plot of 'cty' (city miles per gallon) against 'hwy' (highway miles per gallon)
plot(mpg_data$cty, mpg_data$hwy, xlab = "City MPG", ylab = "Highway MPG", main = "City vs. Highway MPG")
#Fit Generalized Linear Model using H2O in R
library(h2o)
# Convert the data frame 'my_data' to an H2O frame
h2o.init()
my_data_h2o <- as.h2o(mpg_data)
# Specify the response column and predictor columns
response_column <- "cty"
predictors <- c("year", "cyl", "displ")

# Fit the GLM model
glm_model <- h2o.glm(y = response_column,
                     x = predictors,
                     training_frame = my_data_h2o,
                     family = "gaussian")
# View the model summary
summary(glm_model)

# Print the coefficients table
coefficients_table <- as.data.frame(coef(glm_model))
print(coefficients_table)



