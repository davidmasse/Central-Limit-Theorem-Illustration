library(shiny)
shinyUI(fluidPage(
        titlePanel("Sampling an Exponential Distribution to Exlpore Estimates of the Mean"),
        sidebarLayout(
                sidebarPanel(
                        h5("Choose each of 4 parameters, then click 'update' to show a histogram of the sample means and display their observed and theoretical mean and standard deviation."),
                        numericInput("samples", "number of samples (max 10,000)", 1, 10000, value = 100),
                        numericInput("obs", "observations per sample (max 10,000)", 1, 10,000, value = 20),
                        numericInput("buckets", "number of histogram buckets (max 100)", 1, 100, value = 20),
                        sliderInput("lam", "exponential distribution rate, lambda (max 10)", 0.05, 10, value = .2, step = .05),
                        submitButton("Update")
                        ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("observed mean of sample means:", style="color:red;"),
                        textOutput("testmean"),
                        h3("theoretical mean of sample means:", style="color:blue;"),
                        textOutput("thermean"),
                        h3("observed standard deviation of sample means:", style="color:yellow;"),
                        textOutput("teststd"),
                        h3("theoretical standard deviation of sample means:", style="color:green;"),
                        textOutput("therstd"),
                        h5("For an underlying exponential distribution (where lambda*exp(-lambda * x) = probability density of x), the theoretical population mean that each sample mean estimates is 1/lambda.  On the chart above, the blue vertical line is the theoretical mean of the sample means, and the vertical red line is the observed mean of the sample means.  According to the central limit theorem, for a large number of samples, the distribution of the sample means has standard deviation approaching sqrt(sigma^2/n) where sigma is the underlying population standard deviation and n is the number of observations in each sample. For the exponential distribution sigma is 1/lambda, so we have sqrt((1/lambda)^2/n) as the theoretical standard deviation of the sample means.  On the chart above, the green vertical lines are at the theoretical mean of the sample means +/- one theoretical standard deviation of the sample means. The vertical yellow lines are at the observed mean of the sample means+/- one observed standard deviation of the sample means.  As an example, the tool shows how the 'theoretical' and 'observed' lines get closer together as the number of samples increases.")
                )
        )
))
                