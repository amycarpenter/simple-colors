# test graph to try out some colors

library(data.table)

# cheat-sheet to remember all of the common point characters
pchPlot <- function(n = 5) {
  pch.dat <- data.table(x = unlist(lapply(1:n, function(x) rep(x, n))), y = rep(1:n, n))
  plot(pch.dat, pch = 1:(n*n),xlab = "", ylab = "", xlim = c(1,5.5))
  title(main = paste0("pch symbols 1:", n*n))
  text(x = pch.dat$x + 0.2, y = pch.dat$y, labels = 1:(n*n))
  return(TRUE)
}

colCompare <- function(colors = "default", num = length(colors), pts = 20, pch = 19) {
  # load the colors into the palette
  palette(colors)
  plot(runif(pts), pch = "", ylim = c(0.0, 1.0), ylab = "y", xlab = "x")
  # reference each color in the palette by number (becoming deprecated though?)
  for (i in 1:num) {
    points(runif(pts), col = i, pch = pch, cex = 1.25)
  }
  # restore palette to default colors
  palette("default")
}

# examples and fun
pchPlot()
colors <- c("#489E2E", "#5656FB", "#FD5879")
colCompare(colors, num = 1)
colCompare(colors)
colCompare(num = 6)
colCompare(num = 6, pch = 1)

