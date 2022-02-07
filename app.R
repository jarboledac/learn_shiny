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

#ui<- fluidPage(
#  sliderInput("x", label = "If x is", min = 1, max = 50,
#                       value = 30),
#  sliderInput("y", label = "If y is", min = 1, max = 50,
#              value = 30),
#  "then x times 5 is",
#  textOutput("product")
#)

#server <- function(input, output, session){
#    output$product <- renderText({
#      input$x*input$y
 #   })
#}
#


# ui <- fluidPage(
#   fileInput("file", NULL, accept = c(".csv", ".tsv")),
#   numericInput("n", "Rows", value = 5, min = 1, step = 1),
#   tableOutput("head"))
#
# server <- function(input, output, session){
#   data <- reactive({
#   req(input$file)
#   ext <- tools::file_ext(input$file$name)
#   switch(ext,
#          csv = vroom::vroom(input$file$datapath, delim = ","),
#          tsv = vroom::vroom(input$file$datapath, delim = "\t"),
#          validate("Invalid file; Please upload a .csv or .tsv file")
#   ) })
# output$head <- renderTable({ head(data(), input$n)
# }) }
ui <- fluidPage(
  fileInput("upload","Archivo",buttonLabel = "Upload...", multiple = TRUE, accept = c(".csv", ".tsv")),
  tableOutput("files"),
  downloadButton("report", "Generate report")
)
server <- function(input, output, session){
  data <- reactive({
    req(input$upload)
    ext <- tools::file_ext(input$upload$name)
    switch(ext,
           csv = vroom::vroom(input$upload$datapath, delim = ","),
           tsv = vroom::vroom(input$upload$datapath, delim = "\t"),
           validate("Invalid file; Please upload a .csv or .tsv file"))
           })
  output$files <- renderTable(input$upload)
  output$report <- downloadHandler(
    filename = "report.html", content = function(file){
      #params <- list(n = input$n)
      id <- showNotification(
        "Rendering report...",
        duration = NULL,
        closeButton = FALSE
      )
      on.exit(removeNotification(id), add = TRUE)
      rmarkdown::render("sondeo_vif_opt.Rmd", output_file = file,
                        #params = params,
                        envir = new.env(parent = globalenv())
      ) }
  ) }

shinyApp(ui, server)
