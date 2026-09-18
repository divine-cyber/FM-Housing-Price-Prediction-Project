library(vetiver)
library(plumber)

v <- readRDS("C:/Users/divin/OneDrive/Desktop/FM - Housing Prediction Project/fm-housing-vetiver.rds")

pr() |>
  vetiver_api(v) |>
  pr_run(port = 8080)