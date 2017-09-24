#Making plots in R

#first, draw 1000 rnadom values from a standar normal distribution(SD=1)
s1<-rnorm(1000,mean=0,sd=1)#mean 0 and sd 1 are the default values

#now do 1000 drawn from a normal distribution with sd=3
s3<-rnorm(1000,mean=0,sd=3)

#look at the data quickly
head(s1)
head(s3)

#########################Plot histograms of both on the same panels######################
#create a pdf to save the plot to:
pdf(file="Normal_hist.pdf", width = 4,height = 7)
#Open the file

par(mfrow=c(2,1),mar=c(4,4,3,2))#sets plotting area and margins(order c(bottom, left,top, right))

hist(s1,col=2,xlab = "value",main="sigma=1") #make first hist ....hist(vector, color, x label, plot title)

hist(s3,col=4,xlab = "value",main="sigma=3") #make second hist

dev.off() #shuts off current output device

###########################Smooth density plot##############

pdf(file="Normal_density.pdf", width = 6,height = 6)
#Open the file

par(mfrow=c(1,1),mar=c(4,4,3,2))#sets plotting area and margins(order c(bottom, left,top, right))

plot(density(s1),col=2,lwd=4,xlab = "value",xlim=c(-15,15),main="Normal Distribution")#density() smooths the data  and lwd changes the width of the line

lines(density (s3), col=4, lwd=4) #add the SD=3 values, USE LINES TO ADD THE OTHER PLOT TO THE GRAPH
#BECAUSE THE PARAMETERS HAD BEEN SET TO BE A SINGLE GRAPH THEN R WOULD RECREATE THE PLOT WITHOUT THE FIRST PLOT

legend(-15, 0.4, c("sigma=1", "sigma=3"),lwd=4, col=c(2,4), cex=1.5) #put a legend on

#we can highlight the upper 10% of each distribution with a vertical line: 
abline(v=quantile(s1, 0.9,lty=2, lwd=3, col=2))#puts a vertical line onto the plot for s1
abline(v=quantile(s3, 0.9,lty=2, lwd=3, col=4))#puts a vertical line onto the plot for s3

dev.off()

###quantile takes a vector of stuff,, and returns the value q such that p% of your ditribution is 
###less that q.
## quantile with just a vector gives you the quantiles of the data .

####################################Boxplot########################################
pdf (file = "Normal")




