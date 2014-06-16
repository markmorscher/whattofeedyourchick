---

title       : What to feed your chicks.
subtitle    : Comparing different feed type results and cost.
author      : Mark Morscher
job         : Coursera Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

--- .class #id 

## Problem Statement

You just received 10 baby chicks.  There are many options for selecting a type
of feed to use for their nourishment.  How do you select the proper feed type
to balance the growth of your chicks over the next six weeks and also meet your
budget?

To your rescue is a little application that will allow you to compare your
options so you can make an educated choice:

[What to Feed Your Chicks](https://markmorscher.shinyapps.io/shinyProject/)

--- .class #id 

## What it does

[What to Feed Your Chicks](https://markmorscher.shinyapps.io/shinyProject/)
puts a user friendly front end on the world renowned
chickwts dataset so you can easily compare the potential weight gain and cost
of six weeks of nourishment for your chicks based on the variety of feed type
options.

The underlying data is the summary of an intensive research project that
tracked the weight gain of baby chicks during the first six weeks of feeding.
While these results cannot be guaranteed, it does present a useful tool to
assist you in making this critical decision.

To use [What to Feed Your Chicks](https://markmorscher.shinyapps.io/shinyProject/),
simply select two different feed types and press "Update View" to see a boxplot
comparison of the two feed types, along with summary information as to the 
average weight gain after six weeks and cost information that will be invaluable
to you to make a decision.

**NOTE:** The cost information is completely fictitious, and was only added by the
author to make it more interesting.

---  

## How it does it

Most of the Shiny App implementation of [What to Feed Your Chicks](https://markmorscher.shinyapps.io/shinyProject/)
is pretty straightforward, however there are a couple options that were utilized.

To restrict the boxplot of the feed comparison to just the two selected feeds,
I utilized the subset command in the boxplot call to only include those:

output$Boxplot = renderPlot((boxplot(weight ~ feed, data=chickData, 
subset = feed %in% c(input$ftype1, input$ftype2))))

For the dropdown selection of a feed type, I used a selectInput control for
simplicity:

selectInput("ftype1", "Feed Type 1:", choices = c("horsebean", "linseed", 
                                               "soybean", "meatmeal", "casein", 
                                               "sunflower"))

---  

## Where you can find more

To use the app, go to:

[What to Feed Your Chicks](https://markmorscher.shinyapps.io/shinyProject/)

To see the code behind the app, visit the following github location:

https://github.com/markmorscher/whattofeedyourchick
