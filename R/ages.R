# Age (365.25 accounts for leap years)
age_in_years <- function(birth_date, match_date) {
  as.numeric(match_date - birth_date) / 365.25
}

# Oppage: female files give birth dates (YYYYMMDD), while male files give ages
opp_age <- function(field, match_date) {
  values <- field[!is.na(field) & field != ""]
  if (all(grepl("^[0-9]{8}$", values))) {
    age_in_years(as.Date(field, format = "%Y%m%d"), match_date)
  } else {
    as.numeric(field)
  }
}