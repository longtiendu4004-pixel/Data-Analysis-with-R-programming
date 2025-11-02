setwd("D:/DA with R/DA/Week1")
who <- read.csv("WHO1.csv", header = T)
#a, Loại bỏ các dữ liệu trống trong và đặt tên nó là who1.
who1 <- na.omit(who)
# #Cách 1:
#   # df_empty là tổng số NA từng cột
# df_empty = colSums(is.na(who))
# df_empty = df_empty[df_empty > 0]
#   # Lấy tên các cột có NA
# df_empty = data.frame(name = names(df_empty), value = as.vector(df_empty))
# for(i in 1 : nrow(df_empty)){ #Duyệt name ở df_empty 
#   name = df_empty$name[i]
#   who[[name]][is.na(who[[name]])] = mean(who[[name]], na.rm = T) #Lấy từng cột name trong Who
# }

#Cách 2:
  #Chuyển hóa các tên cuả những cột có NA => vector
df_empty1 = colSums(is.na(who)) # Kiểm tra NA ở mỗi cột
df_empty1 = df_empty1[df_empty1 > 0] # Chỉ lấy các cột > 0
df_empty1 = names(df_empty1) #Lấy tên các cột

for(name in df_empty1){

  who[[name]][is.na(who[[name]])] = mean(who[[name]], na.rm = T)
}


#d. Hãy tính thu nhập quốc dân trung bình của hai dữ liệu who và who1, và đưa
#ra nhận xét.

GNIWho1_avg = sum(who1$GNI..Thunhapquocdan.) / length(who1$GNI..Thunhapquocdan.)
GNIWho_avg = sum(who$GNI..Thunhapquocdan.) / length(who$GNI..Thunhapquocdan.)
GNIWho_avg
GNIWho1_avg

#e. Từ dữ liệu trích ra dữ liệu của hai nước “Bahrain” và “Mexico” và so sánh
#tuổi thọ của hai nước này.
Country_Bahrain = who[who$Country == "Bahrain", ]
Country_Mexico = who[who$Country == "Mexico", ]
View(Country_Bahrain)
View(Country_Mexico)

#g. Viết thêm cột phân nhóm các quốc gia vào dữ liệu. Hãy cho biết nước
#“China” thuộc nhóm nào?
who$phannhom = character(length(who$GNI..Thunhapquocdan.))
for(i in 1 : length(who$GNI..Thunhapquocdan.)){
  if(who$GNI..Thunhapquocdan.[i] < 10000){
    who$phannhom[i] = "Thấp" 
  }else if(who$GNI..Thunhapquocdan.[i] >= 10000 & who$GNI..Thunhapquocdan.[i] <= 20000){
    who$phannhom[i] = "TB" 
  }else{
    who$phannhom[i] = "Cao" 
  }
}
View(who[who$Country == "China", ])
table(who$phannhom)

  



