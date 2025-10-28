#LẬP TRÌNH CƠ BẢN TRONG R
#Câu lệnh if
#Cấu trúc câu lệnh if: if("Điều kiện"){ Kết quả } else { Kết quả trái lại }
#Ví dụ: So sánh hai giá trị trung bình.
x = c( 1, 2, 3, 5, 6, 3, 2, 1)
y = seq(1, 6, 0.5)
a = mean(x)
b = mean(y)
if(a>=b) {
  print("Giá trị trung bình của x lớn hơn hoặc bằng y") } else {
    print("Giá trị trung bình của x nhỏ hơn y") }
#hoặc
ifelse(a>=b, print("Giá trị trung bình của x lớn hơn hoặc bằng y"),
       print("Giá trị trung bình của x nhỏ hơn y"))

#Câu lệnh for
#Cấu trúc câu lệnh: for(i in "véctơ của chỉ số i") { nội dung của hàm for }
#Ví dụ: Tính tổng S=1+2+...+10
tong = 0
for(i in 1:10){
  tong = tong + i
}
tong
#Ví dụ: Sinh ngẫu nhiên hai vec tơ cùng độ dài 10, 
#tính tổng theo công thức tong = x^2 + y
x = sample(c(2,7,4,6), 10, replace = T)
y = sample(20:50, 10, replace = T)
tong = 0
for(i in 1:length(x)) {
  tong = tong + x[i]^2 + y[i]
}
tong

#Viết hàm trong R
#Cấu trúc: tenham = function("Biến vào") {Nội dung của hàm}
#Ví dụ viết hàm tính tổng của vecto
tinhtong <- function(x){
  tong = 0
  for(i in 1:length(x)){
    tong = tong + x[i]
  }
  return (tong)
}
x <- 1:10
tinhtong(x)
tinhtong(x^2)
tinhtong(x^2-1)
#Ví dụ:Viết hàm truyền vào một véc tơ x và tính tổng theo công thức
#tong = sum (x_i)^i
#(Ví dụ x = (2, 3, 4, 5), tong = 2^1 + 3^2 + 4^3 + 5^4 )
tinhtong2 = function(x){
  tong = 0
  for(i in 1:length(x)){
    tong = tong + (x[i])^i
  }
  return(tong)
} 
x = c(2, 3, 4, 5)
tinhtong2(x)

#XỬ LÍ DỮ LIỆU TRỐNG TRONG R
#Đầu tiên, cần xác định xem là trong bộ dữ liệu có chữa dữ liệu trống ko
data("airquality")
air <- airquality
air
is.na(air) #kiểm tra xem có phải dữ liệu trống hay ko
#Đếm xem từng cột trong bộ dữ liệu có bao nhiêu dữ liệu trống
colSums(is.na(air)) 
#Cách 1: Xóa bỏ dữ liệu thiếu: sử dụng lệnh na.omit()
air1 <- na.omit(air)
colSums(is.na(air1)) 
#Cách 2: Thay thế dữ liệu thiếu
#Các giá trị định lượng có thể thay bằng GTTB hoặc trung vị
#Các giá trị định tính có thể thay bằng "NA"
#Ví dụ: thay giá trị trống trong cột Ozone bằng giá trị trung bình
vitri <- which(is.na(air$Ozone))
for(i in vitri){
  air$Ozone[i] <- mean(air$Ozone, na.rm = TRUE)
}
colSums(is.na(air)) 
#Ví dụ: thay giá trị trống trong cột Solar.R bằng giá trị trung vị
vitri2 <- which(is.na(air$Solar.R))
for(i in vitri2){
  air$Solar.R[i] <- median(air$Solar.R, na.rm = TRUE)
}
colSums(is.na(air)) 





