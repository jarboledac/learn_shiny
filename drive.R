library(googledrive)

path <- "../semanal-341319-33e631a3390c.json"
drive_auth(path = path)
#drive_auth(
#  email = "driveconect@semanal-341319.iam.gserviceaccount.com",
#  path = path,
#  scopes = "https://www.googleapis.com/auth/drive",
#  cache = gargle::gargle_oauth_cache(),
#  use_oob = gargle::gargle_oob_default(),
#  token = NULL
#)

print(drive_ls(path = "Backup"))
#drive_ls(path = NULL)

#drive_download(file = "informe-diario-homicidio-20220220.pdf")
#drive_rm("informe-diario-homicidio-20220220.pdf")
#drive_rm("bla2")
