##Micaela Lipman 
##Case Study 3 
##GEO 511


library (ggplot2)
library (gapminder)
library (dplyr)
str(gapminder)
##filter kuwait
gapminder %>%
  filter(country != "Kuwait") 
##plot number 1 
ggplot(gapminder) + 
  geom_point(aes(x=lifeExp, y = gdpPercap, color = continent, size=pop/10000)) + 
  facet_wrap(~ year, nrow=1) + 
  scale_y_continuous(trans = "sqrt") + 
  theme_bw() + 
  labs(x= "Life Expectancy", y = "GDP per capita", size = "Population (100k)")
ggsave("Plot1.png", width = 15, height = 5) 

##prepare data for second plot 
data(gapminder)
str(gapminder)
gapminder_continent<-gapminder %>%
  group_by (continent, year)
str(gapminder_continent)


summarize(gdpPercapweighted = weighted.mean(x=gdpPercap, w = pop), pop = sum(as.numeric(pop)))
          
          
##creating the second row of plots 
ggplot(gapminder) + 
  geom_line(aes(x=year, y = gdpPercapweighted, color = continent)) + 
  geom_point(aes(x=year, y = gdpPercapweighted, color = continent, size=pop/10000)) + 
  geom_line(data=gapminder_continent, aes(x=year, y = gdpPercapweighted)) + 
  geom_point(data=gapminder_continent, aes(x=year, y = gdpPercapweighted, size=pop/10000)) + 
  facet_wrap(~ continent, nrow=1) + 
  theme_bw() + 
  labs(x= "Year", y = "GDP per capita", size = "Population (100k)")
        