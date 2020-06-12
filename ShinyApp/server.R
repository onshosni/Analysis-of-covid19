#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$confirmed<-renderText({
        paste("<h5 style=text-align:center>Total number of Confirmed cases around the world :</h5>",
              "<h5 style=text-align:center> <font color=\"#FF0000\"><b>",sum(conf[,ncol(conf)]),"</h5>")})
    
    output$death<-renderText({
        paste("<h5 style=text-align:center>Total number of Death cases around the world :</h5>",
              "<h5 style=text-align:center> <font color=\"#FF0000\"><b>",sum(death[,ncol(death)]),"</h5>")})
    
    output$Recovered<-renderText({
        paste("<h5 style=text-align:center>Total number of Recovered cases around the world :</h5>",
              "<h5 style=text-align:center> <font color=\"#FF0000\"><b>",sum(rec[,ncol(rec)]),"</h5>")})
    
    
    output$map1<-renderLeaflet({
        map1
    })
    output$final_graph<- renderPlot({
        final_graph
    })
    output$pca<-renderPlot({
        graph_pca
    })
    
    output$countryg1<- renderPlot({
        graph1(input$country)})
    output$countryg2<- renderPlot({
        graph4(input$country)})
    
    output$plot1<-renderWordcloud2({plot1})
    output$plot2<-renderPlot({plot2})
    output$plot3<-renderPlot({plot3})
    output$table1<-renderTable({
        head(t1,20)
    })
})