df <- mtcars
View(df)
is.numeric(df$am)
is.factor(df$am)
#tạo 1 cột 0 -> automatic, 1-> manual (biến dữ liệu rời rạc)
df$am_2 <- c()
for(i in 1 : length(df$am)){
  if(df$am[i] == 0){
    df$am_2[i] = "automatic"
  }else{
    df$am_2[i] = "manual"
  }
}

# Mã hóa biến dữ liệu liên tục
#Nếu hp <= 96.5 -> thấp
#    96.5 < hp <= 180 -> trung bình
#    hp >180 -> cao

df$hp_2 <- c()
for(i in 1 : length(df$hp)){
    if(df$hp[i] <= 96.5){
        df$hp_2[i] = "Thấp"
    }else if(df$hp[i] > 96.5 && df$hp[i] <= 180){
        df$hp_2[i] = "TB"
    }else{
        df$hp_2[i] = "Cao" 
    }
}

View(df[df$hp == 110, ])# lấy những hàng có df$hp == 110
#XỬ LÍ DỮ LIỆU TRỐNG TRONG R
data("airquality")
air <- airquality
is.numeric(air$Ozone)

is.na(air$Ozone)
dataEmpty <- which(is.na(air$Ozone))
meanAir_Ozone <- mean(air$Ozone, na.rm = TRUE)
for(i in dataEmpty){
  air$Ozone[i] <- meanAir_Ozone
}

solarEmpty <- which(is.na(air$Solar.R))
mean_solar <- mean(air$Solar.R, na.rm = TRUE)
for(i in solarEmpty){
  air$Solar.R[i] <- mean_solar
}
#col = columns, truyền vào 1 bảng, còn nếu 1 cột thì dùng sum
# 1 cột là 1 c()
colMeans(air)

View(air)




