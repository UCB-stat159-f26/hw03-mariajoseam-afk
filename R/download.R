# Read the career JS file of the players
fetch_career_js <- function(url) {
  not_found <- function(cond) {
    stop("Could not get career data from ", url,
         "\nCheck the player's name, e.g. \"Aryna Sabalenka\".", call. = FALSE)
  }
  tryCatch(paste(readLines(url, warn = FALSE), collapse = "\n"),
           error = not_found, warning = not_found)
}