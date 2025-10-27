# # Đặt seed để kết quả tái lập được
# set.seed(123)
# 
# # Số lượng sinh viên
# n <- 300
# 
# # Sinh dữ liệu
# ID <- 1 : n
# 
# GioiTinh <- sample(c("Nam", "Nữ"), n, replace = TRUE, prob = c(0.45, 0.55))
# Tuoi <- sample(18:24, n, replace = TRUE)
# ChieuCao <- ifelse(GioiTinh == "Nam",#điều kiện true/false
#                    rnorm(n, mean = 170, sd = 6),#nếu đúng
#                    rnorm(n, mean = 160, sd = 5))#nếu sai
# CanNang <- ifelse(GioiTinh == "Nam",
#                   rnorm(n, mean = 65, sd = 8),
#                   rnorm(n, mean = 55, sd = 6))
# DiemThuongXuyen <- round(runif(n, 5, 10), 1)
# DiemGiuaKy <- round(runif(n, 4, 10), 1)
# DiemCuoiKy <- round(runif(n, 3, 10), 1)
# 
# # Tạo data frame
# sinhvien <- data.frame(
#   ID,
#   GioiTinh,
#   Tuoi,
#   ChieuCao = round(ChieuCao, 1),
#   CanNang = round(CanNang, 1),
#   DiemThuongXuyen,
#   DiemGiuaKy,
#   DiemCuoiKy
# )
# 
# # Xem vài dòng đầu
# head(sinhvien)
# 
# # Lưu ra file CSV nếu muốn
# write.csv(sinhvien, "sinhvien.csv", row.names = FALSE)


# a) Sinh ra một bộ dữ liệu về thông tin của 300 sinh viên: bao gồm ID, giới
# tính, tuổi (từ 18-24), chiều cao, cân nặng, điểm thường xuyên, điểm giữa
# kỳ, điểm cuối kỳ.
set.seed(1)# chỉ nhận integer
n = 300
ID = seq(1, 300)
gender <- sample(c("Nam", "Nữ"), n, replace = T, prob = c(0.45, 0.55))
age = sample(seq(18, 24), n, replace = T)
height = ifelse(gender == "Nam", rnorm(n, mean = 170, sd = 6), rnorm(n, mean = 160, sd = 8))
height = round(height, 1)
weight = ifelse(gender == "Nam", rnorm(n, mean = 70, sd = 6), rnorm(n, mean = 48, sd = 5))
weight = round(weight, 1)
regularScore = round(runif(n, min = 4, max = 10), 1)
midtermScore = round(runif(n, min = 2, max = 7), 1)
finalScore = round(runif(n, min = 3, max = 9.5), 1)
overallScore = round(regularScore * 0.1 + midtermScore * 0.3 + finalScore * 0.6, 1)
results = ifelse(overallScore >= 4, "Pass", "Fail")
detailStudent = data.frame(ID, gender, age, height, weight, regularScore,midtermScore, finalScore, overallScore, results)

table(results)
# runif(n, min, max) : sinh n dữ liệu từ min - max là số thực
# b) Lấy từ dữ liệu trên danh sách sinh viên của điểm thi cuối kỳ lớn hơn hoặc
# bằng 9.
finalScoreHigherNine = detailStudent[detailStudent$finalScore >= 9,]
View(finalScoreHigherNine)

# c) Bạn sinh viên có ID=5 có điểm chuyên cần bị sai, phải sửa lại là 10. Thực
# hiện thao tác đó với R
detailStudent[detailStudent$ID == 5, "regularScore"] = 10


# e) Nếu tổng điểm lớn hơn hoặc bằng 9.0 được xếp điểm A+, 8.5&lt;= điểm
# tổng &lt; 9 được xếp điểm A, 8.0&lt;= điểm tổng &lt; 8.5 được xếp điểm B+,
# 7.0&lt;= điểm tổng &lt;8.0 được xếp điểm B, điểm tổng &lt; 7.0 được xếp điểm
updateScores = function(df){
  df$overallScore = round(df$regularScore * 0.1 + df$midtermScore * 0.3 + df$finalScore * 0.6, 1)
  df$GPA = character(length(df$overallScore))
  for (i in 1:length(df$overallScore)) {
    point <- df$overallScore[i]
    
    if (point >= 9) df$GPA[i] <- "A+"
    else if (point >= 8.5) df$GPA[i] <- "A"
    else if (point >= 8) df$GPA[i] <- "B+"
    else if (point >= 7) df$GPA[i] <- "B"
    else if (point >= 6) df$GPA[i] <- "C+"
    else if (point >= 5) df$GPA[i] <- "C"
    else if (point >= 4) df$GPA[i] <- "D"
    else df$GPA[i] <- "F"
  }
  return(df)
}
detailStudent = updateScores(detailStudent)
View(detailStudent)
# g) Có bao nhiêu bạn sinh viên có điểm giữa kì là 0 nhưng lại qua môn?
detailStudent[detailStudent$ID == 200, "midtermScore"] = 0 
View(detailStudent)
detailStudent[detailStudent$midtermScore == 0 & detailStudent$overallScore >= 4, "ID"]
#   h) Hãy tính tỉ lệ phần trăm của các bạn được điểm “B”
percentage_B = length(detailStudent$GPA[detailStudent$GPA == "B"]) * 100 / n
percentage_B
# i) Tỉ lệ này sẽ thay đổi như nào nếu ta cộng thêm mỗi sinh viên 2đ giữa kỳ.
# (Bạn nào quá 10 điểm thì chỉ đạt 10đ). Câu hỏi này tương tự với ý g)
detailStudent$midtermScore = ifelse(detailStudent$midtermScore < 8, detailStudent$midtermScore + 2, 10)
detailStudent = updateScores(detailStudent)
percentage_B_updated = length(detailStudent$GPA[detailStudent$GPA == "B"]) * 100 / n
percentage_B_updated



