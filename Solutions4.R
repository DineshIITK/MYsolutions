
library(imager)
dog <- load.image("dog.jpeg")
dim(dog)
plot(dog)

#grayscale
graydog <- grayscale(dog)
plot(graydog)
dim(graydog)

# 
# # Extract the black and white image as matrix
# gray.mat <- as.matrix(graydog[,,1,1])
# dim(gray.mat)
# # Extracts the array will all three rgb channels
# col.mat <- as.array(dog[, ,1, ])
# dim(col.mat)
# 
# cropped.mat <- col.mat[1:300, , ]
# crop.dog <- as.cimg(cropped.mat)
# plot(crop.dog)

#Question 1 

mat.dog = dog[,,1,]
dist = matrix(0,nrow=dim(mat.dog)[1] , ncol = dim(mat.dog)[2])
for( i in 1:dim(dist)[1]){
  for(j in 1:dim(dist)[2]){
      dist[i,j] = norm(mat.dog[i,j,] - c(0,1,0),"2")
  }
}
min(dist)
loc = which(dist == min(dist), arr.ind = TRUE)
points(x = loc[1] , y = loc[2] , col = "red" , pch = 16)



#Question4

img1 = load.image("land1.jpeg")
img2 = load.image("land2.jpeg")

mat.l1 = img1[,,1,]
mat.l2 = img2[,,1,]
m1 = matrix(0,nrow=dim(mat.l1)[1],ncol = dim(mat.l1)[2])
m2 = matrix(0,nrow=dim(mat.l2)[1],ncol = dim(mat.l2)[2])
for( i in 1:dim(m1)[1]){
  for(j in 1:dim(m1)[2]){
    m1[i,j] = norm(mat.l1[i,j,] - c(1,1,1),"2")
  }
}
for( i in 1:dim(m2)[1]){
  for(j in 1:dim(m2)[2]){
    m2[i,j] = norm(mat.l2[i,j,] - c(1,1,1),"2")
  }
}
w1 = which(m1 <= 0.2 ,arr.ind = TRUE )
w2 = which(m2 <= 0.2 ,arr.ind = TRUE )
