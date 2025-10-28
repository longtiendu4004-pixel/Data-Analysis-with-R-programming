setwd("D:/DA with R/DA/Week1")
df = read.csv("COVID19.csv", header = T)
View(df)
# a) Nhập dữ liệu “COVID19.csv” vào R và viết hàm tính tuổi trung bình của
# bệnh nhân theo giới tính.
averageMale = round(mean(df[df$Sex == "Male", "Age"]), 0)
averageFemale = round(mean(df[df$Sex == "Female", "Age"]), 0)
# b) Viết một hàm để tính tỷ lệ bệnh nhân đã khỏi bệnh trên tổng số bệnh nhân
# mắc bệnh ở các địa điểm. Từ đó, giữa hai thành phố Hà Nội và Hồ Chí Minh thì
# thành phố nào có tỷ lệ bệnh nhân được chữa khỏi bệnh cao hơn.
totalRecovered = length(df$Status[df$Status == "Recovered"])
percentRecovered = totalRecovered * 100 / length(df$ID)
# c) Có bao nhiêu bệnh nhân quốc tịch nước ngoài đã được chữa khỏi bệnh.
foreignRecovered = length(df[df$Location != "Vietnamese" & df$Status == "Recovered", "ID"])
# d) Tính toán tỷ lệ bệnh nhân khỏi bệnh, đang điều trị, và đã tử vong trong từng
# nhóm tuổi khác nhau (ví dụ: dưới 18, 18-40, 41-60, trên 60). Nhóm tuổi nào có
# tỷ lệ hồi phục cao nhất.
#Dưới 18 : nhóm 1
#18-40 : nhóm 2
#41-60 : nhóm 3
#trên 60 : nhóm 4
groupAge = c("nhom1", "nhom2", "nhom3", "nhom4")

percent = function(data, groupAge, min, max){
  caculate = c()
  
  for(i in 1:length(groupAge)){
    # Số ca có trạng thái tương ứng trong nhóm tuổi
    num_status = length(data$ID[data$Age >= min & data$Age <= max & data$Status == status[i]])
    # Tổng số ca trong nhóm tuổi
    total_group = length(data$ID[data$Age >= min & data$Age <= max])
    # Tính phần trăm
    caculate[i] = (num_status / total_group) * 100
  }
  return(caculate)
}

nhom1 = percent(df, status, 0, 17)
nhom2 = percent(df, status, 18, 40)
nhom3 = percent(df, status, 41, 60)
nhom4 = percent(df, status, 61, 100)

results = data.frame(status, nhom1, nhom2, nhom3, nhom4)
results[results$status == "Recovered", "nhom4"]
View(results)
