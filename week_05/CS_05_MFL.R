##Micaela Lipman 
##Case Study 5 

library(spData)
library(sf)
library(tidyverse)
# library(units) #this one is optional, but can help with unit conversions.

#load 'world' data from spData package
data(world)  

# load 'states' boundaries from spData package
data(us_states)
#plot
plot(world[1])  
plot(us_states[1]) 

##World Data Cleaning
#project
albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

world_projected <- st_transform(world, crs = albers)
#filter
canada<-world_projected %>%
filter(name_long=="Canada") %>%
st_buffer(dist = 10000)


##US data cleaning
us_projected <- st_transform(us_states, crs = albers)
newyork<-us_projected %>%
  filter(NAME == "New York")

##Create border object
border<-st_intersection(canada, newyork)

##map
ggplot(border) + 
  geom_sf(data=newyork) + 
  geom_sf(data=border, fill="red") +
  ggtitle("New York Land within 10km")


#calculate border area
borderarea<-(st_area(border)/10000)
borderarea
