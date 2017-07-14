library(tidyverse)
library(readr)
library (ggplot2)

#Set working directory using "session" tab and navigate to GEOL_590, store csv in data file, store R script in BDM file

EXP1TOC0<-read_csv("data/exp1tocd13c_t0.csv")

EXP1TOC0 #show this in markdown

#TOC table
EXP1TOC0_2<- EXP1TOC0 %>%
  group_by (Mulch,Temp)  %>%
  summarise (avg = mean (TOC0), n = length(TOC0), sd = sd(TOC0), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)
EXP1TOC0_2 #show this in markdown 

#to make temp plot not continuous:

EXP1TOC0_2$Temp <- as.character(EXP1TOC0_2$Temp)

#1 plots of TOC with t=0 value subtracted
EXP1TOC0_plot<- EXP1TOC0_2 %>%
  ggplot(aes(x= Temp, y= avg)) + 
  geom_bar(stat = "identity", fill="coral1") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab("Change in TOC after 16 weeks mg-C/ g-Dry soil\n")+ xlab("\nTemperature") +
  theme (
    axis.text = element_text(size = 8))+
  facet_wrap(~Mulch)
EXP1TOC0_plot


