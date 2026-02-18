#R Markdown Notes #Must install knitr, rmarkdown, pandoc #pandoc will convert Rmarkdown #Rmarkdown > Markdown > Document #Also install tinytex  

####YAML Header and Knitting #### 
#To add an R markdown file, go to the same place in the top left that you would open and brand new R script, but click R markdown. #Title: Whatever the header title is #Author: Kamerin Sandlin #Date: yep #Can change output type (html_document:, word_document:, etc) #Can generate table of contents in markdown output toc: true #this must be indented into document type #EX: html_document toc: true toc_float: true #another way to make the links more professional looking. #These are generally unreadable by github. Must be in markdown file type md_document: variant: gfa #gfa = github flavored markdown 

####Code Chunks#### 

#you can integrate different code chunks (ex: python, bash, R, etc.) by the top right of the markdown file. 
#adding the new code chunk will add '''(tool name)''' and you post R code here. #you can essentially just use this as a R console 
#You can name the code chunks. #{r chunk_name, ...} 
#Other parameters to manipulate. 
#```{r setup, include=FALSE} 
#knitr::opts_chunk$set(echo = TRUE) 
#You can include figures in an R markdown code. 
#{r setup, include = FALSE} 
#data("mtcars") 
#ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() 

#R Markdown Formatting Options 

#First Level Header 
#Second Level Header 
#Third Level Header 

#Style and Emphasis 
  #'italic' 
  #'bold' 
#Add Links to the Markdown 
  #EX 
    #Link to my github 
#Add Images to the Markdown
  #File path to image must be relative! 

####File Trees#### 
#install.packages("fs") fs::dir_tree() 
#Output is something like this: fs::dir_tree() . 
#├── ExampleMarkdown.Rmd 
#├── ExampleMarkdown.docx 
#├── ExampleMarkdown.html 
#├── ExampleMarkdown.md 
#├── ExampleMarkdown_files 
  #│ └── figure-gfm 
    #│ ├── pressure-1.png 
      #│ └── setup-1.png 
        #└── Reproducibility.Rproj 
#Labeling the file tree and providing descriptions for each file helps users understand the project structure. #Can put file tree on github. 

####Zenodo####  
#Zenodo provides a DOI (digital object identifier) that links back to your work, making it citable. #Zenodo and github must be linked.