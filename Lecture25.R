#1. The following R code is intended to count how many values contained in the vector x are above 10 and
#how many are below 10 and then print both values. Unfortunately, the code isn’t working. Fix the code so
#that it works as intended.

count<-1
for(i in 1:length(count)){
  if(x[count]>=10){
    count<-count+1
  }
  count2<-count2+1
}
}
print(c("There are this many values below 10 in x:",count))
print(c("There are this many values above 10 in x:",count2))


#Fixed code:
x <- c(2, 4, 7, 12, 40, 3, 13) #could also do x <- runif(50, 0, 20)

count<-numeric(length=2)
for(i in 1:length(x)){
  if(x[i]>=10){
    count[1]<-count[1]+1
  }else{
  count[2]<-count[2]+1
}
}
print(c("There are this many values above 10 in x:",count[1]))
print(c("There are this many values below 10 in x:",count[2]))

#OR you could just do:
sum(x >= 10) #finds number of x greater than or equal to 10. no for loop needed

#Strategies for debugging:
#use errors from R and work thrugh those
#internal consistency checks
#check for bracket and quote closure
#check piece by piece
#use simple toy test cases



#2. Given a dataframe generated with z<-data.frame(x=runif(50,0,100),y=runif(50,0,100)) write the
#R code required to generate a scatter plot (x vs. y) for the rows of z that have the highest 25 values for y.
#Add a spline best fit line to the scatter plot.
library(ggplot2)
z<-data.frame(x=runif(50,0,100),y=runif(50,0,100)) #this randomly generates data points

z_order <- z[order(z$y, decreasing = T),]

z_25 <- head(z_order, 25)

#OR do:
z_25 <- z_order[1:25,]
  
ggplot(data = z_25, 
       aes(x = x, y = y)) +
  geom_point() +
  xlab("x") + 
  ylab("y") +
  stat_smooth(method = "loess") + #the output in purple just tells us it automatically did y ~ x for our stats because it looked at our aes for the scatterplot 
  theme_classic()
