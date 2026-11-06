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

# detect if it is a male or female player
is_female_career <- function(matches) {
  values <- get_field(matches, 17)
  values <- values[!is.na(values) & values != ""]
  all(grepl("^[0-9]{8}$", values))
}

# Extract the player's date of birth
extract_dob <- function(page_text) {
  dob <- regmatches(page_text, regexpr("var dob = [0-9]{8}", page_text))
  if (length(dob) == 0) stop("Could not find the player's date of birth.", call. = FALSE)
  as.Date(sub("var dob = ", "", dob), format = "%Y%m%d")
}