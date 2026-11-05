# Process JS to a list of matches (Based on my script where I cleaned the data)
process_career_js <- function(js_text) {
  json_txt <- sub("^[^\\[]*", "", js_text)
  json_txt <- sub(";\\s*$", "", json_txt)
  jsonlite::fromJSON(json_txt, simplifyVector = FALSE)
}

# Get the fields
get_field <- function(matches, i) {
  vapply(matches, function(r) {
    if (length(r) >= i && !is.null(r[[i]])) as.character(r[[i]]) else NA_character_
  }, character(1))
}

# Data base
career_db <- function(matches, player_dob) {
  date <- as.Date(get_field(matches, 1), format = "%Y%m%d")
  result_raw <- get_field(matches, 5)
  career <- data.frame(
    date       = date,
    tournament = get_field(matches, 2),
    surface    = get_field(matches, 3),
    opponent   = get_field(matches, 12),
    result     = ifelse(result_raw == "W", "Win", ifelse(result_raw == "L", "Loss", NA)),
    player_age = age_in_years(player_dob, date),
    oppon_age    = opp_age(get_field(matches, 17), date)
  )
  career$diff_age <- career$player_age - career$oppon_age
  career[order(career$date), ]
}