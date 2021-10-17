library (ggplot2)
install.packages("gapminder")
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


##prepare data for second plot 
str(gapminder)
gapminder %>%
  group_by (continent, year) %>%
gapminder_continent <-summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), pop = sum(as.numeric(pop)))

##creating the second row of plots 
ggplot(gapminder,gapminder_continent) + geom_line() + geom_point() + geom_line(data=newdata,gapminder_continent) + geom_point(data=newdata,gapminder_continent) + facet_wrap() + theme_bw() + labs(...)

        