#Case Study 9 
#November 2, 2021
#Micaela Lipman 

library(sf)
library(tidyverse)
library(ggmap)
library(rnoaa)
library(spData)
data(world)
data(us_states)

# Download zipped data from noaa with storm track information
dataurl="https://www.ncei.noaa.gov/data/international-best-track-archive-for-climate-stewardship-ibtracs/v04r00/access/shapefile/IBTrACS.NA.list.v04r00.points.zip"
tdir=tempdir()
download.file(dataurl,destfile=file.path(tdir,"temp.zip"))
unzip(file.path(tdir,"temp.zip"),exdir = tdir)
list.files(tdir)

storm_data2 <- read_sf(list.files(tdir,pattern=".shp",full.names = T))

#filter storms
storm_data3 <-filter(storm_data2,SEASON > 1949) %>%
#get rid of NAs
mutate_if(is.numeric, function(x) ifelse(x==-999.0,NA,x)) %>%

#add a column for decade
mutate(decade=(floor(year/10)*10))

region<-st_bbox(storm_data2)

#make the first plot
ggplot()+
geom_sf(data=world, inherit.aes=F) +
  facet_wrap(~decade) + 
  stat_bin2d(data=storm_data3, aes(y=st_coordinates(storm_data3)[,2], x=st_coordinates(storm_data3)[,1]),bins=100) +
  scale_fill_distiller(palette="YlOrRd", trans="log", direction=-1, breaks = c(1,10,100,1000)) + 
  coord_sf(ylim=region[c(2,4)], xlim=region[c(1,3)])

#calculate table with top five states of storms
st_crs(storm_data3)
us_states<-st_transform(us_states, st_crs(storm_data3))
#change name column 
states<-us_states%>%
  select(state = NAME)
#perform spatial join and find table
storm_states <- st_join(storm_data3, states, join = st_intersects,left = F) %>%
group_by(state)%>%
summarize(storm_data3=length(unique(NAME))) %>%
  arrange(desc(storm_data3)) %>%
  slice(1:5)
storm_states



