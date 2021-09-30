
###Micaela Lipman 9.28.21 ###Case Study 4

library(tidyverse)
install.packages("nycflights13")
?nycflights13


####way to do it with piping
farthest_airport <-flights%>%
  select(distance,dest) %>%
  arrange(desc(distance))%>%
  slice(1)%>%
  left_join(airports, by=c("dest"="faa")) %>%
  sleect(name) %>%
  as.character()


###LONG WAY TO DO IT
#sort by distance of travel 
glimpse(flights) 
flights_to_join <- arrange(flights, desc(distance))
glimpse(flights_to_join)
glimpse(airports)

#join
joined_set <-left_join (flights_to_join, airports, by =c("dest" = "faa"))
arrange(joined_set, desc(distance))

#to select just as one character
first_row<-slice_head(joined_set)
farthestairportfromnyc<-select(first_row, name)
farthestairportfromnyc


setDT(df)
joined_set <-left_join (flights_to_join, airports, by =c("dest" = "faa"))
arrange(joined_set, desc(distance)) 
  
####Trying to figure out the map example
  airports %>%
  distinct(lon,lat) %>%
  ggplot(aes(lon, lat)) +
  borders("world") +
  geom_point(col="red") +
  coord_quickmap()


  

  

