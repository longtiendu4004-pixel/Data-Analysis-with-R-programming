setwd("D:/DA with R/DA/week2/RawData")
red = read.csv("winequality.red.5.CSV", header = T)
#A,
dim(red)# (1599, 12) : (nrow, ncol)
#B,
red[red$total.sulfur.dioxide == 102 | red$total.sulfur.dioxide == 29, "total.sulfur.dioxide"] = 92
#C,
citric.acid_updated = function(df){
  df$citric.acid = ifelse(df$citric.acid < 0.02, df$citric.acid + 0.01, df$citric.acid)
  return(df$citric.acid)
}
red$citric.acid = citric.acid_updated(red)
#D,
ancolByVolume = function(df){
  k = sum(df$alcohol) * sum(df$quality) / sum(df$pH)
  return(k)
}
red$results = ifelse(ancolByVolume(red) > 8.3, "Tốt", "Xấu")
red$results[red$results == "Xấu"]
#E,
mean_pH = mean(red$pH)
std_pH = sd(red$pH)
