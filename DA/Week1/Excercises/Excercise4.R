# Bài 4: Thực hiện các mô phỏng sinh ngẫu nhiên dưới đây với phần mềm R. Một
# nhà đầu tư muốn mô tả thị trường nhà ở tại Hà nội, ông ta yêu cầu R sinh ra dữ
# liệu với các thông tin sau:
#   + crim - tỷ lệ tội phạm bình quân đầu người theo thị trấn: là một số liên
# tục có phân phối chuẩn với trung bình là 3.613 và độ lệch chuẩn là 8.6
set.seed(100)
n = 100
crim = round(rnorm(n, mean = 3.613, sd = 8.6), 1)
# + indus - tỷ lệ diện tích đất kinh doanh phi bán lẻ trên mỗi thị trấn: là một
# số liên tục có phân phối chuẩn với trung bình là 11.14 và độ lệch chuẩn là 6.86
indus = round(rnorm(n, mean = 11.14, sd = 6.86), 1)
# + rm - số lượng phòng trung bình trên một ngôi nhà: là một số bất kì từ
# 2-6.
rm = sample(2:6, n, replace = TRUE)
# + tax - thuế suất tài sản toàn giá trị trên 10,000$: là một số liên tục có
# phân phối chuẩn với trung bình là 408 và độ lệch chuẩn là 167
tax = rnorm(n, mean = 408, sd = 167)
# + nox - nồng độ nitric oxide (phần trên 10 triệu - ppm): là một số liên tục
# từ 0.38 đến 0.87 và có phân phối chuẩn với trung bình là 0.55 và độ lệch chuẩn
# là 0.116. Hint: Nếu giá trị sinh ra lớn hơn 0.87 hoặc nhỏ hơn 0.38 thì yêu cầu
# máy tính sinh lại những dữ liệu đó.
nox = rnorm(n, mean = 0.55, sd = 0.116)
nox_outofrange = which(nox > 0.87 | nox < 0.38)
for(i in nox_outofrange){
  while(nox[i] > 0.87 | nox[i] < 0.38){
    nox[i] = rnorm(1, mean = 0.55, sd = 0.116)
  }
}
# + chas - biến giần sông Charles: 1 nếu là gần sông với xác suất là 1/5; 0
# nếu ngược lại.
chas = rbinom(n, size = 1, prob = 1/5)
# + age - tỷ lệ các căn hộ có chủ sở hữu được xây dựng trước năm 1940: là
# một số liên tục có phân phối chuẩn với trung bình là 68 và độ lệch chuẩn là 28.
# Lưu ý: tỷ lệ này chỉ nằm trong khoảng 0-100.
# 
age = rnorm(n, mean = 68, sd = 28)
age_outofrange = which(age > 100 | age < 0)
for(i in age_outofrange){
  while(age[i] > 100 | age[i] < 0){
    age[i] = rnorm(1, mean = 68, sd = 28)
  }
}
# + medv - giá trị của những ngôi nhà có chủ sở hữu tính bằng 1,000$: là
# một số liên tục có phân phối chuẩn với trung bình là 22.53 và độ lệch chuẩn là
# 9.2.
medv = rnorm(n, mean = 22.53, sd = 9.2)
# a. Thực hiện sinh ra dữ liệu và đặt tên nó là hanoi.
hanoi = data.frame(crim, indus, rm, tax, nox, chas, age, medv)
View(hanoi)
# b. Một mô hình thống kê cho thấy:
#   medv = - 0.138108*crim - 0.068990*indus - 4.716034*nox + 7.677527*rm -
#   0.007923*tax - 18.599942 .
# Hãy tạo ra biến medv1 bằng công thức trên, sau đó hãy tính độ lệch tiêu chuẩn
medv1 = (- 0.138108 * hanoi$crim
        - 0.068990 * hanoi$indus
        - 4.716034 * hanoi$nox
        + 7.677527 * hanoi$rm 
        - 0.007923 * hanoi$tax 
        - 18.599942)

# cho hiệu số giữa medv1 và medv trong Boston.
MAE = mean(abs(medv1 - medv))#Mean Absolute Error
RMSE = sqrt(sum((medv1 - medv)**2)/n)#Root Mean Square Error
# c. Hãy so sánh giá trị trung bình của những ngôi nhà gần sông và những ngôi
# nhà không gần sông.
mean_near_river = mean(hanoi$chas[hanoi$chas == 1])
mean_farfrom_river = mean(hanoi$chas[hanoi$chas == 0])
if(mean_near_river > mean_farfrom_river){
  sprintf("Có nhiều nhà gần sông hơn")
}else{
  sprintf("Có nhiều nhà ở xa sông hơn")
}