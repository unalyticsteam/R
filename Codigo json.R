library(RCurl)
library(jsonlite)
link <- "http://www.floatrates.com/daily/usd.json"
base <- fromJSON(link)

name <- names(base)
f <- data.frame()
for (i in 1:length(name)) {
  
  data <- data.frame(base[name[i]])
  d1 <- data[1]
  d2 <- data[3]
  d3 <- data[4]
  d4 <- data[5]
  d5 <- data[6]
  d6 <- data[7]
  a1 <- data.frame(d1, d2, d3, d4, d5, d6)
  colnames(a1) <-  c("Codigo", "Numero Codigo", "Nombre", "tasa" ,"Fecha", "Tasa de inversion")
  f <- rbind(a1,f)

}


