library(tidyverse)
library(rvest)


html <- read_html("https://www.iitk.ac.in/math/faculty")


# extracting all tags with class = head3. The
# "." indicates class.
name <- html_elements(html, ".head3")

# From all the head3 class, extracting all link tags
name <- html_elements(name, "a")
# Extracting the text associated with the links
name <- html_text(name)
## A faster way
name <- html_elements(html, ".head3 a")
name <- html_text(name)


name <- html %>% html_elements(".head3 a") %>% html_text()



#Question1

PDfels = read_html("https://www.iitk.ac.in/math/visitors-post-doctoral-fellow")
names = PDfels %>% html_elements(".head2") %>% html_text()
names


#Question2

nflix = read_html("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now")


rankings = nflix %>% html_elements(".countdown-index") %>% html_text()
ranks = as.numeric(substring(rankings , 2))


names = nflix %>% html_elements(".article_movie_title a ") %>% html_text()


tmeter = nflix %>% html_elements(".tMeterScore") %>% html_text()


year = nflix %>% html_elements(".subtle.start-year") %>% html_text()
years = as.numeric(substr(year , 2,5))
years

directors = nflix %>% html_elements(".info.director a")
listdir = sapply(directors , function(a) a %>% html_elements("a") %>% html_text())
listdir
html