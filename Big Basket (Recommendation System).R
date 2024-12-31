library(arules)
library(arulesViz)
library(dplyr)

setwd("D:/Term 2/Machine Learning/Working Directory") 
big <- read.csv("bigbasketMLB.csv",sep=',') #sep is Delimiter #read transaction to generate support
View(big)
summary(big)

#grouped_data <- BigBasket %>% group_by(Order) %>% summarise(Concatenated_Descriptions = paste(Description, collapse = ", "))

#group the data by the "Order" column and then concatenate the values in the "Description" column for each group into a single string separated by commas
b <- big %>% group_by((Order)) %>% summarise(Descrip = paste(Description, collapse = ","))
  
View(b)

write.csv(b$Descrip,"BigBasket(grouped).csv",quote = FALSE,row.names = FALSE) exporting as transaction for market basket analysis

BigBasket <- read.transactions("BigBasket(grouped).csv",sep=',')
View(BigBasket)

itemFrequencyPlot(BigBasket,topN=100)

#Using Apriori Algorithm to generate rules
rules <- apriori(Grocery,parameter = list(supp=0.01,conf=0.0)) #supp is support threshold, conf is confidence

inspect(rules) #to see rules here in R

#exporting rules
write(rules,"rules_MLB (Recommendation).csv",sep=',')

#viewing rules using Visual
plot(rules,method = "graph", control = list(type="item"),interactive = T) #generates a graph where items are represented as nodes, and the association rules are represented as directed edges between the nodes

#grouping all similar rules together in visual
plot(rules,method = "grouped") #grouped matrix plot that visually represents the association rules
#This code will generate a grouped matrix plot where the association rules are grouped based on their support values. In this plot, the rows represent the antecedents, the columns represent the consequents, and each cell shows the support value of the corresponding rule