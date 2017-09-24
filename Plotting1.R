###Plotting and genetic variation data analysis exercises, Assignment 1

##Exercise 1-3 

#Creates function that samples populations of x individuals and 
#prints the mean of that random sample. 

get_heights<-function(x){
  heights<-rnorm(x,mean = 69, sd=10)
  x<-mean(heights)
  print(x)
}

##Exercise 4 

#Creates a for loop that calls "get_heights" function 1000 for population
#of 100 individuals saves the mean height from each replicate in vector
#"mean_heights_100"

replicates<-1000
mean_heights_100<-length(replicates)
for (m in 1:replicates){
    mean_heights_100[m]<- get_heights(100)
}
print(mean_heights_100)

## Exercise 5

#Creates a for loop that calls "get_heights" function 1000 for population
#of 1000 individuals saves the mean height from each replicate in vector
#"mean_heights_1000"

replicates<-1000
mean_heights_1000<-length(replicates)
for (m in 1:replicates){
  mean_heights_1000[m]<- get_heights(1000)
}
print(mean_heights_1000)

## Exercise 6

#Plots a histogram of the distribution of averages for sample sizes of 100 and 
#1000 individuals. PLots are on the same label axes with legend. 
bins<-seq(65,73, by=0.5)#establish bins
par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) #sets plotting area margins
counts_100<-hist(mean_heights_100, breaks = bins)$counts# create vectors of counts in each histogram
counts_1000<-hist(mean_heights_1000,breaks = bins)$counts#|||||||||||||||

barplot(rbind(counts_100,counts_1000), col=c(2,4),beside = T,xlab = "Height(inches)", ylab = "Count")
#names.arg=seq(65,75,by=1)
legend(6, 360, c("n=100", "n=1000"), col=c(2,4),pch=16)
