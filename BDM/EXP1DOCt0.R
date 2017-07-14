library(tidyverse)
library(readr)
library (ggplot2)

#Set working directory using "session" tab and navigate to GEOL_590, store csv in data file, store R script in BDM file

EXP1DOCt0<-read_csv("data/exp1docmbc_t0.csv")

EXP1DOCt0 #show this in markdown

#DOC table
EXP1DOCt0_2<- EXP1DOCt0 %>%
  na.omit %>%
  group_by (Mulch,Temp)  %>%
  summarise (avg = mean (DOC0), n = length(DOC0), sd = sd(DOC0), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)
EXP1DOCt0_2 #show this in markdown 

#MBC table
EXP1MBC_2<- EXP1DOC %>%
  group_by (Mulch,Temp)  %>%
  summarise (avg = mean (MBC), n = length(MBC), sd = sd(MBC), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)
EXP1MBC_2 #show this in markdown 

write.csv(EXP1DOC_2, "data/EXP1DOC_summary.csv")
write.csv(EXP1MBC_2, "data/EXP1MBC_summary.csv")

#4 plots of DOC (each mulch with each column a different temperature)
EXP1DOC_plot<- EXP1DOC_2 %>%
  ggplot(aes(x= Temp, y= avg)) + 
  geom_bar(stat = "identity", fill="dodgerblue3") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab("DOC ug-C/ g-Dry soil\n")+ xlab("\nTreatment") +
  theme (
    axis.text = element_text(size = 8)) + 
  facet_wrap(~Mulch)
EXP1DOC_plot

#4 plots of MBC (each mulch with each column a different temperature)
EXP1MBC_plot<- EXP1MBC_2 %>%
  ggplot(aes(x= Temp, y= avg)) + 
  geom_bar(stat = "identity", fill="dodgerblue") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab("MBC ug-C/ g-Dry soil\n")+ xlab("\nTreatment") +
  theme (
    axis.text = element_text(size = 8)) + 
  facet_wrap(~Mulch)
EXP1MBC_plot

ggsave("data/EXP1DOC_plot.png", width=7, height=5, dpi=100)
ggsave("data/EXP1MBC_plot.png", width=7, height=5, dpi=100)


#Statistics- needs more work- planning to use Tukey multiple comparisons, look at stats notes
exp1.aov <- aov(avg ~ Temp, data = EXP1DOC_2)
summary (exp1.aov)
TukeyHSD(exp1.aov)

exp1.aov <- aov(DOC ~ Temp+Mulch, data = EXP1DOC)
summary (exp1.aov)



