library(shinymanager)
library(fresh)



set_labels(
  language = "en",
  "Please authenticate" = "Informe Semanal",
  "Username:" = "Usuario:",
  "Password:" = "Contraseña:",
  "Login" = "Iniciar sesión"
)

ui <- fluidPage(tags$head(
  tags$style(HTML("   .form-control{
                      border-radius:10px 10px 10px 10px;
  }
                      .h3{
                      color:red;
                      }
                      #fecha1 {
                      color: black;
                      background: white;
                      font-family: 'Times New Roman', Times, serif;
                      font-size: 20px;
                      font-style: arial;
                      text-align:center;
                         border: none;}"))),
  mainPanel(img(src = "logo2.png", width = 1300),height = 140, width = 400),
  titlePanel(h1("Informe semanal", align = "center")),
  fluidRow(column(4,br()),
           column(4,
                  dateInput("date1", label = h3("Elige fecha actual"),
                            format = "dd/mm/yy",
                            value = "2022-01-01", lang ="es",
                            width ="400px",
                            tags$style( "#date1 { height: 50px; width: 100%; text-align:left; font-size: 30px; display: block; color:red")),
                  hr()),column(4,br()),
           #column(2,
            #      dateInput("date2", label = h3("Fecha dos"), value = "2022-01-01"),
             #     hr())
           ),
  fluidRow(column(4,br()),
           column(4,
                  downloadButton("report", "Generate report"))),
  h4("Elegiste la fecha", tags$style( "h4{ height: 50px; width: 100%; text-align:center;
                                      margin-left: -135px; display: block;color: black;
                                      font-size: 23px")),
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
