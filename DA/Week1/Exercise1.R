setwd("D:/DA with R/DA/week1")
Data <- read.csv("dulieu2.csv", header = TRUE)

#a, Nhập dữ liệu (“dulieu2.csv”) vào R và loại bỏ dữ liệu trống.
colSums(is.na(Data))# các cột hiển thị 0 => no empty

# b. Trích ra một dữ liệu có bộ phận (Segment) là “Government”, đặt nó là data1
#và “Midmarket” đặt tên nó là data2.
data1 <- Data[Data$Segment == "Government", ]
data2 <- Data[Data$Segment == "Midmarket", ]

# c. Hãy sử dụng các câu lệnh if/for để tính tổng doanh thu (Gross.sales) của từng
#loại mặt hàng (Product). Hãy cho biết sản phẩm nào có doanh thu lớn nhất?
is.numeric(Data$Gross.Sales)
Products <- unique(Data$Product)
revenua <- c()
max = 0
name = ""
for(i in Products){
  revenua[i] = sum(Data$Gross.Sales[Data$Product == i])
  if(revenua[i] > max){
    max = revenua[i]
    name = i
  }
}
name
#Nếu chỉ muốn lấy tên names(revenua[revenua == max(revenua)])
#Paseo là sản phẩm có doanh thu lớn nhất

# d. Kiểm tra sản phẩm “VTT” được bán tại “Mexico” vào tháng và năm nào?
is.numeric(Data$Date)
#Cách 1:
min_Date_1 = which(Data$Date == min(Data$Date[Data$Country == "Mexico" & Data$Product == "VTT"]) 
      & Data$Country == "Mexico" 
      & Data$Product == "VTT")
#Cách in 1: Phải nối chuỗi
print(paste0("Sản phẩm VTT được bán tại Mexico vào tháng : ", Data$Month.Number[120], ", năm : ", Data$Year[120]))
#Cách in 2: Linh hoạt như C
sprintf("Sản phẩm VTT được bán tại Mexico vào tháng : %d, năm : %d", Data$Month.Number[120], Data$Year[120])

#Cách 2: Chuyên nghiệp hơn
subset_Date = Data[Data$Country == "Mexico" & Data$Product == "VTT", ]
min_Date_2 = subset_Date[subset_Date$Date == min(subset_Date$Date), ]
View(min_Date_2)



# e. Hãy cho biết sản phẩm nào đã bán được nhiều nhất?
quantity <- numeric(length(Products))
max_quantity = 0
name_maxQuantity = ""
for(i in Products){
  quantity[i] = sum(Data$Units.Sold[Data$Product == i])
  if(max_quantity < quantity[i]){
    max_quantity = quantity[i]
    name_maxQuantity = i
  }
}
sprintf("sản phẩm bán chạy nhất là : %s, %f", name_maxQuantity, max_quantity)
# f. Hãy so sánh tổng doanh thu của hai bộ phận Government và midmarket.
GrossSale_Goverment = sum(Data$Gross.Sales[Data$Segment == "Government"])
GrossSale_Midmarket = sum(Data$Gross.Sales[Data$Segment == "Midmarket"])
if(GrossSale_Goverment > GrossSale_Midmarket){
  sprintf("Doanh thu của Government lớn hơn Midmarket")
}else{
  sprintf("Doanh thu của Government nhỏ hơn Midmarket")
}
