#Bootcamp Exercise 1:Control and Flow

##Exercise 1) Write a for loop statement so that it runs 
##from 1:9 and prints the following output

for (i in 1:9){
  if(i==9){cat("*")
    }
  else{cat("\n")}
}

##Exercise 2) Modify your for loop so that it prints
##0 asterisks, with each asterisk separated by exactly
##one ampersand sign, with no spaces or new line characters

for (i in 1:10){
  if (i==10){
    cat("*")
  }
    else{cat("*&")}
}

##Exercise 3) by hand, figure out the initial values of these 
##variables and values at the the start and end of each iteration
##of the loop

dogs <- 10;
for (i in 1:5){
  dogs <- dogs + 1; 
}

#11,12,13,14,15

meatloaf <- 0; 
for (i in 5:9){
  meatloaf <- meatloaf - i + 1;
  cat(meatloaf) 
}

#-4,-9,-15,-22,-30

bubbles <- 12;
for (i in -1:-4){
  bubbles <- i;
}
#-1,-2,-3,-4

##Exercise 4)modify this code so that it will print out a message during presidential 
##as well as congressional election years

years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 4 == 0){
    cat(years[ii], 'Hooray, congressional elections and presidential elections!', sep = '\t', fill = T)
  }
  else if(years[ii]%%2==0){cat(years[ii],'Hooray, congressional elections')}
  else{cat(years[ii],'\n', sep = '\t', fill = T)}
  }

##Exercise 5 

bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);

#Now look at the error message the following lines of code produce. Can you think of a way to modify this loop so that the loop will compund the interest?

interestRate <- 0.0125;
compounded<-vector("numeric",length(bankAccounts))
for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }

##Exercise 6

bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7); #deduct
food<- c(3.5, 4.3, 5.0);    #deduct
fun <- c(7.8, 2.1, 10.5);  #deduct
#and incomes (through TAships) of 
income <- c(21, 21, 21); #add this

for (j in 1:5) {
  for (i in 1:length(bankAccounts)) {
    #step 1 modify bankAccounts so that amounts reflect income and expenses
    bankAccounts[i]<-bankAccounts[i]+income[i]-house[i]-food[i]-fun[i]
    bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
    #step 2 get calculate interest and add to accounts from step 1
    #you can actually use the line you have already written if you
    #modify amounts in bankAccounts directly in step 1
    #print(bankAccounts)#
  }
}
print(bankAccounts)

##Exercise 7) Three students have estimated annual expenditures for food, 
##housing, and fun of: (in thousands of dollars)

bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7); #deduct
food<- c(3.5, 4.3, 5.0);    #deduct
fun <- c(7.8, 2.1, 10.5);  #deduct
#and incomes (through TAships) of 
income <- c(21, 21, 21); #add this

for (j in 2015:2020) {
  for (i in 1:length(bankAccounts)) {
    if (j %%2!=0 && i==1 && i==3){
    bankAccounts[i]<-bankAccounts[i]+income[i]-house[i]-food[i]-fun[i]+5
    bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
  }
    else {bankAccounts[i]<-bankAccounts[i]+income[i]-house[i]-food[i]-fun[i]
   bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]}
  }
}
print(bankAccounts)

##Exercise 8) use a while loop to sum all numbers from 1:17. 

x<-1
m<-1
while(m<17){
  m=m+1
  x<-x+m
  print(x)}

##Exercise 9) write a function takes a number, and prints 'small'
#if number less than or equal to -1; 'medium' if between -1 and + 1'big' 
#if greater than or equal to + 1
