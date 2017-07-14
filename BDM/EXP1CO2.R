
#cumulative CO2 evoloved in units ugC/gdry soil after 16 weeks 

EXP1CO2<-read_csv("data/exp1cumco22.csv")

EXP1CO2 #show this in markdown

#CO2 evolved table
EXP1CO2_2<- EXP1CO2 %>%
  group_by (Mulch,Temp)  %>%
  na.omit %>%
  summarise (avg = mean (CO2), n = length(CO2), sd = sd(CO2), 
             se = sd/sqrt(n), ymax = avg +se, ymin = avg -se)
EXP1CO2_2 #show this in markdown 

#to make temp plot not continuous:

EXP1CO2_2$Temp <- as.character(EXP1CO2_2$Temp)

#1 plots of CO2 cumulative 
EXP1CO2_plot<- EXP1CO2_2 %>%
  ggplot(aes(x= Temp, y= avg)) + 
  geom_bar(stat = "identity", fill="darkolivegreen4") + 
  geom_errorbar((aes(ymax = ymax, ymin= ymin)), width=0.2) +
  ylab("Cumulative CO2 evolved over 16 weeks ug-C/ g-Dry soil\n")+ xlab("\nTemperature") +
  theme (
    axis.text = element_text(size = 8))+
  facet_wrap(~Mulch)
EXP1CO2_plot

