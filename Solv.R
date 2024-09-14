#ans1


smallWorld <- function()
{
  n.population <- 1e5
  n.friends <- 150
  n.encounters <- 500
  
  days <- ...
  ...
  return(days)
}


#ans2

hsv_convert <- function(img)
{
  col.mat = img[,,1,]
  dims = dim(col.mat)
  h = numeric(dims[1]*dims[2])
  s = numeric(dims[1]*dims[2])
  v = numeric(dims[1]*dims[2])
  rgb = numeric(dims[1]*dims[2])
  c = 1
  for( i in 1:dims[1]){
    for (j in 1:dims[2]){
      rgb[c] = col.mat[i,j,]
      c = c+1
    }
  }
  for( i in 1:(dims[1]*dims[2])){
    
    r = rgb[i]
    #FOR V
    v[i] = max(r)
    
    #FOR S
    if(v[i]==0){
        s[i]=0
    }
    else{
        s[i] = (v[i]-min(r))/(v[i])
    }
    
    
    
    #FOR H
    if(v[i] == r[1] ){
      
      h[i] = 60*(((r[2]-r[3])/(v[i]-min(r)))%%6)
      # stop()
      if(h[i] < 0){
        h[i] = h[i] + 360
      }
      else if(h[i]>360){
        h[i] = h[i] - 360
      }
      else{
        h[i]=h[i]
      }
      
    }
    
    
    if(v[i] == r[2] ){
      h[i] = 60*(((r[3]-r[1])/(v[i]-min(r)))+2)
      
      if(h[i]<0){
        h[i] = h[i] + 360
      }
      else if(h[i]>360){
        h[i] = h[i] - 360
      }
      else{
        h[i]=h[i]
      }
    }
    if(v[i] == r[3] ){
      h[i] = 60*(((r[1]-r[2])/(v[i]-min(r)))+4)

      if(h[i]<0){
        h[i] = h[i] + 360
      }
      else if(h[i]>360){
        h[i] = h[i] - 360
      }
      else{
        h[i]=h[i]
      }
    }
    
  }
  par(mfrow = c(1,3))
  hist(h , main = "Hue of Image" , col = "red")
  hist(s , main="Saturation of Image" , col = "green")
  hist(v , main="VAlue of image" , col="blue")
}
hsv_convert(img)






#ans3
new = list()
for( i in 1:6){
  str1 = "https://www.scimagojr.com/journalrank.php?category=2613&area=2600&page="
  str2 = "&total_size=268"
  link = paste0(str1,i,str2)
  htm = read_html(link)
  
  
  #country = htm %>% html_elements(".table_wrap img") %>% html_attr("title") %>% html_text()
  new[i] = htm %>% html_table()
}
new1 = new[[1]]
new2 = new[[2]]
new3 = new[[3]]
new4 = new[[4]]
new5 = new[[5]]
new6 = new[[6]]
for( i in 1:50){
  new1[50+i,] = new2[i,]
}
for( i in 1:50){
  new1[100+i,] = new3[i,]
}
for( i in 1:50){
  new1[150+i,] = new4[i,]
}
for( i in 1:50){
  new1[200+i,] = new5[i,]
}
for( i in 1:18){
  new1[250+i,] = new6[i,]
}

stat_journals = new1

