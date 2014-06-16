library(shiny)
shinyServer(
    function(input, output) {
        chickData = chickwts
        chickData$feed = with(chickData, reorder(feed, weight, mean))
        chickData$cost[chickData$feed == "horsebean"] = 10
        chickData$cost[chickData$feed == "linseed"] = 14
        chickData$cost[chickData$feed == "soybean"] = 15
        chickData$cost[chickData$feed == "meatmeal"] = 16
        chickData$cost[chickData$feed == "casein"] = 20
        chickData$cost[chickData$feed == "sunflower"] = 19
        
        chickData$feed = with(chickData, reorder(feed, weight, mean))

        output$allBoxplot = renderPlot((boxplot(weight ~ feed, data=chickData)))

        output$Boxplot = renderPlot((boxplot(weight ~ feed, data=chickData, 
                              subset = feed %in% c(input$ftype1, input$ftype2))))
        output$ftype1Summary = renderPrint({
            sprintf("%s: mean weight = %.2f and average cost to feed 10 chicks = $%2.2f", 
                    input$ftype1,
                    mean(chickData$weight[chickData$feed == input$ftype1]),
                    mean(chickData$cost[chickData$feed == input$ftype1]))
        })
        output$ftype2Summary = renderPrint({
            sprintf("%s: mean weight = %.2f and average cost to feed 10 chicks = $%2.2f", 
                    input$ftype2,
                    mean(chickData$weight[chickData$feed == input$ftype2]),
                    mean(chickData$cost[chickData$feed == input$ftype2]))
        })
    }
)
