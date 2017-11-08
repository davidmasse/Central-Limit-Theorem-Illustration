library(shiny)
shinyServer(function(input, output) {
        thermean <- reactive({
                lam <- input$lam
                1/lam
        })
        therstd <- reactive({
                lam <- input$lam
                obs <- input$obs
                sqrt((1/lam)^2/obs)
        })
        output$plot1 <- renderPlot({
                set.seed(8888)
                samples <- input$samples
                obs <- input$obs
                buckets <- input$buckets
                lam <- input$lam
                therm <- 1/lam
                thers <- sqrt((1/lam)^2/obs)
                mns = NULL
                for (i in 1 : samples) mns = c(mns, mean(rexp(obs, rate = lam)))
                testmean <- mean(mns)
                teststd <- sqrt(var(mns))
                hist(mns, breaks = buckets, main = "Distribution of Means of Samples from an Exponential Distribution", xlab = "means", ylab = "frequency")
                abline(v = therm, col = "blue")
                abline(v = testmean, col = "red")
                abline(v = c(therm-thers, therm+thers), col = "green")
                abline(v = c(testmean-teststd, testmean+teststd), col = "yellow")
                output$testmean <- renderText(testmean)
                output$teststd <- renderText(teststd)
        })
        output$thermean <- renderText({
                thermean()
        })
        output$therstd <- renderText({
                therstd()
        })
})
