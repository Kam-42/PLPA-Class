##### Coding Challenge 3 ####

#1. 
#Using ggplot, create a boxplot of DON by Treatment
#ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  stat_summary(fun = mean, geom = "bar", position = "dodge") + 
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + 
  geom_point(aes(color = Cultivar), position = position_jitterdodge(), shape = 21, color = "black", alpha = 0.5, size = 2) + 
  ylab("DON(ppm)") + 
  xlab("") + 
  facet_wrap(~Cultivar)

#A,B, C, D, E.
#Jitter points over the boxplot and fill the points and boxplots Cultivar with two colors from the cbbPallete
#NOTE: 
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
#NOTE: select from the colors with mycolors <- cbbPalette[c(2, 6)]
#
ggplot(MycData, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  geom_boxplot(position = position_dodge(width = 0.75)) + 
  geom_jitter(aes(color = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), shape = 20, size = 2, alpha = 0.6) + 
  scale_fill_manual(values = mycolors) + 
  scale_color_manual(values = mycolors) + 
  ylab("DON (ppm)") + xlab("") + theme_classic() + coord_cartesian(ylim = c(0, 230))
#This code also fits the 1b, 1c, 1d, parameters of the coding challenge. 
#NOTE: cut down the y axis from 450 down to 230 (where data is actually present) with following code
+ coord_cartesian(ylim = c(0, 230))



#2.
#Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70.
#MycData <- factor(MycData$Treatment, levels = c("NTC", "Fg", "Fg + 37", "F+40", "Fg + 70"))



#3.  
#Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects.
#DON Plot
ggplot(MycData, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  geom_boxplot(position = position_dodge(width = 0.75)) + 
  geom_jitter(aes(color = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 1), shape = 20, size = 2, alpha = 0.6) + 
  scale_fill_manual(values = mycolors) + 
  scale_color_manual(values = mycolors) + 
  ylab("DON (ppm)") + 
  xlab("") + 
  theme_classic() + 
  coord_cartesian(ylim = c(0, 210)) + 
  facet_wrap(~Cultivar)
#X15Plot
ggplot(MycData, aes(x = Treatment, y = X15ADON, fill = Cultivar)) + 
  geom_boxplot(position = position_dodge(width = 0.75)) + 
  geom_jitter(aes(color = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.9), alpha = 0.6, size = 2) + 
  scale_fill_manual(values = mycolors) + 
  scale_color_manual(values = mycolors) + 
  ylab("15ADON") + xlab("") + 
  theme_classic() 
#Seed Mass Plot
ggplot(MycData, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) + 
  geom_boxplot(position = position_dodge(width = 0.9)) + 
  geom_jitter(aes(color = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.9), alpha = 0.6, size = 2) + 
  scale_fill_manual(values = mycolors) + 
  scale_color_manual(values = mycolors) + 
  ylab("Seed Mass (mg)") + 
  xlab("") + 
  theme_classic()



#4.
#Use ggarrange function to combine all three figures into one with three columns and one row. Set the labels for the subplots as A, B and C. Set the option common.legend = T within ggarage function. What did the common.legend option do?
  #CombinedPlot <- ggarrange(DONPlot, SeedMassPlot, X15Plot, labels =c("A", "B", "C"), common.legend = TRUE)
  #The common legend fuction is self explanatory in the sense that it moves the key to the top of the plot(s) and since they all share the same CULTIVAR variables (not y axis variables) the key can represent all of the plots at once. 
  
  
  
#5.  
#Use geom_pwc() to add t.test pairwise comparisons to the three plots made above. Save each plot as a new R object, and combine them again with ggarange as you did in question 4. 
#To add t.test comparison to plot using geom_pwc (SeedMassPlot as example)
#SeedMassgwc <- SeedMassPlot + geom_pwc(data = MycData, aes(group = Treatment), method = "t.test", label = "{p.adj.format}{p.adj.signif}")
#Final plot ggarrage
#FinalPlot <- ggarrange(SeedMassgwc, X15gwc, DONgwcPlot, ncol = 3, nrow = 1, common.legend = TRUE)
#ncol = 3 (3 columns)
#nrow = 1 (1 row)