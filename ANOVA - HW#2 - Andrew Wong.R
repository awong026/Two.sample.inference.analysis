###HW #2 Andrew Wong (2 Sample Inference)

#1: data in file "navajo.csv" is the number of traditional Navaho hogans in a given district and the number of modern homes in the same district
# for a random sample of 8 districts on the Navajo reservation. Test whether the mean number of Navajo hogans is equal to the mean number of modern homes on
#the reservation. 

#2: data in file "trucks.csv" is the retail price for models of pickups in two different US cities.
#Prices are in thousands of dollars. Test wheter the mean retail prices of pickups is the same in each city. 
#Due 2/14


#1: Paired test since data for both modern house and navajo comes from same district, but from 8 different districts
library(readr)
navajo <- read_csv("C:/Users/Andrew/Downloads/navajo.csv")
View(navajo)

d <- navajo$HOGANS - navajo$MODERN

#Check assumptions
#Check normality
qqnorm(d) #Looks normalish, but might be problems at the ends
shapiro.test(d) #p value is .4597 is can't say we reject H0 (Normal)

#Look for trends
plot(d) #very few points, but I can't see any trend 

#Let's do one sample t-test
t.test(d, alternative = "two.sided",  mu = 0) #pvalue is .4564 which means we don't reject that means are the same

mean(navajo$HOGANS) #25.25
mean(navajo$MODERN) #31.25

#Let's double check with 2 sample paired test
t.test(navajo$HOGANS, navajo$MODERN, alternative = "two.sided", paired = T) #Got same p value

#Just to make sure, let's also check the not paired t test too
t.test(navajo$HOGANS, navajo$MODERN, alternative = "two.sided", paired = F) #p value is .5303, which means still don't reject H0 

#Conclusion: equal means of Hogans and Modern houses. The process was that I noticed the data was paired. Then I checked for normality  and checked to 
#see if there was any patterns in the data. Noramlity was good, and there were no patterns. This meant I could use a one sample t-test on the differences of Hogans
# and Modern houses for a given district. I did the paired test and got a p value of .4564, which meant not to reject. Then just for fun, I did a not paired t-test
#and still go the same answer of not rejecting H0. 



#2: data in file "trucks.csv" is the retail price for models of pickups in two different US cities.
#Prices are in thousands of dollars. Test wheter the mean retail prices of pickups is the same in each city. 

trucks <- read.csv("C:/Users/Andrew/Downloads/trucks.csv", header=TRUE)
View(trucks)

#Check assumptions
x1 <- trucks$X1
x2 <- trucks$X2
#Get rid of NA's since data was weird and had a row of NA's 

x1 <- x1[!is.na(x1)]
x2 <- x2[!is.na(x2)]
x1
x2


##Check assumptions of our test
#Check normality 
qqnorm(x1) #No line, looks like a weird spiral
qqnorm(x2) #This looks okay for normal
shapiro.test(x1) #p value is .3019, which means okay to assume normal
shapiro.test(x2) #p value is .6921 which means okay to assume normal


#Check for trends
plot(x1) #No pattern
plot(x2) #No pattern
cor(x1,x2) #Also two city's prices are not highly correlated

##Check assumption of equal variances
var(x1)
var(x2) #Very simliar, so can assume equal variances
#If we need to test
var.test(x1,x2) #H0 is that they are qual variances. p value is .95 so confirms variances are equal

#Since normality and no patterns (ind) check out we can do t-test
t.test(x1,x2, alternative = "two.sided", paired = F, var.equal = T) #p value is .6167 which means can't reject 


#Conclusion: Pickup prices between the two cities have the same mean. The first thing I had to do was get rid of the NA's that appeared in the data
#when I imported. Then I checked each x1 and x2 on if normal and if each one had trends. Both checked out for normality and no pattern. Then I check for 
#equal variances, and the variances were similar so I assumed equal variances. Just in case I also did the var.test() function and got a p value of .95. 
#This meant I can't rejec H0 that the variances of x1 and x2 are equal. Because of all this, I was able to use a two sample t-test. I got a p-value of 
#.6167, which meant I couldn't reject. 
