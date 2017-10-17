# Two.sample.inference.analysis

## Objective
Question 1: Pollution levels were measured downstream and upstream from a plant. On a given day
one meausre was taken upstream and one downstream. These measures for 16 days are in the file streams.csv under data tab. Test whether there is diff in the pollution levels up and down stream.

Question 2: Yield in lbs of tomatoes per week for 2 gardens with diff types of fertizler are given in file "t.test.data.csv"
Determine whether the avg. yields for the 2 gardens differ. 

## Summary
Question 1: From description and EDA, I found out that it was paired data. Checked normality of paired data and found it to be normal. Then used t test to see if means were signifcantly different. 

Question 2: From EDA, found that that was normally distributed for both samples and had equal variances. So I was able to use t test to see if means were significantly different. 


## Conclusion
Question 1: Upstream and downstream data are paired. They are assumed to be normally distributed because of the high p value when conducting a Shapiro Test on d (d = downstream - upstream). Then I did a paired t test to with the H0: u (downstream) = u (upstream), Ha: u(downstream) is not equal to u(upstream). From this I found that the means for downstream and upstream are significantly different because of the low pvalue that resulted from t test.

Question 2: Garden A and B are assumed to be normal dist. thanks to qqplot and Shapiro Test. 
Their variances are found to be equal. Their means are found to be significantly different since their p values were low. 
