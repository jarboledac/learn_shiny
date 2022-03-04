library(googledrive)

#Autenticación
path <- Sys.getenv("PATH_JSON")
drive_auth(path = path)
#print(drive_ls(path = "Backup"))


exc_file <-"sondeo_de_opinion.xlsx"
rmd_file <- "prueba.Rmd"
format_output <- "pdf"

Sys.setlocale(locale="es_ES.UTF-8")


server <- function(input, output, session){
  #check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )

  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })

  ##content
  output$report <- downloadHandler(
    filename = paste("report.",format_output, sep = ""), content = function(file){
      #id1 <- showNotification("Descargando archvio",duration = NULL,closeButton = FALSE,
      #                       action = drive_download(file = "sondeo_de_opinion.xlsx", path = "./data/sondeo_de_opinion.xlsx"))
      withProgress(drive_download(file = exc_file, path = paste("./data/",exc_file, sep = ""), overwrite = TRUE),
                   message = "Descargando archivo")
      #on.exit(removeNotification(id1), add = TRUE)
      id <- showNotification(
        "Rendering report...",
        duration = NULL,
        closeButton = FALSE
      )
      on.exit(removeNotification(id), add = TRUE)
      rmarkdown::render(rmd_file, output_file = file,
                        params = list(date_one = stringr::str_to_sentence(toString(format(input$date1,"%B %d de %Y"))),
                                      date_two = input$date2),
                        envir = new.env(parent = globalenv())
      )
      fl <- "./data/sondeo_de_opinion.xlsx"
      if(file.exists(fl)){
        file.remove(fl)
      }})
  output$fecha1 <- renderText(stringr::str_to_sentence(toString(format(input$date1,"%B %d de %Y"))))
  #output$fecha2 <- renderPrint(input$date2)

}

