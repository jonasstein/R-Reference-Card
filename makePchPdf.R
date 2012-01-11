makePchPdf <- function() {
  require(grid)
#  pdf('pch_symbol.pdf', width=2, height=1, pointsize = 10)
  pdf('pch_symbol.pdf', width=6, height=3, pointsize = 10)

  Pex=1
  # stuff taken from ?points
  ipch <- 1:(np <- 25+5)
  k <- 15
  iy <- rev((ipch-1) %/% k + .5) / k
  ix <- rev((k-1)-(ipch-1) %% k + .5) / k
  pch <- as.list(ipch)
  pch[25+ 1:5] <- as.list(c("*",".", "X","a","?"))
  print(ix)
  print(iy)
  for(i in 1:np) {
       pc <- pch[[i]]
       grid.points(unit(ix[i] + .025,"npc"), unit(iy[i],"npc"), pch = pc, size = unit(Pex/50,"npc"), gp = gpar(col = "black", fill = "lightgray", lwd=1), default.units="npc")
       ## red symbols with a yellow interior (where available)
       grid.text(pc, ix[i], iy[i])
     }
  dev.off()
}
