library(shiny)
library(httr2)
library(jsonlite)
library(tibble)

ui <- fluidPage(
  titlePanel("FM Housing Price Predictor"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("list_price", "List Price", value = 250000),
      numericInput("original_list_price", "Original List Price", value = 250000),
      numericInput("total_sqft", "Total Square Feet", value = 1500),
      numericInput("year_built", "Year Built", value = 2000),
      numericInput("total_bedrooms", "Total Bedrooms", value = 3),
      numericInput("total_bathrooms", "Total Bathrooms", value = 2),
      numericInput("garage_stalls", "Garage Stalls", value = 2),
      numericInput("lot_size_sqft", "Lot Size (Sq Ft)", value = 8000),
      numericInput("above_grade_finished", "Above Grade Finished Area", value = 1500),
      numericInput("below_grade_finished", "Below Grade Finished Area", value = 0),
      numericInput("above_grade_unfinished", "Above Grade Unfinished Area", value = 0),
      numericInput("below_grade_unfinished", "Below Grade Unfinished Area", value = 0),
      
      textInput("property_type", "Property Type", value = "Single Family"),
      textInput("style", "Style", value = "1 Story"),
      textInput("city", "City", value = "Fargo"),
      textInput("county", "County", value = "Cass"),
      textInput("garage_type", "Garage Type", value = "Attached"),
      
      actionButton("predict", "Predict Sold Price")
    ),
    
    mainPanel(
      h2("Predicted Sold Price"),
      textOutput("prediction")
    )
  )
)

server <- function(input, output, session) {
  
  output$prediction <- renderText({
    req(input$predict)
    
    new_house <- tibble(
      list_price = input$list_price,
      original_list_price = input$original_list_price,
      total_sqft = input$total_sqft,
      year_built = input$year_built,
      total_bedrooms = input$total_bedrooms,
      total_bathrooms = input$total_bathrooms,
      garage_stalls = input$garage_stalls,
      lot_size_sqft = input$lot_size_sqft,
      above_grade_finished = input$above_grade_finished,
      below_grade_finished = input$below_grade_finished,
      above_grade_unfinished = input$above_grade_unfinished,
      below_grade_unfinished = input$below_grade_unfinished,
      property_type = input$property_type,
      style = input$style,
      city = input$city,
      county = input$county,
      garage_type = input$garage_type
    )
    
    response <- request("http://127.0.0.1:8080/predict") |>
      req_body_json(new_house) |>
      req_perform()
    
    result <- resp_body_json(response)
    
    paste0(
      "$",
      format(round(result$.pred, 2), big.mark = ",", nsmall = 2)
    )
  })
}

shinyApp(ui = ui, server = server)