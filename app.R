library(shiny)

#ui <- fluidPage(
#  "Hello World"
#)

#ui <- fluidPage(
#  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
#  verbatimTextOutput("summary"),
 # tableOutput("table")
#)

#server<- function(input, output, session){
#  dataset <- reactive(get(input$dataset, "package:datasets"))
#  output$summary <- renderPrint({
#    summary(dataset())
#})
#  output$table <- renderTable({
#    dataset()
#    })
#}

#ui <- fluidPage(
#  textInput("name","what's your name?"),
#  textOutput("greeting")
#)

#server <- function(input, output, session){
#  output$greeting <- renderText({
#    paste0("Hello ", input$name)
#  })
#}

ui<- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50,
                        value = 30),
  sliderInput("y", label = "If y is", min = 1, max = 50,
              value = 30),
  "then x times 5 is",
  textOutput("product")
)

server <- function(input, output, session){
    output$product <- renderText({
      input$x*input$y
    })
}
shinyApp(ui, server)

