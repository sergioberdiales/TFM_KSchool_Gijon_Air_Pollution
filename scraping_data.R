
# Trying to write a code for downloading the csv files with the air data from the open data web of Gijón city. 

library(rvest)
air_data <- read_html("https://transparencia.gijon.es/search/risp_dataset/page/1808-catalogo-de-datos?utf8=%E2%9C%93&search=aire&search_sector=&search_format=&commit=Buscar&authenticity_token=CVnlbC8mnPRu2gBQvvcXaJfPAseldemAbrmlG%2FxLw6Y%3D")
 
air_data

head(air_data$doc)
table <- html_nodes(air_data, "table")
table_1 <- table[[1]]
