# Simple R script
library(mosaic)
library(ggplot2)
library(dplyr)
# sink not needed since we're just getting the
# graphic output this time
#   sink('myRoutput.txt')
iris %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width)) +
  geom_point(aes(col=Petal.Length,
                 size=Petal.Width,
                 shape=Species),
             alpha=.5) +
  theme_light()
# Note the file path contains full path
# otherwise the file gets burried
ggsave('w:\\iris.png')
