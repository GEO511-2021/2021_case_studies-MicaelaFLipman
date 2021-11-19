
###Micaela Lipman 
###Case Study 4
###GEO 511

library(tidyverse)
library(nycflights13)


#join
joined_set <-left_join (flights_to_join, airports, by =c("dest" = "faa"))
 

#to select just as one character
joined_set %>%
  arrange(desc(distance)) %>%
slice_head()
farthestairportfromnyc<-select(first_row, name)
farthestairportfromnyc
  
####Trying to figure out the map example but didn't get there. 
  airports %>%
  distinct(lon,lat) %>%
  ggplot(aes(lon, lat)) +
  borders("world") +
  geom_point(col="red") +
  coord_quickmap()


  

  

