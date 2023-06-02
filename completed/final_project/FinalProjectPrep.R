id <- '34df081ca3d64c60bc7368444093f2c5'
secret <- '42465c92d3e34cb9b9f8c0dcc76d4f64'

library(spotifyr)

Sys.setenv(SPOTIFY_CLIENT_ID = id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = secret)
access_token <- get_spotify_access_token()

library(jsonlite)
library(dplyr)

json_playlists <- fromJSON('~/GitHub/dsc520/completed/final_project/MyData/Playlist1.json')
playlists <- data.frame(json_playlists)
fav <- filter(playlists, playlists.name == 'Favorites')
favs <- fav[[3]][[1]]

json_library <- read_json('~/GitHub/dsc520/completed/final_project/MyData/YourLibrary.json')
json_history0 <- read_json('~/GitHub/dsc520/completed/final_project/MyData/StreamingHistory0.json')
json_history1 <- read_json('~/GitHub/dsc520/completed/final_project/MyData/StreamingHistory1.json')

playlists <- parse_json(json_playlists, .na = json_na_error(), .null = NULL, flatten = TRUE)
# json_library <- parse_json(json_library)
# history0 <- parse_json(json_history0)
# history1 <- parse_json(json_history1)

# playlists <- fromJSON('~/GitHub/dsc520/completed/final_project/MyData/Playlist1.json')

# playlists <- get_user_playlists(id)