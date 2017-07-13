library(tidyverse)
library(readr)
library (ggplot2)

perbio<-read_csv("data/Rexp1percentbiod.csv")

##set the levels in order we want
#perbio <- within(perbio, 
 #               mulch <- factor(mulch, 
  #                                levels(perbio$mulch) <- c("BioAgri", "PLA/PHA", "Cellulose")))
## plot
#ggplot(theTable,aes(x=Position))+geom_bar(binwidth=1)


perbio$mulch <- factor(perbio$mulch, levels = unique(perbio$mulch[order(perbio$perbio)]))

perbio2<- perbio %>%
  ggplot(aes( x = mulch, y= perbio, fill= as.factor (temp))) + 
  geom_bar(position=position_dodge(), stat="identity", colour='black') +
  geom_errorbar((aes(ymax = perbio+se, ymin= perbio-se)), width=0.2, position=position_dodge(.9)) +
  ylab("% Biodegradation\n")+ xlab("\n Mulch") +
  #scale_fill_discrete(name="Temperature") +
  scale_fill_grey(name="Temperature") +
  theme (
      axis.text.x = element_text(size = 12),
      axis.text.y = element_text(size= 12),
      axis.title.x = element_text(size= 14),  
      axis.title.y = element_text(size= 14), 
      legend.title = element_text(size = 12),
      legend.text = element_text(size = 12))
print (perbio2)

ggsave("data/perbio3.png", width=5, height=7, dpi=100)


