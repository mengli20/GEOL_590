---
title: "Test Notebook"
output:
  html_document: default
  html_notebook: default
---

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code. 

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Cmd+Shift+Enter*. 

```{r}
plot(cars)
```

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Cmd+Option+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Cmd+Shift+K* to preview the HTML file).

```{r echo=FALSE}
library(ggplot2)

# Reproducible subset of diamonds with 100 rows of 10 variables:
set.seed(1410)
dsmall <- diamonds[sample(nrow(diamonds), 100), ]

# Plot1. A scatterplot of y vs. x, colored by z values and faceted by cut 
plot1 <- ggplot(dsmall, aes (x= x, y= y, colour= z)) + 
  geom_point() +
  facet_wrap(~cut)
print(plot1)
```

```{r}
# Number of rows in diamonds 
nrow(diamonds)
#[1] 53940
```

