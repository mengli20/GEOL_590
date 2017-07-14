library(tidyverse)
library(readr)
library (ggplot2)

#Set working directory using "session" tab and navigate to GEOL_590, store csv in data file, store R script in BDM file

EXP1ENZ0<-read_csv("data/exp1enz03.csv")

EXP1ENZ0 #show this in markdown
#Make temp a character for graphing purposes, otherwise its a continuous integral
EXP1ENZ0$Temp <- as.character(EXP1ENZ0$Temp)

#Enzyme table
EXP1ENZ0_2<- EXP1ENZ0 %>%
  group_by (Mulch,Temp, Enzyme)  %>%
  summarise (avg = mean (Activity), n = length(Activity), sd = sd(Activity), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)
EXP1ENZ0_2 

write.csv(EXP1ENZ_2, "data/EXP1ENZ_summary.csv")

#1 plots of ENZYMES 
EXP1ENZ0_plot<- EXP1ENZ0_2 %>%
  ggplot(aes(x= Mulch, y= avg, fill = Temp)) + 
  geom_bar(stat = "identity", position=position_dodge()) + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), position=position_dodge(.9), width=0.2) +
  ylab("Activity\n")+ xlab("\nTemperature") +
  theme (
    axis.text.x = element_text(size = 8, angle = 45))+
  theme ( 
    axis.text.y = element_text(size = 8)) + 
  facet_wrap(~Enzyme, scales = "free_y")
EXP1ENZ0_plot


ggsave("data/EXP1ENZ_plot.png", width=7, height=5, dpi=100)

