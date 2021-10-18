##Micaela Lipman 
##GEO 511
##Case Study 7 


library(tidyverse)
library(reprex)
library(sf)
library(spData)
data(world)
ggplot(world,aes(x=gdpPercap, color=continent, fill=continent)) +
   geom_density(alpha=0.5) + 
  theme(legend.position="bottom")



