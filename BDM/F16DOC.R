library(tidyverse)
library(readr)
library (ggplot2)

F16DOC<-read_csv("data/RbdmsqaF16DOC.csv")


F16DOC_2<- F16DOC %>%
  group_by (Treatment)  %>%
  summarise (avg = mean (Carbon), n = length(Carbon), sd = sd(Carbon), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)

write.csv(F16MJ_2, "data/F16DOC_summary.csv")

bdm.aov <- aov(Carbon ~ Treatment, data = F16DOC)
summary (bdm.aov)
TukeyHSD(bdm.aov)

F16DOC_plot<- F16DOC_2 %>%
  ggplot(aes(x= Treatment, y= avg)) + 
  geom_bar(stat = "identity", fill="dodgerblue3") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab("ug-C/ g-Dry soil\n")+ xlab("\nTreatment") +
  theme (
    axis.text = element_text(size = 8))
F16DOC_plot
ggsave("data/F16DOC_plot.png", width=7, height=5, dpi=100)


