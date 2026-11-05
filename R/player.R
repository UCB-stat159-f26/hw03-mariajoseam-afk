# Transform or format the players name - For example: "aryna sabalenka", "Aryna Sabalenka" or "ArynaSabalenka" into "ArynaSabalenka"
format_player_name <- function(player_name) {
  words <- strsplit(trimws(player_name), "\\s+")[[1]]
  if (length(words) > 1) words <- tolower(words)
  words <- paste0(toupper(substr(words, 1, 1)), substring(words, 2))
  paste(words, collapse = "")
}

# URL for a player based on funciton (player_name)
build_career_url <- function(player_name) {
  paste0("https://www.tennisabstract.com/jsmatches/",
         format_player_name(player_name), "Career.js")
}