library(shinymanager)

set_labels(
  language = "en",
  "Please authenticate" = "Por favor autenticar",
  "Username:" = "Usuario:",
  "Password:" = "Contraseña:",
  "Login" = "Iniciar sesión"
)

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

ui <- secure_app(ui)
