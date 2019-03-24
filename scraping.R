
# tablas en html -----

library(XML)
url <- "../bases-de-datos/WorldPopulation-wiki.htm"
tablas <- readHTMLTable(url, which = 6)
tabla2 <- tablas[[2]]


# no estructurados -----

library(rvest)
url <- "https://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature"

peliculas <- read_html(url)
nodos_tiulos <- html_nodes(peliculas,".lister-item-header a")
titulos <- html_text(nodos_tiulos)


# con tuberias 

titulo2 <- peliculas %>% html_nodes(".lister-item-header a") %>% html_text()


rank <- peliculas %>% html_nodes(".ratings-imdb-rating strong") %>% html_text() %>% as.numeric()


base <- data.frame(titulo2, rank)


