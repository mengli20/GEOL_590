library(tidyverse)
library(readr)
library (ggplot2)

co2evol<-read_csv("data/redoco2evolved4.csv", col_types = cols(
  meday = col_date("%m/%d/%y")))

class (co2evol$metemp)

co2evol_2<- co2evol %>%
  group_by (memulch, metemp, meday)  %>%
  summarise (avg = mean (meco2), n = length(meco2), sd = sd(meco2), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se) %>%
  ggplot(aes(meday,avg, colour = memulch)) + 
  geom_point() + geom_line() + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  facet_wrap(~metemp)+
  #facet_grid(.~ memulch) +
  ylab(expression("Cumulative CO"[2]*~mu*"g-C/g-Dry soil"))+ xlab("\nDate") + 
  scale_color_discrete(name = "Treatment", labels = c("BioAgri","Cellulose", "No mulch", "PLA/PHA"))+
  theme (
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size= 12),
    axis.title.x = element_text(size= 14),  
    axis.title.y = element_text(size= 14), 
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 12))
print (co2evol_2)
ggsave("data/Rbdmexp1.png", width=10, height=5, dpi=100)


#30C 
co2evol_30<- co2evol %>%
  group_by (memulch, metemp, meday)  %>%
  filter (metemp == "30") %>%
  summarise (avg = mean (meco2), n = length(meco2), sd = sd(meco2), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se) %>%
  ggplot(aes(meday,avg, colour = memulch)) + 
  geom_point() + geom_line() +
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylim (0, 1250) +
  ylab(expression("Cumulative CO"[2]*~mu*"g-C/g-Dry soil"))+ xlab("\nDate") +
  scale_color_discrete(name = "Treatment", labels = c("BioAgri","Cellulose", "No mulch", "PLA/PHA")) + 
  theme (
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size= 12),
    axis.title.x = element_text(size= 14),  
    axis.title.y = element_text(size= 14), 
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 12))
print (co2evol_30)
ggsave("data/Rbdmexp130.png",  width=7, height=5, dpi=100)

#20C 
co2evol_20<- co2evol %>%
  group_by (memulch, metemp, meday)  %>%
  filter (metemp == "20") %>%
  summarise (avg = mean (meco2), n = length(meco2), sd = sd(meco2), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se) %>%
  ggplot(aes(meday,avg, colour = memulch)) + 
  geom_point() + geom_line() +
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylim (0, 1250) +
  ylab(expression("Cumulative CO"[2]*~mu*"g-C/g-Dry soil"))+ xlab("\nDate") +
  scale_color_discrete(name = "Treatment", labels = c("BioAgri","Cellulose", "No mulch", "PLA/PHA")) +
  theme (
      axis.text.x = element_text(size = 12),
      axis.text.y = element_text(size= 12),
      axis.title.x = element_text(size= 14),  
      axis.title.y = element_text(size= 14), 
      legend.title = element_text(size = 12),
      legend.text = element_text(size = 12))
print (co2evol_20)
ggsave("data/Rbdmexp120.png", width=7, height=5, dpi=100)

#10C 
co2evol_10<- co2evol %>%
  group_by (memulch, metemp, meday)  %>%
  filter (metemp == "10") %>%
  summarise (avg = mean (meco2), n = length(meco2), sd = sd(meco2), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se) %>%
  ggplot(aes(meday,avg, colour = memulch)) + 
  geom_point() + geom_line() +
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab(expression("Cumulative CO"[2]*~mu*"g-C/g-Dry soil"))+ xlab("\nDate") +
  scale_color_discrete(name = "Treatment", labels = c("BioAgri","Cellulose", "No mulch", "PLA/PHA")) +
  theme (
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size= 12),
    axis.title.x = element_text(size= 14),  
    axis.title.y = element_text(size= 14), 
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 12))
co2evol_10
ggsave("data/Rbdmexp110.png", width=7, height=5, dpi=100)

write.csv(co2evol_10, "data/Rbdmexp110.csv")
write.csv(co2evol_20, "data/Rbdmexp120.csv")
write.csv(co2evol_30, "data/Rbdmexp130.csv")
write.csv(co2evol_2, "data/Rbdmexp1.csv")

#separate out into 4 separate graphs 
#problems (co2evol)
#vignette("column-types") 
#?as.Date
#?strptime