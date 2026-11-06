# Colors, axis breaks and limits based on the NYT graphic
career_scales <- function() {
  list(
    ggplot2::scale_color_manual(values = c("Win" = "#70c8e9", "Loss" = "#8a4088"),
                                labels = c("Win" = "Match won", "Loss" = "Match lost")),
    ggplot2::scale_x_continuous(breaks = seq(10, 50, by = 2), position = "top"),
    ggplot2::scale_y_continuous(breaks = c(-20, -10, 0, 10, 20),
                                labels = c("\u221220", "\u221210", "Same age", "+10", "+20 years")),
    ggplot2::coord_cartesian(ylim = c(-20, 23))
  )
}

# Title and label
career_labels <- function(career) {
  player <- career$player[1]
  ages <- round(range(career$player_age, na.rm = TRUE))
  ggplot2::labs(
    title = paste0(player, "\u2019s Professional Matches, Age ", ages[1], " to ", ages[2]),
    x = paste0(player, "\u2019s age:"), y = NULL, color = NULL,
    caption = "Source: Tennis Abstract")
}

# Theme
career_theme <- function() {
  list(
    ggplot2::theme_minimal(base_size = 14),
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold", hjust = 0.5),
      legend.position = "top",
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(color = "#ebebeb"),
      axis.text = ggplot2::element_text(color = "grey40"),
      axis.title.x = ggplot2::element_text(hjust = 0, color = "grey40"),
      plot.caption = ggplot2::element_text(hjust = 0, color = "grey50", size = 9),
      plot.caption.position = "plot",
      plot.background = ggplot2::element_rect(fill = "white", color = NA)))
}

#' Plot the career matches of a tennis player
#'
#' @param career A data frame returned by get_career().
#' @return A ggplot object.
#' @importFrom ggplot2 .data
#' @export
plot_career <- function(career) {
  ggplot2::ggplot(career, ggplot2::aes(x = .data$player_age, y = .data$diff_age,
                                       color = .data$result)) +
    ggplot2::geom_hline(yintercept = 0, color = "#919191") +
    ggplot2::geom_point(size = 1, alpha = 0.6) +
    career_scales() + career_labels(career) + career_theme()
}