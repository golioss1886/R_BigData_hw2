library(shiny)
library(plotly)

 shinyUI(fluidPage( 
  # Application title
   titlePanel("Taipower"), # page title
  # Sidebar with a slider input for the number of bins
    sidebarLayout(
      dateInput("date1",
                "Date:",
                min = "2020-01-01",
                max = "2021-04-30",
                value = "2020-08-21",
                ),
      # dateInput(
      # ),
        # sidebarPanel(
        #     sliderInput("bins", # input ID
        #                  "Number of bins:", #label
        #                  min = 1,
        #                  max = 50,
        #                  value = 30) #default value
        #   ),  
    # Show a plot of the generated distribution
        mainPanel(
            # plotOutput("distPlot") #output ID
             plotlyOutput("piePlot") #output ID
          )
      )
  ))
