#Worksheet 2 
#Question1

factl  <- function(n)
{
  if(n==0)
  {
    return(1)
  }
  if(n==1)
  {
    return(1)
  }
  return(n*factl(n-1))
}
factl(5)



#Question2

EulerNo <- function(n)
{
  if(n<=0){
    return("Not Valid")
  }
  return((1 + 1/n)**n)
}

#Question3

seat <- read.csv("seating.csv")

SeatNo = function(roll)
{
  row_no = seat[seat$Roll.No == roll , ]
  if(roll<seat[1,1]){
    return("Invalid")
  }
  
  return(row_no$Seat.Number)
}
SeatNo(230374)

#Question5

#No.of.BS = 0

#for(i in 1:dim(seat[1])){
 # if(seat$Roll.No[i] < 999999)
  #{
   # No.of.BS = No.of.BS + 1
  #}
#}

# a better approach
No.of.BS = sum(seat$Roll.No < 999999)
paste("No of BS students" , No.of.BS)
paste("No.of.MSc students" , (dim(seat)[1]-No.of.BS))



# Question6

all_cricketer <- read.csv("battingbowling.csv")

all_rounders = all_cricketer[all_cricketer$Bowling <= 40 & all_cricketer$Batting >= 25 ,]
all_rounders

write.csv(all_rounders , "Allrounders.csv" , row.names = FALSE)
tally = c(all_rounders$Team)

maxteam=0
minteam=0
max = 0
min = 1000000

count=1
for ( i in 1:length(tally))
{
  if(i< length(tally) & tally[i] == tally[i+1])
  {
    count = count + 1
  }
  else
  {
    if(count>max){
      max = count
      maxteam=tally[i]
    }
    if(count<min){
      min = count
      minteam=tally[i]
    }
    count = 1
  }
  
}
maxteam
minteam

# Q7 and Question 8

y = 1:100
x = y
plot(x , y , type="l" , xlab = "X-axis",ylab = "Y-axis",col="blue")

n = 1:200
y = (1 + 1/n)**n
plot(n , y , type="l" , xlab = "n",ylab = "f(n)",col="black")
abline(h = 2.718281828459045, col = "red" , lty = 2 , lwd = 1)
