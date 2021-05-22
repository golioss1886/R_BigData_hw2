library(shiny)
library(plotly)

# Define server logic required to draw a histogram
 shinyServer(function(input, output) {
    #output$distPlot <- renderPlot({
    anchor <- as.Date("2020-01-01")
    output$piePlot <- renderPlotly({
     inputDate <-  input$date1 
     rIdx <- as.numeric(inputDate - anchor) + 1
    #     x    = iris[, 2]  # Iris dataset (Sepal.Width)
    #     bins = seq(min(x), max(x), length.out = input$bins + 1)
    # # draw the histogram with the specified number of bins
    #     hist(x, breaks = bins, col = 'darkgray', border = 'white')
     fig <- plot_ly(labels = labels,values = c(nuclear[rIdx],fire[rIdx],Coal[rIdx]) ,type = "pie")
      })  
   })
