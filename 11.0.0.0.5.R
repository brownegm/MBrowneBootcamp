###problem 11.0.0.0.5 
##Use ?par to read about other plot control 
##parameters that can be set using par(). 
##Then draw a 2×2 set of plots, each showing the line y=5x+3 with 
##x running from 3 to 8, but with 4 different line styles and 4 different line colors.

?par
x<-0:10
y<-5*x+3

par(mfcol=c(2,2),lty=4)
#solid line style
#par(lty=1)
plot(x,y,xlim=c(3,8))

#dashed line style
#par(lty=2)
plot(x,y,xlim=c(3,8))

#dotdash line
#par(lty=4)
plot(x,y,xlim=c(3,8))

#longdash line style
#par(lty=5)
plot(x,y,xlim=c(3,8))
