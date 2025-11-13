data = read.csv("D:/DA with R/DA/week2/RawData/winequality.red.5.csv")
#c
alcol5_avg = mean(data$pH[data$quality == 5])
alcol6_avg = mean(data$pH[data$quality == 6])
#d
set.seed(10)
n = nrow(data)
percent = sample(1:n, size = n * 0.7)
data70 = data[percent, ]
data30 = data[-percent, ]
#e

evaluation_alcohol = function(data){
  k = data$alcohol * data$quality / data$pH
  result = ifelse(k > 7.5, "Tốt", "Xấu")
  return(result)
}
data$eval = evaluation_alcohol(data)
result = data[data$citric.acid == 0.08 & data$chlorides == 0.086 & data$fixed.acidity == 7.4, "eval"]
View(data)
