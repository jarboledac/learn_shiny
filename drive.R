library(googledrive)

path <- "../semanal-341319-e47dd898e82e.json"

drive_auth(
  email = "drivebackup.sic@gmail.com",
  path = path,
  scopes = "https://www.googleapis.com/auth/drive",
  cache = gargle::gargle_oauth_cache(),
  use_oob = gargle::gargle_oob_default(),
  token = NULL
)

print(drive_ls(path = "Backup"))
#drive_ls(path = NULL)

#drive_download(file = "informe-diario-homicidio-20220220.pdf")
#drive_rm("informe-diario-homicidio-20220220.pdf")
#drive_rm("bla2")
