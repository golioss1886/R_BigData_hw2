library(shiny)
library(plotly)
library(stringr)

# Define server logic required to draw a histogram
 shinyServer(function(input, output) {
    #output$distPlot <- renderPlot({
    anchor <- as.Date("2020-01-01")
    
    output$piePlot <- renderPlotly({
     inputDate <-  input$date1 
     rIdx <- as.numeric(inputDate - anchor) + 1
     values <- c(Nuclear[rIdx],Coal[rIdx],IPP_Coal[rIdx],Co_Gen[rIdx],LNG[rIdx],IPP_LNG[rIdx],Oil[rIdx],Hydro[rIdx],Wind[rIdx],Solar[rIdx])
     fig <- plot_ly(labels = labels,values = values ,type = "pie")
      })  
    
    output$piePlot1 <- renderPlotly({https://github.com/golioss1886/R_BigData_hw2/blob/main/server.R
     inputDate <-  input$date1 
     rIdx <- as.numeric(inputDate - anchor) + 1
     #values <- c(Nuclear[rIdx],Coal[rIdx],IPP_Coal[rIdx],Co_Gen[rIdx],LNG[rIdx],IPP_LNG[rIdx],Oil[rIdx],Hydro[rIdx],Wind[rIdx],Solar[rIdx])
     values_three_type <- c(Nuclear[rIdx], Total_Fire[rIdx], Total_Green[rIdx])
     fig <- plot_ly(labels = labels_three_type, values = values_three_type, type = "pie")
      })  
    
    output$barPlot <- renderPlotly({
      inputDate <- input$date1
      rIdx <- as.numeric(inputDate - anchor) + 1
      plot_ly( y = summit_supply[rIdx],type = "bar", name = "淨尖峰供電能力(MW)") %>%
        add_trace(y = summit_affort[rIdx], type = 'bar', name = "尖峰負載(MW)") %>%
        layout(barmode = 'overlay')
      # fig <- fig %>% add_histogram(y = summit_affort[rIdx])
      # fig <- fig %>% layout(barmode = 'overlay')
        # x = c("淨尖峰供電能力(MW)","尖峰負載(MW)"),
        # y = c(summit_supply[rIdx],summit_affort[rIdx]),
        # type = "bar"
    })
    output$linePlot <- renderPlotly ({
    #fig <- plot_ly(df_tmp,x = ~df_tmp[,1],y = ~df_tmp[,4] ,type = 'scatter',mode = 'lines')
      fig <- plot_ly()#???
      for (i in input$select_type) {
        str_tmp <- i
        str_tmp <- str_replace(str_tmp,pattern = "\\(",replacement = "\\.")
        str_tmp <- str_replace(str_tmp,pattern = "\\)",replacement = "\\.")
        idx <- which(colnames(df_tmp) == str_tmp)
        print(idx)
        # turn input$select_type to ? and first no have line in plot
        #print(df_tmp$i)
        # print(str_tmp)
        # print(df_tmp$str_tmp)
        # name
        fig <- add_trace(fig, x = df_tmp[,1], y = df_tmp[,idx]
                         ,type = 'scatter',mode = 'lines', name = i)
      }
      print(fig)
    })
    
   })
