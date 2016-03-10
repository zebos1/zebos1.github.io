#shiny app
library(shiny)

ui=fluidPage(h1(em("Oooo Shiny!")),
             shinyUI(fluidPage(
               titlePanel("Yay Rstudio!"),
               
               sidebarLayout(position = "right",
                             sidebarPanel( "sidebar panel with no real purpose"),
                             mainPanel(img(src = "bigorb.png", height = 300, width = 300)
                            )
               )
             )),
             numericInput(inputId = "n",
                          "Sample size", value = 25),
             plotOutput(outputId = "hist"))
server=function(input,output){
  output$hist <- renderPlot({
    hist(rnorm(input$n))
  })
}
shinyApp(ui,server)
