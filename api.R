library(vetiver)
library(plumber)

v <- readRDS("fm-housing-vetiver.rds")

pr() |>
  vetiver_api(v) |>
  pr_run(port = 8080)
