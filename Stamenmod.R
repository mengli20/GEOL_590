#Question from EEB 560 In class exercise
#Model the following data as being drawn from a normal distribution and calculate SE 

stamen.length.mm<-c(73.0,84.0,84.9,108.7,42.5,123.6,76.0,45.4,84.4,83.0,98.6,58.8,65.8,101.2,62.4,101.7,73.7,43.6,101.4,75.1,111.6,91.6,122.7,79.3,73.3,58.0,63.7,82.3,59.0,64.7,67.7,95.3,70.1,79.0,57.8,110.4,62.8,87.3,76.6,102.5,69.9,89.4,128.8,86.0,115.2,100.3,75.2,96.2,94.9,65.8,64.5,81.8)
stamen.mean<-mean(stamen.length.mm)
stamen.stv<-sd(stamen.length.mm)
stamen.model<-rnorm(5000,stamen.mean,stamen.stv)
plot(density(stamen.model))
#gives a density curve

stamen.SE<-stamen.stv/sqrt(53)
#[1] 2.833906
