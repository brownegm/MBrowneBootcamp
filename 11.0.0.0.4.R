X <- read.csv('ChlorellaGrowth.csv',comment.char='#')

# using '#' as a comment character allows us the CSV file to be self-documenting


Light <- X[,1]
rmax <- X[,2]

LogLight=log(Light)

Logrmax=log(rmax)

par(mfcol=c(2,1))

plot(rmax~light,data=X,xlab="light intensity (uE/m2/s)",ylab="maximum growth rate (1/d)",pch=1) 

title(main="Light Intensity vs. Max Growth Rate")

fit <- lm(rmax~Light)

summary(fit); abline(fit)

c1 <- round(fit$coef[1],digits=3) 	# intercept	

c2 <- round(fit$coef[2],digits=3) 	# slope

text(50,3,paste("rmax=",c1,"+",c2,"light")) 

#############
plot(Logrmax~LogLight,data=X,xlab=" Loglight intensity (uE/m2/s)",ylab="Log maximum growth rate (1/d)",pch=10) 

title(main="LogLight Intensity vs. Log Max Growth")

fit2 <- lm(Logrmax~LogLight)

summary(fit2); abline(fit2) 

################################################################################################
# Above repeated with mfcol=c(1,2)
par(mfcol=c(1,2))

plot(rmax~light,data=X,xlab="light intensity (uE/m2/s)",ylab="maximum growth rate (1/d)",pch=1)

title(main="Light Intensity vs. Max Growth Rate")

fit <- lm(rmax~Light)

summary(fit); abline(fit)

c1 <- round(fit$coef[1],digits=3) 	# intercept	

c2 <- round(fit$coef[2],digits=3) 	# slope

text(50,3,paste("rmax=",c1,"+",c2,"light")) 

#############
plot(Logrmax~LogLight,data=X,xlab=" Loglight intensity (uE/m2/s)",ylab="Log maximum growth rate (1/d)",pch=10) 

title(main="LogLight Intensity vs. Log Max Growth")

fit2 <- lm(Logrmax~LogLight)

summary(fit2); abline(fit2)



