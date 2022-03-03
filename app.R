library(shiny)
library(tinytex)
source("./ui.R")
source("./credentials.R")
source("./server.R")



shinyApp(ui, server)
