library(tidyverse)
library(readr)
library (ggplot2)

#Set working directory using "session" tab and navigate to GEOL_590, store csv in data file, store R script in BDM file

EXP1TOC<-read_csv("data/exp1tocd13c.csv")

EXP1TOC #show this in markdown

#TOC table
EXP1TOC_2<- EXP1TOC %>%
  group_by (Mulch,Temp)  %>%
  summarise (avg = mean (TOC), n = length(TOC), sd = sd(TOC), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)
EXP1TOC_2 #show this in markdown 

#to make temp plot not continuous:

EXP1TOC$Temp <- as.character(EXPTOC$Temp)
#d13C table
EXP1d13C_2<- EXP1TOC %>%
  group_by (Mulch,Temp)  %>%
  summarise (avg = mean (d13C), n = length(d13C), sd = sd(d13C), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)
EXP1d13C_2 #show this in markdown 

write.csv(EXP1TOC_2, "data/EXP1DOC_summary.csv")
write.csv(EXP1d13C_2, "data/EXP1DOC_summary.csv")

#1 plots of TOC 
EXP1TOC_plot<- EXP1TOC_2 %>%
  ggplot(aes(x= Temp, y= avg)) + 
  geom_bar(stat = "identity", fill="coral1") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab("TOC mg-C/ g-Dry soil\n")+ xlab("\nTemperature") +
  theme (
    axis.text = element_text(size = 8))+
  facet_wrap(~Mulch)
EXP1TOC_plot

#1 plot of d13C 
EXP1d13C_plot<- EXP1d13C_2 %>%
  ggplot(aes(x= Mulch, y= avg, colour = Temp)) + 
  geom_point () +
  #geom_bar(stat = "identity", fill="coral3") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab("d13C\n")+ xlab("\nTreatment") +
  scale_fill_discrete() +
  theme (
    axis.text = element_text(size = 8)) 
EXP1d13C_plot

ggsave("data/EXP1TOC_plot.png", width=7, height=5, dpi=100)
ggsave("data/EXP1d13C_plot.png", width=7, height=5, dpi=100)

