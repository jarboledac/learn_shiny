library(shiny)
library(tinytex)
source("./drive.R")



ui <- fluidPage(
  mainPanel(img(src = "logo2.png", width = 1300),height = 140, width = 400),
  titlePanel(h1("Informe semanal", align = "center")),
  fluidRow(column(4,br()),
           column(2,
                  dateInput("date1", label = h3("Fecha uno"), value = "2022-01-01"),
                  hr()),
           column(2,
                  dateInput("date2", label = h3("Fecha dos"), value = "2022-01-01"),
                  hr())),
  fluidRow(column(4,br()),
           column(4,
                  downloadButton("report", "Generate report"))),
  verbatimTextOutput("fecha1"),
  verbatimTextOutput("fecha2")
)

exc_file <-"sondeo_de_opinion.xlsx"
#rmd_file <- "sondeo_vif_opt.Rmd"
rmd_file <- "prueba.Rmd"
format_output <- "pdf"


server <- function(input, output, session){
  output$report <- downloadHandler(
    filename = paste("report.",format_output, sep = ""), content = function(file){
      #id1 <- showNotification("Descargando archvio",duration = NULL,closeButton = FALSE,
       #                       action = drive_download(file = "sondeo_de_opinion.xlsx", path = "./data/sondeo_de_opinion.xlsx"))
      withProgress(drive_download(file = exc_file, path = paste("./data/",exc_file, sep = "")),
                   message = "Descargando archivo")
      #on.exit(removeNotification(id1), add = TRUE)
      id <- showNotification(
        "Rendering report...",
        duration = NULL,
        closeButton = FALSE
      )
      on.exit(removeNotification(id), add = TRUE)
      rmarkdown::render(rmd_file, output_file = file,
                        params = list(date_one = input$date1, date_two = input$date2),
                        envir = new.env(parent = globalenv())
      )
      fl <- "./data/sondeo_de_opinion.xlsx"
      if(file.exists(fl)){
        file.remove(fl)
      }})
  output$fecha1 <- renderPrint(input$date1)
  output$fecha2 <- renderPrint(input$date2)

  }


shinyApp(ui, server)
