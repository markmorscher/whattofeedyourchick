library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("What to Feed Your Chicks"),
    sidebarPanel(
        p('The following tool will assist you in selecting the proper feed type
          you want to feed your baby chicks.  Select two different feed types to
          compare, and the relative box plots and statistics for how much weight
          the chicks will gain after six weeks will appear on the right, as well
          as the fictitious cost to feed 10 chicks with that feed type.'),
        h4('Select two feed types to compare'),
        selectInput("ftype1", "Feed Type 1:", choices = c("horsebean", "linseed", 
                                               "soybean", "meatmeal", "casein", 
                                               "sunflower")) ,
        selectInput("ftype2", "Feed Type 2:", choices = c("horsebean", "linseed", 
                                               "soybean", "meatmeal", "casein", 
                                               "sunflower")) ,
        submitButton("Update View"),
        h4("All Feed Types:"),
        plotOutput('allBoxplot')
    ),
    mainPanel(
        h3('Feed Stats'),
        h4('Comparison of Selected Feed Types'),
        verbatimTextOutput("ftype1Summary"),   
        verbatimTextOutput("ftype2Summary"),   
        plotOutput('Boxplot'),
        p(''),
        p('Data for feed type and weights is fromt the chickwts dataset
          (?chickwts for more information) available from the datasets package.
          The cost information is purely fictional and something I added to make
          the presentation more interesting.')
        
    )
))
