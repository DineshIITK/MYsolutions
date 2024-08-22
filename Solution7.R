library(tidyverse)
library(rvest)


html = read_html("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now")


hlinks = html %>% html_elements(".article_movie_title a ") %>% html_attr("href")

len1 = length(hlinks)
revs = numeric(len1)
rating = numeric(len1)
tmeter = numeric(len1)
pmeter = numeric(len1)

for(i in 1:100){
  movie = read_html(hlinks[i])
  revs[i] = movie %>% html_elements("rt-link[slot = criticsReviews]") %>% html_text()
  rating[i] = movie %>% html_elements("rt-link[slot = audienceReviews]") %>% html_text()
  tmeter[i] = movie %>% html_elements("rt-button[slot = criticsScore]") %>% html_text()
  pmeter[i] = movie %>% html_elements("rt-button[slot = audienceScore]") %>% html_text()
}

# Encountered error : Error in open.connection(x, "rb") : HTTP error 403.

for(i in 1:len1){
  revs[i] = sum(as.numeric(strsplit(revs[i]," ")[1]) , rm.na = TRUE)
}
