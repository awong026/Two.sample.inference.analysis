#Assignment: Read and study Inferences on 2 samples

###################################################################################################

#Question 1: Pollution levels were measured downstream and upstream from a plant. On a given day
#one meausre was taken upstream and one downstream
#These measures for 16 days are in the file streams.csv under data tab
#Test whether there is diff in the pollution levels up and down stream.

###################################################################################################

#Import data,

library(readr)
streams <- read_csv("C:/Users/awong/Downloads/streams.csv")
View(streams)

streams <- as.data.frame(streams)


x <- streams$down
y <- streams$up

#EDA, Data is paired

boxplot(x,y)
qqplot(x,y)
x<-sort(x)
y<- sort(y)
plot(x)
plot(y)

shapiro.test(x) ##Reject that x is normal since below .05 (.05 isn't always alpha, but I chose it for this assignment)
shapiro.test(y)  ## Can't reject y is normal since not below .05

#Paired data
d<- x-y
qqnorm(d)
shapiro.test(d) #Can't reject normal since pvalue over .05

#Since we can't reject normal dist. We can use t-test

mean(d)
var(d)
t.test(x,y, paired = T, mu = 0, alternative = "two.sided") ## pvalue says that the means are different since it's below usual pvalue of significance like .05
cor(x,y) #higly correlated

t.test(x,y, paired = F, my = 0, alternative = "two.sided") ## Just curious, looks like if I didn't recognize that data was paired
#I would have gotten a different conclusion, which is not good. 

#Conclusion
#Upstream and downstream data are paired. They are assumed to be normally distributed because of the high p value when conducting a Shapiro Test on d (d = downstream - upstream). 
#Then I did a paired t test to with the H0: u (downstream) = u (upstream), Ha: u(downstream) is not equal to u(upstream). 
#From this I found that the means for downstream and upstream are significantly different because of the low pvalue that resulted from t test.


###########################################################################################

#Question 2. Yield in lbs of tomatoes per week for 2 gardens with diff types of fertizler are given in file "t.test.data.csv"
#Determine whether the avg. yields for the 2 gardens diff
#Include any plots and write up summary of results. 

###########################################################################################

#Gardens are independent (not paired)

library(readr)
t_test_data <- read_csv("C:/Users/awong/Downloads/t.test.data.csv")
View(t_test_data)

A <- t_test_data$gardenA
B <- t_test_data$gardenB


#EDA
boxplot(A,B)
qqplot(A,B) # Looks normal
shapiro.test(A) #Can't reject normal
shapiro.test(B) #Can't reject normal 

mean(A)
mean(B)
var(A)
var(B)

#Check equal variances to see if we can use t test since we couldn't reject normal. 
var.test(A,B, ratio = 1, alternative = "two.sided") #equal variances since p value is 1
t.test(A,B, alternative = "two.sided", var.equal = T) #pvalue is low which means the means are different

#Conclusion:
#Garden A and B are assumed to be normal dist. thanks to qqplot and Shapiro Test. 
#Their variances are found to be equal. Their means are found to be significantly different. Since p values were low
