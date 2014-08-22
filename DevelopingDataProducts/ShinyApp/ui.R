library(shiny)

library(ISOcodes)

data("ISO_4217")

# Define UI for random distribution application 
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Currency comparison charts"),
        
        # Sidebar with controls to select the random distribution type
        # and number of observations to generate. Note the use of the
        # br() element to introduce extra vertical spacing
        sidebarLayout(
                sidebarPanel(
                        dateRangeInput("daterange", "Date range:",
                                       start = Sys.Date()-365,
                                       end = Sys.Date()),

                        fluidRow(
                                column(4,
                                       selectInput("curr1","CURRENCY1",ISO_4217$Letter,ISO_4217$Letter,selectize=FALSE,selected="NOK",multiple="FALSE"),
                                       selectInput("curr2","CURRENCY2",ISO_4217$Letter,ISO_4217$Letter,selectize=FALSE,selected="SEK",multiple="FALSE")                       
                                ),
                                column(4,
                                       br(),br(),textOutput('curr1name'),
                                       br(),br(),textOutput('curr2name')
                                )),


                                       
                        br(),
                        numericInput(inputId="amount", label = "How much you invested in CURRENCY1",value=60000)
                ),
                
                # Show a tabset that includes a plot, summary, and table view
                # of the generated distribution
                mainPanel(
                        tabsetPanel(type = "tabs", 
                                    tabPanel("Help",includeHTML("instructions.html")),
                                    tabPanel("Charts",plotOutput("plot"))
                        )
                )
        )
))