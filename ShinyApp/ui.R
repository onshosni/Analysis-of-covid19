#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(tidyverse)
library(ggplot2)
library(readr)
library(shiny)
library(leaflet)
library(wordcloud2)

# Define UI for application that draws a histogram
shinyUI(
    navbarPage("Covid-19 Analysis",theme=shinytheme("cyborg"),
               #global cases
               navbarMenu("Global Cases",
                          tabPanel("Numbers",
                                   fluidPage(
                                       titlePanel("Total number of Covid-19 cases Globally"),
                                       
                                       mainPanel(
                                           htmlOutput("confirmed"),
                                           htmlOutput("death"),
                                           htmlOutput("Recovered")
                                       )
                                   )
                                   
                          ),
                          tabPanel("Global Map",
                                   fluidPage(
                                       #titlePanel("Global map of confirmed and death cases"),
                                       mainPanel(
                                           leafletOutput("map1",width = "150%", height = "400px")
                                       )
                                   )
                          ),
                          tabPanel("Analysis",
                                   fluidPage(
                                       titlePanel("What are the important factors in Covid19?"),
                                       mainPanel(
                                           tabsetPanel(
                                               tabPanel("Kmeans clustering based on population",
                                                        plotOutput('final_graph',width = "150%", height = "400px")
                                               ),
                                               tabPanel("PCA on Patients",
                                                        plotOutput('pca',width = "150%", height = "400px")
                                               )
                                               
                                           )
                                       )
                                   ))
               ),#end of global
               #country_level
               navbarMenu("Country Level Cases",
                          tabPanel("trendline",
                                   fluidPage(
                                       
                                       titlePanel("Trendline of Country Level Cases"),
                                       
                                       # Sidebar with a slider input for number of bins 
                                       sidebarLayout(
                                           sidebarPanel(
                                               selectInput("country","Select a country:",choices=conf[,2])
                                           ),
                                           # Show a plot of the generated distribution
                                           mainPanel(
                                               tabsetPanel(
                                                   tabPanel("General(death,conf,rec)",plotOutput("countryg1")),
                                                   tabPanel("Active cases",plotOutput("countryg2"))
                                               )
                                           )
                                       )
                                   )
                          )
               ),#end of country-level
               #Twitter data
               navbarMenu("Twitter data on Covid19",
                          tabPanel("Analytical graphs on text data",
                                   fluidPage(
                                       titlePanel("TextMining on most recent Covid19 tweets"),
                                       # Show a plot of the generated distribution
                                       mainPanel(
                                           tabsetPanel(
                                               tabPanel("Common words",wordcloud2Output("plot1")),
                                               tabPanel("Popular Tweets",tableOutput("table1")),
                                               tabPanel("Sentimental Analysis",plotOutput("plot2")),
                                               tabPanel("Common Languages", plotOutput("plot3"))
                                           )
                                           
                                       )
                                   )
                          )
               )#end of Twitter data
               
    )
)