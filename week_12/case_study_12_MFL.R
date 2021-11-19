##Case Study 12
##Micaela Lipman 
##GEO 511


##load libraries
library(dplyr)
library(ggplot2)
library(ggmap)
library(htmlwidgets)
library(widgetframe)
library(tidyverse)
library(rnoaa)
library(xts)
library(dygraphs)

##download daily weather data 
d=meteo_tidy_ghcnd("USW00014733",
                   date_min = "2016-01-01", 
                   var = c("TMAX"),
                   keep_flags=T) %>% 
  mutate(date=as.Date(date),
         tmax=as.numeric(tmax)/10) #Divide the tmax data by 10 to convert to degrees.

##Convert d into an xts time series object
dxts <- xts(x = d$tmax, order.by=d$date)
## draw the plot
dygraph(dxts, main="Daily Maximum Temperature in Buffalo, NY") %>%
  dyRangeSelector(dateWindow = c("2020-01-01", "2020-10-31")) 

