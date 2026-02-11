#### Coding Notes Data Vis 2 ####
#We are using "Bacterial Alpha dataset from canvas.
# Read it in as Sample.Data.Bac <- read.csv("BacterialAlpha.csv", na.strings = "na") 

#Next, set the Time_Factor as a continuous variable.
  #Sample.Data.Bac$Time_Point <- as.factor(Sample.Data.Bac$Time_Point) 
#Do the same thing to the crop variable. 
  #Sample.Data.Bac$Crop <- as.factor(Sample.Data.Bac$Crop)
#Also,
  #Sample.Data.Bac$Crop <- factor(Sample.Data.Bac$Crop, levels = c("Soil", "Cotton", "Soybean"))

#the "str()" function gives you statistics about the data you selected.



#### Figure A, Bacterial Evenness ####
#bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, color = Crop)) +  
  # Define aesthetics: x-axis as Time.Point, y-axis as even, and color by Crop
#geom_boxplot(position = position_dodge(0.85)) +  
  # Add boxplots with dodged positions to avoid overlap
#geom_point(position = position_jitterdodge(0.05)) +  
  # Add jittered points to show individual data points, avoiding overlap
#ylab("Pielou's evenness") +  
  # Label the y-axis
#xlab("Hours post sowing") +  
  # Label the x-axis
#scale_color_manual(values = cbbPalette, name = "", labels = c("Soil no seeds", "Cotton spermosphere", "Soybean spermosphere")) +  
  # Manually set colors and labels for the Crop variable
#theme_classic()   
  # Use a classic theme for the plot bac.even



#### Figure B, Water Imbibition  ####
#sample.data.bac.nosoil <- subset(sample.data.bac, Crop != "Soil")
  #subsets the soil variable.
#water.imbibed <- ggplot(sample.data.bac.nosoil, aes(Time_Point, 1000 * Water_Imbibed, color = Crop)) +  
  # Define aesthetics: x-axis as Time.Point, y-axis as Water_Imbibed (converted to mg), and color by Crop
#geom_jitter(width = 0.5, alpha = 0.5) +  
  # Add jittered points to show individual data points with some transparency
#stat_summary(fun = mean, geom = "line", aes(group = Crop)) +  
  # Add lines representing the mean value for each Crop group
#stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +  
  # Add error bars representing the standard error of the mean
#xlab("Hours post sowing") +  
  # Label the x-axis
#ylab("Water Imbibed (mg)") +  
  # Label the y-axis
#scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("", "")) +  
  # Manually set colors for the Crop variable
#theme_classic() +  
  # Use a classic theme for the plot
#theme(strip.background = element_blank(), legend.position = "none") +  
  # Customize theme: remove strip background and position legend to the right
#facet_wrap(~Crop, scales = "free")  
  # Create separate panels for each Crop, allowing free scales




#### Figure C,Water Imbibed Correlation  ####
#water.imbibed.cor <- ggplot(sample.data.bac.nosoil, aes(y = even, x = 1000 * Water_Imbibed, color = Crop)) +  
  # Define aesthetics: y-axis as even, x-axis as Water_Imbibed (converted to mg), and color by Crop
#geom_point(aes(shape = Time_Point)) +  
  # Add points with different shapes based on Time.Point
#geom_smooth(se = FALSE, method = lm) +  
  # Add a linear model smooth line without confidence interval shading
#xlab("Water Imbibed (mg)") +  
  # Label the x-axis
#ylab("Pielou's evenness") +  
  # Label the y-axis
#scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("Cotton", "Soybean")) +  
  # Manually set colors for the Crop variable
#scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  
  # Manually set shapes for the Time.Point variable
#theme_classic() +  
  # Use a classic theme for the plot
#theme(strip.background = element_blank(), legend.position = "none") +
#facet_wrap(~Crop, scales = "free")  
  # Create separate panels for each Crop, allowing free scales
#### Arrange Multiple ggplots into single figure ####
#BigFigure <- ggarrange(water.imbibed, bac.even, water.imbibed.cor, labels = "auto", nrow = 3, ncol = 1, legend = FALSE)
  #BigFigure <- ggarrange(  
  #water.imbibed,  
    # First plot: water.imbibed
  #bac.even,  
    # Second plot: bac.even
  #water.imbibed.cor,  
    # Third plot: water.imbibed.cor
  #labels = "auto",  
    # Automatically label the plots (A, B, C, etc.)
  #nrow = 3,  
    # Arrange the plots in 3 rows
  #ncol = 1,  
    # Arrange the plots in 1 column
  #legend = FALSE  
    # Do not include a legend in the combined figure




#### Integrating Basic Statistics ####
#For factorial ANOVA type designs, the stat_compare_means function in the ggpubr package is excellent.
  #bac.even + 
  #stat_compare_means(method = "anova") 
    # apply an anova to the groups
#You can also compare all treatments against eachother by giving the comparison list
  #bac.even + geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.format")
    #Example with pvalues as significance levels
  #bac.even + geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.signif")
    #example with * as significance levels
#water.imbibed.cor + stat_cor()
  #Gives R value and p value of plot 
#water.imbibed.cor + stat_cor(label.y = 0.7) + stat_regline_equation()
  #can show regression line of plot, just another statistical analysis tool.

  
#### Specific Point Labeling ####
#The "Different Abundances" dataset from canvas is the exapmple dataset for the code here. 
#Making a volcano plot 
  #diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean)
  #diff.abund.label <- diff.abund[diff.abund$log10_pvalue > 30,]
#Make the plot.
  #ggplot() + geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + theme_classic() + geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label))
#Make it colorblind friendly
  #volcano <- ggplot() + 
  #geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  #geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) + 
  #scale_color_manual(values = cbbPalette, name = "Significant") +
  #theme_classic() + 
  #xlab("Log fold change Soil vs. Soybean") +
  #ylab("-log10 p-value")
#We can use the same concept if we wanted to emphasize certain points as a different shape or color
  #volcano <- ggplot() + 
  #geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue)) + 
  #geom_point(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue), color = "red", shape = 17, size = 4) +
  #geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, label = Label), color = "red") + 
  #theme_classic() + 
  #xlab("Log fold change Soil vs. Soybean") +
  #ylab("-log10 p-value")
