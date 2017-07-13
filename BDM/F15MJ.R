library(tidyverse)
library(readr)
library (ggplot2)

F15MJ<-read_csv("data/RbdmsqaF15MJ.csv")


F15MJ_2<- F15MJ %>%
  group_by (Treatment)  %>%
  summarise (avg = mean (Carbon), n = length(Carbon), sd = sd(Carbon), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)

write.csv(F15MJ_2, "data/F15MJ_summary.csv")

bdm.aov <- aov(Carbon ~ Treatment, data = F15MJ)
summary (bdm.aov)
TukeyHSD(bdm.aov)

F15MJ_plot<- F15MJ_2 %>%
  ggplot(aes(x= Treatment, y= avg)) + 
  geom_bar(stat = "identity", fill="coral3") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab("ug-C/ g-Dry soil/ day\n")+ xlab("\nTreatment") +
  theme (
    axis.text = element_text(size = 8))
F15MJ_plot
ggsave("data/F15MJ_plot.png", width=7, height=5, dpi=100)


