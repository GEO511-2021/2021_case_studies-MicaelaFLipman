##Micaela Lipman 
##Case Study 2 
##GEO 511

library (tidyverse)
library (ggplot2)


dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"


temp=read_table(dataurl,
                skip=3, #skip the first line which has column names
                na="999.90", # tell R that 999.90 means missing in this dataset
                col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                              "APR","MAY","JUN","JUL",  
                              "AUG","SEP","OCT","NOV",  
                              "DEC","DJF","MAM","JJA",  
                              "SON","metANN"))
# renaming is necessary because they used dashes ("-") in the column names and R doesn't like that.


view (temp)
summary (temp)
glimpse (temp)

ggplot (temp, aes(x=YEAR, y=JJA))+
          geom_line ()+
          geom_smooth (color="red") +
          labs(x = "Year", y = "Mean Summer Temperatures (C)", title = "Mean Summer Temperatures in Buffalo, NY", subtitle = 
                 "Summer includes June, July, and August Data from the Global 
   Historical Climate Network Red Line is a LOESS smooth")
        #this is a linear regression model smooth line because method = "lm" is the default of geom_smooth () is loes
        
        ggsave ("Case_Study_2.png")
        getwd()
      
        