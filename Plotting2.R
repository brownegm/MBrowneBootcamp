###PLOTTING AND GENETIC VARIATION DATA ANALYSIS EXERCISES 2#####

##Clear Environment
rm(list = ls())

##Load data on SNPs 
snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld-2.txt',header=TRUE)#SNPs data frame

###################################Exercise 1######################################

#Turn snpsDataFrame into a matrix
snps=as.matrix(snpsDataFrame)

#Perform the chi-square test for Hardy-Weinburg using code from class

#create function compute_chisquare
compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)#prints observed counts
  #print(obscnts)
  n=sum(obscnts)
  #here we use the built-in function for the chi-sq distribution:
  exp_probs=c((1-freq)^2,2*freq*(1-freq),freq^2) #expected probability
  chisq<-chisq.test(obscnts,p=exp_probs, correct = FALSE)$statistic
  return(chisq)
}

# Apply the compute_chi_square function to each snp
chisqs=apply(snps,1,compute_chisquare)

# Compute p-values for each chi-square value using the pchisq function
pvals=pchisq(chisqs,1,lower.tail=FALSE)

# Count the number of pvals smaller than 0.05
sum05<-sum(pvals<0.05)

# Count the number of pvals smaller than 0.01
sum01<-sum(pvals<0.01)

# Count the number of pvals smaller than 0.001
sum001<-sum(pvals<0.001)

# Calculate the proportion of values less than 0.05,0.01,and 0.001
sum05/4014#0.04509218
sum01/4014#0.01021425
sum001/4014#0.00124564

#Creates variable num_pvals which equals number of SNPs that were tested
num_pvals<-length(pvals)

#Calculate the vector of expected P-values for the chi-square test
exp_pvals<-vector("numeric", 4014)
for(i in 1:num_pvals){
  exp_pvals[i]<-(i)/num_pvals
}
length(exp_pvals)
print(exp_pvals)

#sort the SNPs from smallest to largest
sort_pvals<-sort(pvals)

#Find -log10 of observed and expected values
log_sort_pvals<- -log10(sort_pvals)
log_exp_pvals<- -log10(exp_pvals)

#plot QQ plot of log expected values and log sorted values
par(mar=c(4,4,3,2),cex=2)
plot(log_exp_pvals,log_sort_pvals, xlab = "-log10(expected P-value)", ylab = "-log10(observed P-value)")
abline(lm(log_exp_pvals~log_sort_pvals), lty=2, col=2, lwd=3 )

###################################Exercise 2#########################################

#load phenotypes data frame to variable zz
zz=read.table('pheno.sim.2014-2.txt',header = TRUE)#Phenotypes data frame
phenos=as.matrix(zz[,2])
#find value of phenotype such the 25% of individuals have a phenotype less than this value
mean_glucose<-mean(phenos)#calculates mean of glucose phenotypes

sd_glucose<-sd(phenos)#calculates standard deviation of glucose phenotypes

less25<-quantile(phenos,0.25)#finds value where 25% of individuals have a phenotypeless than that value

more25<-quantile(phenos,0.75)#finds value where 25% of individuals have a phenotype greater than the value

#Create a density plot of the phenotype distribution
par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) #sets plotting area and margins
plot(density(phenos),lwd=4,xlab="Value",main="Phenotype Distribution")
legend(1.4,0.2905786,c("25% tail","75% tail"),lwd=4,col=c(2,4),cex=1) #put a legend on

#Add a vertical line indicating the 25% tail
abline(v=less25, lty=2,lwd=3,col=2)

#Add a vertical line indicating the 75% tail
abline(v=more25, lty=2, lwd=3, col=4)


