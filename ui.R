library(shiny)
library(plotly)

 shinyUI(fluidPage( 
  # Application title
   titlePanel("Taipower"), # page title
  # Sidebar with a slider input for the number of bins
    sidebarLayout(
      sidebarPanel(
      dateInput("date1",
                "Date:",
                min = "2020-01-01",
                max = "2021-04-30",
                value = "2020-08-21",
                ),
      br(),
      checkboxGroupInput("select_type","type:",choices = check_box),
      submitButton("Submit")
      ),
      # add button
        mainPanel(
             plotlyOutput("piePlot"), #output ID
             plotlyOutput("piePlot1"), #output ID
             plotlyOutput("barPlot"), #output ID
             plotlyOutput("linePlot")
          )
  )))
