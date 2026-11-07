# Mockup content (HW3 instructions)
female_js <- 'var morematchmx = [["19951030", "Canadian Open", "Carpet", "W", "L", "", "", "WC", "Q1", "6-1 6-1", "3", "Anne Miller", "149", "7", "", "R", "19770119", "", "USA", "0", "", "", "", "", "", "", "1995-W-WT-CAN-02A-1995-013"],
  ["19970307", "Indian Wells", "Hard", "W", "L", "", "", "WC", "Q1", "6-4 6-0", "3", "Alexia Dechaume Balleret", "87", "", "", "R", "19700503", "", "FRA", "0", "", "", "", "", "", "", "1997-W-WT-USA-02A-1997-006"],
  ["19970804", "Manhattan Beach", "Hard", "W", "L", "", "", "WC", "Q3", "7-6 4-6 6-3", "3", "Magui Serna", "54", "6", "", "L", "19790301", "167", "ESP", "0", "", "", "", "", "", "", "1997-W-WT-USA-07A-1997-026"]]'

male_js <- 'var morematchmx = [["20010910", "Spain F10", "Hard", "S", "L", "", "", "WC", "R32", "2-6 7-5 6-2", "3", "Guillermo Platel", "731", "", "", "R", "22.264202601", "", "ESP", "0", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "2001-M-FU-ESP-10A-2001-002", "", "1", "1"],
  ["20010917", "Seville CH", "Clay", "C", "L", "", "", "WC", "R16", "3-6 6-1 6-3", "3", "Stefano Galvani", "161", "2", "", "R", "24.2902121834", "178", "ITA", "0", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "2", "", "", "", "2001-784-024", "", "2", "2"],
  ["20010917", "Seville CH", "Clay", "C", "W", "", "", "WC", "R32", "6-4 6-4", "3", "Israel Matos Gil", "751", "", "Q", "U", "18.7597535934", "", "ESP", "0", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "2001-784-015", "", "1", "1"]]'

test_that("the file text is processed into only one element", {
  expect_length(process_career_js(female_js), 3)
  expect_length(process_career_js(male_js), 3)
})

test_that("files for female players get opponent age from birth date", {
  df <- career_db(process_career_js(female_js), as.Date("1981-09-26"))
  expect_equal(df$oppon_age[1], 6858 / 365.25)
})

test_that("files for male players keep the opponent age as in the JS", {
  df <- career_db(process_career_js(male_js), as.Date("1986-06-03"))
  expect_equal(df$oppon_age, c(22.264202601, 24.2902121834, 18.7597535934))
})

test_that("match results are actually converted to Win and Loss", {
  df <- career_db(process_career_js(male_js), as.Date("1986-06-03"))
  expect_equal(df$result, c("Loss", "Loss", "Win"))
})