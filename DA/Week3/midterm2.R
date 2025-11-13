data = c(17, 16, 20, 24, 22, 15, 21, 15, 17, 22)
min(data)
max(data)
mean(data)
data[data == 24] = 18
data
percent = sum(data > 17 & data <= 20) / sum(data > 17)#boolean