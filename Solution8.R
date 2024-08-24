library(tidyverse)
library(rvest)
library(dplyr)



#Q1
odi_html = read_html("https://www.relianceiccrankings.com/ranking/womenodi/batting")

table = html_table(odi_html)
batting = table[[1]]
colnames(batting)[1] = "Ranking"
colnames(batting)[5] = "BestRating"
colnames(batting)[4] = "Country"

country = odi_html %>% html_elements("tr img") %>% html_attr("alt")
batting




#Q3

sws = starwars
sws %>% filter(skin_color =="fair", eye_color == "blue")

sws %>% arrange(birth_year)

sws %>% slice(7 : 9)
#use slicehead and slicetail too 
#for random
# slice_sample(n = whatever randm )
#slice_sample(prop = n(proportion of data))



sws %>% select(hair_color, skin_color, eye_color)
# sws %>% select(ends_with("whatever"))

sws %>% mutate(height_mtr = height/100)




a1 = group_by(sws , species , mass)

a2 = select(a1 , birth_year , height)

a3 = summarise(a2 , birth_year = mean(birth_year , rm.na = TRUE) , mass = mean(mass , rm.na=TRUE))





#Q4 & 5

g1 = group_by(mtcars , cyl) %>% select(cyl , hp , disp )

g2 = summarise(g1 , disp = mean(disp) , hp = mean(hp))



#Q6


ind_ranking = batting %>% select(Ranking,Country) %>% filter(Country == "IND") %>% select(Ranking)

no_player = batting %>% group_by(Country) 
