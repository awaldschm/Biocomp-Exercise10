#10/20/21
#Alexis Waldschmidt

#1. Find some data on two variables that you would expect to be related to each
#other. These data can come from your own research, your daily life, or the 
#internet. Enter those data into a text file or Excel and then save a text file,
#and write a script that loads this text file and produces a scatter plot of 
#those two variables that includes a trend line.

#Set the working directory
setwd("~/Biocomp-Exercise10")

#load the libraries
library("ggplot2")

#load in the data that I have saved as a text file
arrests <- read.table("USArrests.txt", sep = " ", header =T)

#make a scatter plot with a trend line
ggplot(data = arrests, 
       aes(x = Murder, y = UrbanPop)) +
  geom_point() +
  xlab("Murder") + 
  ylab("Urban Population") +
  stat_smooth(method = "lm") + 
  theme_classic()


#2. Given the data in "data.txt". Write a script that generates two figures that 
#summarize the data. First, show a barplot of the means of the four populations.
#Second, show a scatter plot of all of the obesrvations. You may want to "jitter"
#the points (geom_jitter()) to make it easier to see all of the observations 
#within a population in your scatter plot. Alternatively, you could also try 
#setting the "alpha" argument in geom_scatterplot() to 0.1. Do the bar and scatter
#plots tell you different stories? Why?

#Load in the data
data <- read.table("data.txt", header = T, stringsAsFactors = F, sep = ",")

#First graph: barplot of the means
ggplot(data, aes(x = region, y = observations, fill = as.factor(region))) + #???By "means of the four populations", do you mean means of the observations in each of the four pops?????
  stat_summary(fun.data = "mean_se", geom = "errorbar", width = 0.5) +
  stat_summary(fun = "mean", geom = "bar") +
  theme_classic() +
  xlab("Region") +
  ylab("Mean of Observations") #???This still makes no sense to me why we would make a bar graph. If I wanted to show the mean, I would do this code minus the geom_bar(). Is there some logic to this that I am missing?????

#second graph: scatterplot of the observations (I chose to jitter the plots instead of using an alpha value)
ggplot(data, aes(x = region, y = observations, color = region)) + 
  geom_jitter() +
  theme_classic() +
  xlab("Region") +
  ylab("Observations") 

#Do the bar and scatterplots tell you different stories? Why?
#Yes, these two graphs appear to tell different stories. When looking at the barplot
#of the means, it appears as though all of the regions' observations are very similar.
#However, when you look at the scatterplot, it becomes clear that the distributions 
# and spreads of the observations are quite different from each other, even though the means 
#are very similar. For example, the west appears to have an equal distribution 
#across all observations. The east is very similar, but it has less 
#observations at both the upper and lower observation values. The north's
#observations are very concentrated in the middle, and the south's observations
#are concentrated in two specific and distinct locations. This wide variation in the 
#data would not have been easily predicted by only analyzing the very 
#uniform-looking barplot.