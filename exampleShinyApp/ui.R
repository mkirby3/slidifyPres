library(shiny)

shinyUI(  # defines  the shiny user interface
    pageWithSidebar(  # "pageWithSidebar()" gives the page format
        headerPanel("US Personal Expenditures"),  # the application title
        
        sidebarPanel(
            selectInput(inputId="ctgy", # This selectInput() fxns HTML label="ctgy"
                        label="Expense Category:",  # <- This fxns printed label
                        choices=c("Food and Tobacco"="FoodandTobacco",
                                  "Household Operation"="HouseholdOperation",
                                  "Medical & Health"="MedicalandHealth",
                                  "Personal Care"="PersonalCare",
                                  "Private Education"="PrivateEducation")),
            a("View Readme File", href="readme.html", target="_blank")
            #submitButton("Submit")  # The submitButton() fxn forces the ui.R
                                    # to wait before sending the input values
                                    # to server.R (until the user hits the 
                                    # "Submit" button)
            
                    # Note: you probably want a "Submit" button if the 
                    # calculations take some time to render, but if the 
                    # calculations are very quick, then there's no need for a 
                    # "Submit" button.
        ),
        
        mainPanel(  # Here we show how to grab and display/render the output
            h3('Line Graph of US Personal Expenditures'),
            h4('Showing:'),
            verbatimTextOutput("inputValue"), # "inputValue" refers to the 
                                              # input value - i.e. "inputValue"
                                              # is the output name that is 
                                              # defined in the server.R script
                           
            plotOutput("ggline")  # "ggline" refers to the 
                                              # output variable "ggline"
                                              # defined in server.R
        )
        
    )    
)

# To run the app:
    # Change to the directory that contains these files and type runApp()
    # Ex:
    # setwd('C:/Users/.../exampleShinyApp')
    # runApp()
# OR
    # runApp('path to directory that contains these files')
    # Ex:
    # runApp('C:/Users/.../exampleShinyApp')

# How a shiny app works:
# By running and playing around with this shiny app, it shows you how you can
# get from your inputs (in the sidebar panel), to the server, then back to the 
# outputs that are displayed in the main panel of the user interface.