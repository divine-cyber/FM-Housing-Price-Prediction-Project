# FM Housing Price Prediction Project

This project uses housing data from Fargo-Moorhead to predict the sold price of residential properties.

## Project Overview

The project includes:

- A Random Forest model for predicting Sold Price
- A Vetiver API for serving the model locally
- A Shiny app that allows users to enter house characteristics and receive a predicted sold price
- A static webpage showing the model visualizations and performance

## Model Performance

The model was evaluated on a testing set of 3,154 properties.

- R-squared: 93.4%
- MAE: $8,126
- RMSE: $35,380

The model performed well overall, although predictions were less accurate for some of the highest-priced properties.

## Static Project Website

The project visualizations and model results are available here:

https://divine-cyber.github.io/FM-Housing-Price-Prediction-Project/

## Running the Shiny App

The Shiny app uses a locally hosted Vetiver API.

### 1. Download the model

Download `fm-housing-vetiver.rds` from the project's GitHub Release and place it in the same folder as `api.R` and `app.R`.

### 2. Install the required R packages

```r
install.packages(c(
  "shiny",
  "httr2",
  "jsonlite",
  "tibble",
  "vetiver",
  "plumber",
  "ranger"
))
3. Start the API

Open api.R in RStudio and run it.

The API will run locally at:

http://127.0.0.1:8080

4. Start the Shiny app

Open a second RStudio session and run app.R.

The Shiny app will open in a browser.

5. Make a prediction

Enter the characteristics of a house and click Predict Sold Price.

The Shiny app sends the house information to the locally hosted Vetiver API, which uses the Random Forest model to generate the predicted sold price.

Files
index.html - Static project webpage
index.Rmd - R Markdown source for the webpage
app.R - Shiny application
api.R - Local Vetiver API
fm-housing-vetiver.rds - Trained Vetiver model, available through the GitHub Release
Tools Used

R, Random Forest, ranger, Vetiver, Plumber, Shiny, ggplot2, tidyverse

