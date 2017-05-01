dev.copy (png, ("uglyplot2.png"))
library(tidyverse)
library(readr)
ug<-read_csv("UglyPlot.csv")
str(ug)

ug$Date = as.Date(ug$Date, format = "%m/ %d/ %Y")
#How is it reading as.Date
#?as.Date
#?strptime

uglyplot<- ggplot(ug, aes (x= Date, y= CO2_cumulative)) + 
  geom_point(colour = "red", size=5) + 
  geom_line() + 
  facet_wrap(~Temperature) +
  geom_smooth(method = "lm", se = FALSE, colour= "green", linetype=4, size = 5) +
  ylab("CO2 parts per million")+ xlab("Date (Month of the Year)") + 
  theme_classic() +
  ggtitle("Cumulative CO2 Respired from Biodegradable Plastic Mulch (16 Weeks)")+
  theme(
    axis.text = element_text(colour = "pink"),
    axis.title.x = element_text(colour = "orange", size=rel(2)),
    axis.title.y = element_text(colour = "blue", angle=45),
    panel.background = element_rect(fill = 'yellow', colour = 'green'),
    plot.background = element_rect(fill="red"))   



dev.off()




