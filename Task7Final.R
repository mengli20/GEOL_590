#Marie English Task #7

install.packages("dplyr")
library (dplyr)
library(tidyverse)

library (nycflights13)

#1 Determine whether there are any clear outliers in wind speed (wind_speed) 
# that should be rejected. If so, filter those bad point(s) and proceed.

#Create a chart to see spread of wind_speed

outliers_ws<- nycflights13::weather %>%
  group_by (origin)  %>%
  ggplot (aes(origin, wind_speed)) + 
  geom_point ()
print (outliers_ws)

#Create a dataframe where wind speeds greater than 205mph are removed 

nycflights2<- nycflights13::weather %>%
  filter (wind_speed < 250)
nycflights2

#See how many points are removed: compare with weather, 4 outliers removed 

#################################################################

#2 What direction has the highest median speed at each airport?
# Make a table and a plot of median wind speed by direction, for each airport. 

#Table of median wind speed by direction, for earch airport 
median.ws<- nycflights2 %>%
  group_by (origin, wind_dir) %>%
  summarise (medianwind = (median(wind_speed, na.rm= TRUE)))
median.ws

#Plot of median wind speed by direction, for earch airport 
plotws<-ggplot(median.ws, aes (wind_dir, medianwind)) + 
  geom_point() +
  facet_wrap(~origin)
print (plotws)

#Directions of the highest median wind speeds at each airport: 
median.ws.max <- median.ws %>%
  filter (medianwind == max (medianwind))
median.ws.max 

##################################################

#3 Average distance from JFK for each Airline: 

flights1<-nycflights13::flights %>%
  filter (origin == "JFK") %>%
  select (carrier, distance) %>%
  left_join (airlines, by= "carrier") %>%
  select (distance, name) %>%
  group_by (name)  %>%
  summarise (avg= mean(distance)) %>%
  arrange (desc(avg)) 
flights1

##################################################

#4 Wide-frame data-set: Make a wide-format data frame that displays the number of flights 
# that leave Newark ("EWR") airport each month, from each airline

head(flights)
?nycflights13::flights

length (flights)
?flights
flights2 <- nycflights13::flights %>%
  filter (origin == "EWR") %>%
  select (flight, month, carrier)  %>%
  left_join (airlines, by= "carrier") %>%
  group_by(name)  %>%
  distinct(month, .keep_all=TRUE)  %>%
  spread (month, flight)  %>%
  select (-carrier)
flights2

###############################################

#5 Identify the ten most common male and female names in 2014. 

bbn1 <- babynames::babynames %>%
  filter (year == "2014")  %>%
  group_by (sex) %>%
  slice (1:10) %>%
  select (name,sex)
bbn1

# Make a plot of their frequency (prop) since 1880. 

bbn1_n<- inner_join(bbn1, babynames::babynames) %>%
  ggplot (aes (x= year, y= prop, colour = name)) + 
  geom_line () 

print (bbn1_n)


#########################################################

#6 Make a single table of the 26th through 29th most common girls names in the year 
# 1896, 1942, and 2016

bbn_1896 <- babynames::babynames %>%
  filter (year == 1896)  %>%
  filter (sex == "F") %>%
  arrange (desc(n)) %>%
  slice (26:29) %>%
  select (year,name) 
bbn_1896

bbn_1942 <- babynames::babynames %>%
  filter (year == 1942)  %>%
  filter (sex == "F") %>%
  arrange (desc(n)) %>%
  slice (26:29) %>%
  select (year,name) 
bbn_1942

bbn_2014 <- babynames::babynames %>%
  filter (year == 2014)  %>%
  filter (sex == "F") %>%
  arrange (desc(n)) %>%
  slice (26:29) %>%
  select (year,name) 
bbn_2014

bbn_4names <- bbn_2014 %>%
  bind_cols (bbn_1942, bbn_1896)
bbn_4names

###############################################
#7: Create your own: Plot inches of rain per month in JFK 

rainydaysplot <- nycflights13::weather %>%
  filter (origin == "JFK") %>%
  select (year, month, day, hour, precip) %>%
  filter (precip > 0) %>%
  group_by (month)  %>%
  summarise (monthlyprecip= sum(precip))  %>%
  ggplot (aes(month, monthlyprecip)) +
  geom_point () + 
  ylab("Precipitation (in)")+ xlab("Month")

print (rainydaysplot)



