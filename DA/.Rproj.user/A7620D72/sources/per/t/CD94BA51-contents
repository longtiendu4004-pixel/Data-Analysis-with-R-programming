#2. Xử lí dữ liệu
#Xét bộ dữ liệu "mtcars" có sẵn trong R
df <- data("mtcars")
df
#2.1. Mã hóa dữ liệu
#a. Mã hóa dữ liệu rời rạc
#Trong data set này, biến “am” là kiểu hộp số được mã hóa với 2 giá trị
#0 (số tự động), 1(số điều khiển bằng tay).
df$am
is.numeric(df$am) #Kiểm tra xem cột am có kiểu dữ liệu numeric hay ko
is.factor(df$am) #Kiểm tra xem cột am có kiểu factor hay ko
#Giả sử chúng ta muốn mã hóa biến am từ dạng numeric thành dạng factor

#cụ thể 0 -> automatic và 1 -> manual
#Cách 1: Sử dụng lệnh factor()
df$am_2 <- factor(df$am, levels=c(0, 1), labels=c("Automatic", "Manual"))
print(df$am_2, max = 20)
#Cách 2: Sử dụng lệnh match()
oldvalues <- c("0", "1")
newvalues <- factor(c("Automatic", "Manual"))
df$am_3 <- newvalues[match(df$am, oldvalues)]
df$am
df$am_3
#Cách 3: sử dụng lệnh replace()
df$am_4 <- df$am
df$am_4 <- replace(df$am_4, df$am == 1, "Manual")
df$am_4 <- replace(df$am_4, df$am == 0, "Automatic")
df$am_4
is.factor(df$am_4)
is.character(df$am_4) #=> cần chuyển từ dạng character thành factor
df$am_4 <- as.factor(df$am_4) 
df$am_4
#b. Mã hóa dữ liệu liên tục
#Xét biến công suất hp trong bộ dữ liệu
df$hp
is.numeric(df$hp)
#Giả sử ta muốn mã hóa dữ liệu này thành 3 nhóm: cao, trung bình, thấp
#Nếu hp <= 96.5 -> thấp
#    96.5 < hp <= 180 -> trung bình
#    hp >180 -> cao
#Cách 1: Sử dụng các thao tác cơ bản trong R
df$hp_2 <- df$hp
df$hp_2
df$hp_2[df$hp<=96.5] <- "thấp"
df$hp_2[96.5<df$hp & df$hp<=180] <- "trung bình"
df$hp_2[df$hp>180] <- "cao"
df$hp_2
df$hp_2 <- as.factor(df$hp_2) #Chuyển từ dạng character thành dạng factor
df$hp_2
#Cách 2: Sử dụng hàm cut()
df$hp_3 <- cut(df$hp, 
               breaks = c(-Inf,96.5,180,Inf),
               labels = c("thấp","trung bình","cao"))
df$hp_3

#2.2. Chuyển đổi giữa các loại vecto
#Chuyển từ dạng character sang factor
diem <- c("cao", "thap", "thap", "cao")
as.factor(diem)
#chuyển từ factor sang charactor
as.character(diem)
#chuyển sang dạng numeric
as.numeric(df$am_2)

#2.3 Sắp xếp dữ liệu
#sử dụng hàm sort()
df$hp
sort(df$hp, decreasing = TRUE) #sắp xếp từ lớn đến bé
sort(df$hp, decreasing = FALSE) #sắp xếp từ bé đến lớn

#3. Các thao tác với dữ liệu
#3.1 Trích dữ liệu con
#Cách 1: Sử dụng các thao tác cơ bản trong R
df[1,] #trích xuất hàng đầu tiên của dữ liệu
df[c(3,5,7), ] #trích xuất hàng 3,5,7 của ma trận
df[,1] #trích xuất cột đầu tiên của dữ liệu
#Trích xuất bộ dữ liệu các ô tô có am=1
df[df$am == 1,]
#Trích xuất dữ liệu các ô tô có hp>96.5
df[df$hp>96.5, ]
#Trích xuất dữ liệu các ô tô vừa có am=1 lẫn hp>96.5
df[df$am==1 & df$hp>96.5, ]
#Cách 2: sử dụng lệnh subset()
#Trích xuất bộ dữ liệu các ô tô có am=1
subset(df, df$am==1)
#Trích xuất dữ liệu các ô tô có hp>96.5
subset(df, df$hp>96.5)
#Trích xuất dữ liệu các ô tô vừa có am=1 lẫn hp>96.5
subset(df, df$am==1 & df$hp>96.5)
#3.2 Ghép dữ liệu: 
#Ghép dữ liệu dựa theo cùng một tính chất nào đó: sử dụng lệnh merge()
id <- 1:3
title <- c("lion", "tiger", "bear")
data1 <- data.frame(id, title)

subject <- c(1,1,1,2,2,2)
storyid <- c(1,2,3,2,3,1)
rating <- c(6,4,3,3,4,5)
data2 <- data.frame(subject, storyid, rating)

data1
data2
merge(x=data1, y=data2, by.x="id", by.y ="storyid")
#Ghép dữ liệu theo hàng: sử dụng lệnh rbind()
id <- 1:3
title <- c("lion", "tiger", "bear")
data1 <- data.frame(id, title)
data1

id <- 4:6
title <- c("chicken","duck","bird")
data3 <- data.frame(id, title)

rbind(data1, data3)
#Ghép dữ liệu theo cột: sử dụng lệnh cbind()
data1

subject <- c(1,2,1)
rating <- c(6,4,3)
data4 <- data.frame(subject, rating)
data4

cbind(data1, data4)
#3.3 Sinh ngẫu nhiên dữ liệu
#a. Sinh ngẫu nhiên dữ liệu bất kì (không tuân theo phân phối): sử dụng lệnh sample()
#Sinh ngẫu nhiên 50 giá trị trong khoảng từ 1:100
set.seed(12) #Dùng để cố định kết quả
sample(1:100, 50, replace = TRUE) #Có lặp lại giá trị
sample(1:100, 50, replace = FALSE) #không lặp lại giá trị
#Sinh ngẫu nhiên 200 giá trị 2,3,4
sample(c(2,3,4), 200, replace = TRUE) 
#Sinh ngẫu nhiên 200 giá trị trong seq(1,10, 0.5)
sample(seq(1,10, 0.5), 200, replace = T)
#Sinh ngẫu nhiên 200  từ Nam và Nữ
sample(c("Nam", "Nu"), 200, replace = T)

#b. Sinh ngẫu nhiên các giá trị tuân theo phân phối nào đó
#Sinh ngẫu nhiên 100 giá trị tuân theo phân phối Poisson với lambda = 0.5
rpois(200, lambda = 0.5)
#Sinh ngẫu nhiên 200 giá trị tuân theo phân phối nhị thức B(n,p) với n=5, p=0.3
rbinom(n = 200, size = 5, prob = 0.3)
#Sinh ngẫu nhiên 200 giá trị tuân theo phân phối chuẩn tắc N(0,1)
rnorm(200, mean = 0, sd = 1)
#Sinh ngẫu nhiên 200 giá trị tuân theo phân phối đều U(1,10)
runif(200, min = 1, max = 10)
#Sinh ngẫu nhiên 200 giá trị tuân theo phân phối mũ với lambda = 3
rexp(200, rate = 3)


