#' Get the career matches of a tennis player
#'
#' @param player_name Player's name, e.g. "Aryna Sabalenka" or "ArynaSabalenka".
#' @return A data base each row is a match.
#' @export
get_career <- function(player_name) {
  matches <- process_career_js(download_career_js(build_career_url(player_name)))
  female <- is_female_career(matches)
  page <- download_career_js(build_player_url(player_name, female))
  career <- career_db(matches, extract_dob(page))
  career$player <- player_name
  career
}