###Case Study 6
###Micaela Lipman 
###October 12, 2021

##Load packages 
#install.packages("raster")
#install.packages("sf")
#install.packages("sp")
#install.packages("spData")
#install.packages("tidyverse")
#install.packages ("ncdf4")
library(sp)
library(spData)
library(tidyverse)
library(sf)
library(raster)
library (ncdf4)

###Uploading data 
library(ncdf4)
download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc","crudata.nc")
tmean=raster("crudata.nc")

###Filter out antarctica
data (world)
str(world) 
View(world)
countries <-filter (world, continent != "Antarctica") 

###Convert the world object to sp format
  countries_sp<-as(countries, "Spatial") 
  tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)
  tmax_monthly
  plot(tmax_monthly)

  ###convert to degrees celcius by dividing by 10 
gain(tmax_monthly)=.1
  

###find annual max in each country
plot(tmax_monthly)
tmax_annual <-max(tmax_monthly)
names(tmax_annual) <- "tmax"
polygon_max_country<-raster::extract(tmax_annual, countries_sp, fun=max, na.rm=TRUE, small=TRUE, sp=TRUE) 
polygon_max_country <- st_as_sf(polygon_max_country)

polygon_max_country

###map the results
ggplot()+
geom_sf(data=polygon_max_country, aes(fill=tmax))+
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)") + 
  theme(legend.position = 'bottom')

