# Bài 6: Cho dữ liệu về thông tin bán hàng của một công ty. Dữ liệu gồm 8 biến
# sau: ngày đặt hàng (OrderDate), khu vực (Region), thành phố (City), loại sản
# phẩm (Category), tên sản phẩm (Product), số lượng sản phẩm bán ra (Quantity),
# đơn giá (UnitPrice) và doanh thu (TotalPrice). Dữ liệu được cho trong file Excel
# Product.
# a) Nhập dữ liệu vào R và đặt tên là data. Loại bỏ các bản ghi có giá trị trống.
setwd("D:/DA with R/DA/Week1/RawData")
data = read.csv("product.csv", header = T)
View(data)
# b) Xác định tổng số sản phẩm “Chocolate” được bán ra tại thành phố San
# Diego
SanDiego_chocolate = sum(data[data$City == "San Diego", "Quantity"])
# c) Trích ra một bộ dữ liệu có loại sản phẩm là “Bars”, đặt tên là data1 và một bộ
# dữ liệu có loại sản phẩm là “Crackers”, đặt tên là data2. So sánh doanh thu
# trung bình trong ngày của hai loại sản phẩm trên. Nếu doanh thu trung bình
# trong ngày của “Bars” lớn hơn/ nhỏ hơn/ bằng doanh thu trung bình trong ngày
# của “Crackers” thì in ra “Doanh thu trung bình trong ngày của “Bars” lớn hơn/
#   nhỏ hơn/ bằng doanh thu trung bình trong ngày của “Crackers”.
data1 = data[data$Category == "Bars", ]
data2 = data[data$Category == "Crackers", ]
mean(data1$TotalPrice)
mean(data2$TotalPrice)
if(mean(data1$TotalPrice) > mean(data2$TotalPrice)){
  sprintf("Sản phẩm Bars đạt doanh thu trung bình trong ngày lớn hơn Crackers")
}else{
  sprintf("Sản phẩm Crackers đạt doanh trung bình trong ngày thu lớn hơn Bars")
}
# d) Viết một hàm trong R để kiểm tra tổng số lượng bán ra của một sản phẩm tại
# thành phố New York. Áp dụng hàm để kiểm tra với sản phẩm “Carrot”.
totalProduct = function(nameProduct, nameCity){
  count = 0
  for(i in 1 : nrow(data)){
    if(data$City[i] == nameCity & data$Product[i] == nameProduct){
      count = count + data$Quantity[i]
    }
  }
  return(count)
}
totalProduct("Carrot", "New York")
# e) Viết một hàm để đưa ra tên thành phố có tổng số lượng sản phẩm thuộc một
# loại nhất định bán ra nhiều nhất. Áp dụng hàm với loại sản phẩm “Cookies”.
findNameCity = function(nameCategory){
  city = unique(data$City)
  quantity = c()
  name = " "
  max = 0
  for(i in 1:length(city)){
    quantity[i] = sum(data[data$City == city[i] & data$Category == nameCategory, "Quantity"])
    if(max < quantity[i]){
      max = quantity[i]
      name = city[i]
    }
  }
  return(name)
}
findNameCity("Cookies")
# f) Có một sản phẩm mà nhân viên đã nhập sai giá. Tìm thông tin của sản phẩm
# đó bằng cách so sánh tổng giá được tính theo công thức:
#   TotalPrice=Quantity×UnitPrice
# với tổng giá có trong dữ liệu. Hãy sửa lại giá đúng, biết rằng mỗi sản phẩm có
# đơn giá (UnitPrice) khác nhau.
data$TotalPrice = ifelse(data$TotalPrice != data$Quantity * data$UnitPrice,
                         data$Quantity * data$UnitPrice,
                         data$TotalPrice)
