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

seat <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv")

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

No.of.BS = 0

for(i in 1:dim(seat[1])){
  if(seat$Roll.No[i] < 999999)
  {
    No.of.BS = No.of.BS + 1
  }
}
paste("No of BS students" , No.of.BS)
paste("No.of.MSc students" , (dim(seat[1])-No.of.BS))


