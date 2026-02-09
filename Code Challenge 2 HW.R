#### Question 1 #### 
#what three elements do you need to produce a ggplot?
  #To make a ggplot you need a dataset, aesthetic map and geom metric.
#What is a geom?
  #the way that your data is presented in a visualization (ex: bar graph, boxplot, etc.)
#What is a facet? 
  #facetting is a quick way to split data into separate types.
#Explain layering.
  #Layering different aspects of a graph onto R is like building blocks being placed on top of each other. In the code, whatever is put in first is layered first. Everything ofllowing that in the code will be layered on top of the previous command in the code. 
#Where do you add x and y variables and map different shapes, colors, and other attributes to the data?
  #You can add all of these different variables under the 'aesthetic' aspect of the ggplot. 

#### Question 2 ####
#Make a boxplot using ggplot with DON as the y variable, treatment as the x variable, and color mapped to the wheat cultivar. Change the y label to “DON (ppm)” and make the x label blank.
  #ggplot(MycotoxinData, aes(x = Treatment, y = DON, color = Cultivar)) + geom_boxplot() + ylab("DON (ppm)") + xlab("")

#### Question 3 ####
#Now convert this data into a bar chart with standard-error error bars using the stat_summary() command. (hint: use position = dodge)
  # ggplot(MycotoxinData, aes(x = Treatment, y = DON, color = Cultivar)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + ylab("DON(ppm)") + xlab("")

#### Question 4 ####
#Add points to the foreground of the boxplot and bar chart you made in questions 2 & 3 that show the distribution of points. Set the shape = 21 and the outline color black (hint: use jitter_dodge).
  #ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + geom_point(aes(color = Cultivar), position = position_jitterdodge(), shape = 21, color = "black", size = 2) + ylab("DON(ppm)") + xlab("")
  #NOTE: position = "dodge" is the right way to input the code. 
#### Question 5 ####
#Add a facet to the plots based on cultivar.
  #Must put in the previous code first, to actually add the facet to the plot. 
  # + facet_wrap(~Cultivar) 

#### Question 6 ####
#Add transparency to the points so you can still see the boxplot or bar in the background.
  #ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) + stat_summary(fun = mean, geom = "bar", position = "dodge") + stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + geom_point(aes(color = Cultivar), position = position_jitterdodge(), shape = 21, color = "black", alpha = 0.5, size = 2) + ylab("DON(ppm)") + xlab("") + facet_wrap(~Cultivar)
  #The "alpha = 0.5" within geom_point is the only difference in this code and the last one, adding transparency.


#### Question 7 ####
  #Add to github repository.
  #Link: https://github.com/Kam-42/PLPA-Class 
