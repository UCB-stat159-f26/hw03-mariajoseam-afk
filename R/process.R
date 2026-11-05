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