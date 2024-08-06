#rbinom(1,1,0.5)

#QUestion1

#a
set.seed(123)
prob1= sum(rbinom(1000,1,0.5))
prob/1000


#b
set.seed(100)
prob2=sum(rbinom(1000,1,0.3))
prob2/1000



#Question2

#a

bag = c(rep("red" , 3) , rep("green" , 2) , rep("blue",2))
#bag
sample(bag,1)



#b

A <- matrix(c(3, 1, -2, 4, 5, 3, -1, 2, -2), nrow = 3, ncol = 3)
A

probs = numeric(ncol(A))
for(i in 1:ncol(A)){
  Ai = A[,i]
  probs[i]=sqrt(sum(Ai**2))
}
probs = probs/sum(probs)

choose = sample(x = 1:ncol(A) , size=1 ,replace = FALSE, prob=probs )
A[,choose]



#c

runif(1,0,5)


#Question3


#a

exceed <- function()
{
  checksum = 0
  count <- 0
  while(checksum<=1)
  {
    checksum = checksum + runif(1,0,1)
    count = count + 1
  }
  return(count)
}

exceed()

