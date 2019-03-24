
# tablas en html -----

library(XML)
url <- "../bases-de-datos/WorldPopulation-wiki.htm"
tablas <- readHTMLTable(url, which = 6)
tabla2 <- tablas[[2]]


# datos no estructurados -----

library(rvest)
url <- "https://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature"

#leyendo el html 
peliculas <- read_html(url)

## Extrayendo titulo 

# extrayendo los nodos de los titulos con la clase css
nodos_tiulos <- html_nodes(peliculas,".lister-item-header a")
# convirtiendo a texto 
titulos <- html_text(nodos_tiulos)

# Usando el operador de tuberias
#extrayendo titulo de las peliculas
titulo2 <- peliculas %>% html_nodes(".lister-item-header a") %>% html_text()
# extrayendo la calificación de las peliculas
rank <- peliculas %>% html_nodes(".ratings-imdb-rating strong") %>% html_text() %>% as.numeric()

# haciendo la base de datos. 
base <- data.frame(titulo2, rank)


