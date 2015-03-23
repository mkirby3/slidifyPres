library(shiny)
library(ggplot2)
library(stats)
library(scales)

# Run the R script that cleans the raw dataset.
source('cleanAndSaveDfToRDS.R')

# Assign the saved .rds data object/file to a variable
cleanDat <- readRDS("data/df.rds")

shinyServer(
    function(input,  # the input being passed to the function
             output) {  # the output 
        output$inputValue <- renderPrint({input$ctgy}) 
        
        output$ggline <- renderPlot({  
            # check for the input variable
            if (input$ctgy == "FoodandTobacco") {
                
                expDat <- data.frame(Year = cleanDat$Year, Expense = cleanDat[[input$ctgy]])
            }
            else if (input$ctgy == "HouseholdOperation"){

                expDat <- data.frame(Year = cleanDat$Year, Expense = cleanDat[[input$ctgy]])
            } else if (input$ctgy == "MedicalandHealth"){
                
                expDat <- data.frame(Year = cleanDat$Year, Expense = cleanDat[[input$ctgy]])
            } else if (input$ctgy == "PersonalCare"){
                
                expDat <- data.frame(Year = cleanDat$Year, Expense = cleanDat[[input$ctgy]])
            } else if (input$ctgy == "PrivateEducation"){
                
                expDat <- data.frame(Year = cleanDat$Year, Expense = cleanDat[[input$ctgy]])
            } 
            
            p <- ggplot(expDat, aes(Year, Expense)) + 
                geom_line(size=1.35, colour="darkgreen") + 
                geom_ribbon(aes(x=Year, 
                            ymin=Expense-mad(Expense), 
                            ymax=Expense+mad(Expense)), alpha=0.20, fill="blue") +
                ylab(input$ctgy) +
                theme(text=element_text(size=24)) 
            print(p)
        })
    }
)
