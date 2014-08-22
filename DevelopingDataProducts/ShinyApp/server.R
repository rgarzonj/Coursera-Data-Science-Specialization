library(shiny)
library(ISOcodes)
library(tseries)
library(stringr)

data("ISO_4217")

# Define server logic for random distribution application
shinyServer(function(input, output) {
        output$curr1name <- renderText({ISO_4217$Currency[which(ISO_4217$Letter == input$curr1)]})
        output$curr2name <- renderText({ISO_4217$Currency[which(ISO_4217$Letter == input$curr2)]})

        # Generate a plot of the data. Also uses the inputs to build
        # the plot label. Note that the dependencies on both the inputs
        # and the data reactive expression are both tracked, and
        # all expressions are called in the sequence implied by the
        # dependency graph
        curr1.curr2 <- reactive({get.hist.quote(instrument = paste(input$curr1,input$curr2,sep="/"), provider = "oanda", 
                          start = as.character(input$daterange[1]),end=as.character(input$daterange[2]))})
        
        output$plot <- renderPlot({
                plot(input$amount*curr1.curr2(), xlab="Time", ylab=input$curr2)
        })
        
        
})