library(tidyverse)
library(readr)
library (ggplot2)

F16MJ<-read_csv("data/RbdmsqaF16MJ.csv")


F16MJ_2<- F16MJ %>%
  group_by (Treatment)  %>%
  summarise (avg = mean (Carbon), n = length(Carbon), sd = sd(Carbon), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)

write.csv(F16MJ_2, "data/F16MJ_summary.csv")

bdm.aov <- aov(Carbon ~ Treatment, data = F16MJ)
summary (bdm.aov)
TukeyHSD(bdm.aov)

F16MJ_plot<- F16MJ_2 %>%
ggplot(aes(x= Treatment, y= avg)) + 
  geom_bar(stat = "identity", fill="coral1") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab(expression(mu*"g-C/ g-Dry soil/ day"))+ xlab("\nTreatment") +
  scale_x_discrete(limits=c("BioAgri", "Naturecycle", "Organix", "PLA/PHA", "Cellulose", "Polyethylene", "No mulch")) +
  theme (
    axis.text.x = element_text(size = 11),
    axis.text.y = element_text(size= 14),
    axis.title.x = element_text(size= 16),  
    axis.title.y = element_text(size= 16))
F16MJ_plot
ggsave("data/F16MJ_plot.png", width=7, height=5, dpi=100)


