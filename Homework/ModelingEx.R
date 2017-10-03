###Bootcamp Modeling Exercises###

##Setup statments
#Clear Workspace
rm(list=ls())

## Input data, set parameter values, and/or set intial conditions

##Initialize variable to a vector of NA values
rmodel<-function(n0,rr,kk,tmax=100, figure=TRUE){
nn<-matrix(nrow = 1,ncol=(tmax+1)) 
nn[1]<-n0
## Perform Calculations
# Use a loop to iterate the model the desired number of times
for(ii in 1:tmax){
nn[ii+1]<-nn[ii]*exp(rr*(1-(nn[ii]/kk)))
}
if(figure==TRUE){
## Display the results by plotting, saving, or showing on-screen.
plot(1:(tmax+1),nn, type="b", col=4, xlab = "Time", ylab="Population")}
return(nn)
}

##Population decreases to n=0
rmodel(100,-2,600, 100)

## Population approaches stable equilibrium at n*=K, without oscillations
rmodel(1,1,600)

##Decaying oscillations around n=K
rmodel(100,.10,50)

## Persistent, regular oscillations
rmodel(100, 2.5, 50)

## Crazy,random-looking fluctuations
rmodel(1000, 3, 25, 1500)

##R or the growth rate is the key driver of these patterns.

##Choose six interesting values of this parameter.

par(mfrow=c(3,2), mar=c(4,4,3,2))
rmodel(100,-2,600, 600)
rmodel(1,1,600)
rmodel(100,.10,600)
rmodel(100, 2.5, 600)
rmodel(1000, 3, 600)
rmodel(1994, 1.9, 600)

## d
nVec<-rmodel(20,1,1000,500)
which(nVec>=500)[1]
nVec[1,5]

## e
tk2<-matrix(nrow = 1,ncol=length(r))
r<-seq(0.1:0.9, by=0.1)
for (i in 1:length(r)){ 
  nVec<-rmodel(20,r[i],1000,500, figure =FALSE)
  tk2[i]<-which(nVec>=500)[1]
}
plot(r,tk2, xlab = "Growth Rate(r)", ylab= expression(t[K/2]))
print(tk2)

## f

# Define parameter values; use a vector to hold a range of values for the
# parameter(s) you wish to vary.
rr<-seq(from=0.5, to=1.0, by=0.1)
kk<-seq(from=1000, to=1500, by=100)
# Initialize a matrix to collect all outputs
tk3<-matrix(nrow = length(kk),ncol=length(rr))

# Use a for loop to repeatedly run the model and collect output

for(i in 1:length(rr)){
  for(ii in 1:length(kk)){
     output<-rmodel(20,rr[i],kk[ii],10, figure =FALSE)
  tk3[i,ii]<-output[10] 
  }
}

# analyze results
print(tk3)

# Create a contour plot using "plotly" package
library(plotly)
plot <- plot_ly(z = ~tk3, type = "contour")



