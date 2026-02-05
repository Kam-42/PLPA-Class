#ggplot installation 
install.packages("tidyverse")
#tidyverse is a large package with multiple tools including ggplot

#Load in tidyverse
library(tidyverse)

#use ggplot
ggplot()

#ggplot the mtcars data with weight as x and mpg as y
ggplot(mtcars, aes(x = wt, y = mpg))

#add a layer to the plot
ggplot(mtcars, aes(x = wt, y = mpg)) +
  
#geom_point = point on a dataset
#geom_smooth(method = lm, se = FALSE)
  #NOTE: try and write it all in one code WITH +

#You can switch layers to where points on graph are ABOVE the line, or vice versa
  ggplot(mtcars, aes(x = wt, y = mpg)) + geom_smooth(method = lm, se = FALSE) + geom_point()
  #Geom_point is last thing logged in that code, so it will be on top

#Change the NAMES of the axis
xlab("name") 
ylab("name")

#NOTE: aes = aesthetic 

#ggplot(mtcars, aes(x = wt, y = mpg, size = wt)) + geom_smooth(method = lm, se = FALSE) + geom_point()
  #the SIZE = WT part of the aesthetic (aes) changes size of points on graph.
  #putting the SIZE = WT command into geom_point is more useful than putting it into aesthetic.


#DO THIS INSTEAD OF LAST CODE 
  #ggplot(mtcars, aes(x = wt, y = mpg)) + geom_smooth(method = lm, se = FALSE) + geom_point(aes(size = wt)) 
  #NOTE: size is an aesthetic measure in this coding.

#Every layer to the ggplot can be aded with a + and you can add tons to a single plot. 

#ggplot(Bull_richness, aes(x = GrowthStage, y = richness, color = Fungicide)) + geom_boxplot()
  #New data, x axis is growth stage, y axis is richness, fungicide is green colored.
  
 #There is a difference between "color" and "fill" in ggplot



#A stat summary can be used instead of a boxplot, for example. 
stat_summary(fun = mean, geom = "bar", position = "dodge")
  #fun=function (we want to test the mena/average), geom=you want a bar graph, position=




#Facetting 
  #a quick way to split data apart into different groupings 
  #many grouping variables in this particular dataset. 
+ facet_wrap(~Treatment) 
  #splits treatment into two separete parts
+ facet_wrap(~Treament*Crops)
  #splits treatment into four separate parts 
+ facet_wrap(~Treatment*Crop, scales = "free")
  #This shrinks the data down to where it actually is, it won't shot x axis value of 1,000 if the highest x axis value is 300. 


