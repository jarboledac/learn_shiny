source(Sys.getenv("PATH_USER"))



user <- users
pwds <- pwd

credentials <- data.frame(
  user = user, # mandatory
  password = pwd, # mandatory
  start = c("2019-04-15"), # optimal (all others)
  expire = c(NA, NA, NA),
  admin = c(FALSE, TRUE, FALSE),
  comment = "Simple and secure authentification mechanism
  for single ‘Shiny’ applications.",
  stringsAsFactors = FALSE
)
