# Simple R script
library(mosaic)
library(ggplot2)
library(dplyr)
#sink('myscript.txt')
iris %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width)) +
  geom_point(aes(col=Petal.Length,
                 size=Petal.Width,
                 shape=Species),
             alpha=.5) +
  theme_light()
ggsave('w:\\iris.png')
