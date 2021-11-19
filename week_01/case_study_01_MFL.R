
###Micaela Lipman 
###Case Study 1 
###Group 4

library(ggplot2)

data ("iris")
mean(iris$Petal.Length)
petal_length_mean=mean(iris$Petal.Length)
hist(iris$Petal.Length)

###other way using ggplot and separating by species
ggplot(iris,aes(x=Petal.Length, fill=Species)) + 
  geom_histogram(binwidth=.5, position="stack")

##Exploring with esquisse package
ggplot(iris) +
  aes(x = Petal.Length, fill = Species) +
  geom_histogram(bins = 30L) +
  scale_fill_manual(values = c(setosa = "#6DF873", 
                               versicolor = "#0025C1", virginica = "#FF61C3")) +
  labs(x = "Petal Length", y = "Count", fill = "Plant Species") +
  theme_minimal() +
  theme(legend.position = "none")


