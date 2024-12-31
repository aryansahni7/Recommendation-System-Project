library(arules)
library(arulesViz)

setwd("D:/Term 2/Machine Learning/Working Directory") 
Grocery <- read.transactions("Grocery.csv",sep=',') #sep is Delimiter #read transaction to generate support (function is commonly used for reading transaction data in market basket analysis)
View(Grocery)
summary(Grocery)

itemFrequencyPlot(Grocery,topN=100) #top 100 most frequent items

#Using Apriori Algorithm to generate rules
rules <- apriori(Grocery,parameter = list(supp=0.01,conf=0.0)) #supp is support threshold, conf is confidence

inspect(rules) #association rules generated

#exporting rules
write(rules,"rules_MLB (Recommendation).csv",sep=',')

#viewing rules using Visual
plot(rules,method = "graph", control = list(type="item"),interactive = T) #generates a graph where items are represented as nodes, and the association rules are represented as directed edges between the nodes

#grouping all similar rules together in visual
plot(rules,method = "grouped") #grouped matrix plot that visually represents the association rules
#This code will generate a grouped matrix plot where the association rules are grouped based on their support values. In this plot, the rows represent the antecedents, the columns represent the consequents, and each cell shows the support value of the corresponding rule
