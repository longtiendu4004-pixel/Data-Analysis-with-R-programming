#1. Nhập dữ liệu
#a. Nhập dữ liệu trực tiếp bằng lệnh c()
age <- c(50, 62, 60, 40, 48, 47, 57, 70, 48)
insulin <- c(16.5, 10.8, 32.3, 19.3, 14.2, 11.3, 15.5, 15.8, 16.2)
data <- data.frame(age, insulin)
data
#b. Nhập dữ liệu từ tệp
#Nhập dữ liệu từ tệp có đuôi .csv
setwd("D:\\PTDL")
a <- read.csv("COVID19.csv", header=TRUE)
a
#Nhập dữ liệu từ tệp có đuôi .txt
setwd("D:\\PTDL")
file.exists("dulieu2.txt")

b <- read.table("dulieu2.txt",header=TRUE)
b
#c. Nhập dữ liệu có trong R
#Nhập dữ liệu từ cơ sở dữ liệu có sẵn trong R
data("CO2")
CO2
data()
data("ChickWeight")
ChickWeight
chicken <- ChickWeight
#Nhập dữ liệu từ các package trong R
#Cài đặt package
install.packages("MASS")
#Sử dụng package

library("MASS")
data("Animals")
Animals

#2. Xuất dữ liệu
#a. Xuất dữ liệu dưới dạng file có đuôi .csv
setwd("D:\\PTDL")
write.csv(data, file = "insulin.csv")
#b. Xuất dữ liệu dưới dạng file có đuôi .txt
write.table(data, "insulin1.txt")
