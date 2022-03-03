library(shinymanager)
library(fresh)



set_labels(
  language = "en",
  "Please authenticate" = "Informe Semanal",
  "Username:" = "Usuario:",
  "Password:" = "Contraseña:",
  "Login" = "Iniciar sesión"
)

ui <- fluidPage(
  mainPanel(img(src = "logo2.png", width = 1300),height = 140, width = 400),
  titlePanel(h1("Informe semanal", align = "center")),
  fluidRow(column(4,br()),
           column(4,
                  dateInput("date1", label = h3("Fecha inicial"), value = "2022-01-01", lang ="es",
                            width ="400px", tags$style( "#string { height: 50px; width: 100%; text-align:center; font-size: 30px; display: block;")),
                  hr()),column(4,br()),
           #column(2,
            #      dateInput("date2", label = h3("Fecha dos"), value = "2022-01-01"),
             #     hr())
           ),
  fluidRow(column(4,br()),
           column(4,
                  downloadButton("report", "Generate report"))),
  verbatimTextOutput("fecha1"),
  #verbatimTextOutput("fecha2")
)

#191B4F

ui <- secure_app(ui,
                 tags_top = tags$div(
                   tags$head(
                     tags$style(
                       ".row {
                       background-color: white;"
                     ),
                     tags$style(
                       ".panel-body {
                       background-color: white;"
                     ),
                     tags$style(
                       ".panel-auth {
                       background-color: white;"
                     ),
                     tags$style(
                       'body {color:black; font-size: 20px}',
                       )
                   ), tags$img(
                     src = "logo_sisc.png", width = 200, height = 200, deleteFile=FALSE
                   )
                   ))
