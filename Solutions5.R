attempts<-function(age)
{
  count <- 0
  remain <- age # age no. of candles remain in the beginning
  while(remain>0)
  {
    count<-count+1# randomly choose any number between 1 and remain
    blow_out <- sample(1:remain,size =1)
    remain <- remain- blow_out
  }
  return(count)
}
att_vec <- numeric(length =1e3)
for(i in 1:1e3)
{
  att_vec[i]<-attempts(25)
}
#Question1
attvec2 = replicate(1000 , attempts(25))
attvec2




#Question2

benchmark({
  att_vec <- numeric(length = 1e3)
  for(i in 1:1e3)
  {
    att_vec[i] <- attempts(25)
  }},
  replicate(1e3, attempts(25)), replications = 100)

#Question3 
# repeat 10^4 times for reps = 20
benchmark({
  att_vec <- numeric(length = 1e4)
  for(i in 1:1e4)
  {
    att_vec[i] <- attempts(25)
  }},
  replicate(1e4, attempts(25)), replications = 20)




#Question4

att_vec <- NULL
for(i in 1:1e4)
{
  att_vec <- c(att_vec, attempts(25))
}
benchmark({
  att_vec <- numeric(length = 1e4)
  for(i in 1:1e4)
  {
    att_vec[i] <- attempts(25)
  }},{att_vec <- NULL
  for(i in 1:1e4)
  {
    att_vec <- c(att_vec, attempts(25))
  }},
  replicate(1e4, attempts(25)), replications = 20)


#Question 5 
n=100
m=400
a = matrix(runif(n*m) , nrow = n,ncol = m)
a
benchmark(
    colMeans(a),apply(a,2,mean)
  , replications = 20)


x = runif(n = 1e5)
benchmark(
  norm(x,"2") , sqrt(sum(x^2)) , replications = 20
)



#Question 6 
n <- 10^4
uniform_draws_loop <- numeric(n)

system.time({
  for (i in 1:n) {
    uniform_draws_loop[i] <- runif(1, min = 0, max = 1)
  }
})

system.time({
  uniform_draws_all <- runif(n, min = 0, max = 1)
})





#Question 7




num1 <- numeric(length = 1e3)
num2 <- numeric(length = 1e6)
mat1 <- matrix(runif(100*1000), nrow = 100, ncol = 1000)
mat2 <- matrix(0, nrow = 100, ncol = 1000)
arr <- array(0, dim = c(100,100,100))


object.size(num1)
object.size(num2)
object.size(mat1)
object.size(mat2)
object.size(arr)

