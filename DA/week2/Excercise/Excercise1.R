family = c(3, 4, 5, 7, 8, 5, 3)
electric_cost = c(1700, 1800, 1900, 2000, 2100, 2200, 2300)
#tính số tiền điện trung bình của 1 hộ
mean_eCost = 0
for (i in 1:length(family)) {
  mean_eCost = mean_eCost + electric_cost[i] * family[i]
}
mean_eCost = mean_eCost / sum(family)
#tính độ lệch chuẩn
standard = 0
for (i in 1:length(family)) {
  standard = standard + (electric_cost[i] - mean_eCost)**2 * family[i]
}
standard = standard / sum(family)
#C, Có ý kiến cho rằng: “Số điện trung bình của một hộ ở Hà Nội là 0 190số điện”.
# Để kiểm tra ý kiến trên có đúng không, ta đặt T được tính bằng
# công thức dưới đây là Test thống kê.
test = (mean_eCost - 170) * sqrt(sum(family)) / sqrt(standard)
test
if(test > 1.757){
  sprintf("Ý kiến này là sai")
}else{
  sprintf("Ý kiến này đúng")
}
#D, Hãy viết một hàm với biến đầu vào là dữ liệu x và hằng số M để kiểm tra
# tính chính xác của các khẳng định như trên.
check = Function(x, M){
  #tính Số tiền điện trung bình của 1 hộ
  mean = 0
  for (i in 1:length(x$Family)) {
    mean = mean + x$electricCoSt[i] * x$Family[i]
  }
  mean = mean / Sum(x$Family)
  #tính độ lệch chuẩn
  Standard = 0
  for (i in 1:length(x$Family)) {
    Standard = Standard + (x$electric_cost[i] - mean)**2 * x$Family[i]
  }
  Standard = Standard / sum(x$Family)
  #teSt
  Test = (mean - M) * sqrt(sum(x$Family)) / sqrt(x$Standard)
  return(Test)
}
# Hãy sinh ra một véc tơ mới, gồm 150 giá trị, là tiền điện tiêu thụ của 150
# hộ dân. Biết rằng, véc tơ này có phân phối chuẩn với cùng trung bình và
# độ lệch tiêu chuẩn của dữ liệu ban đầu.

DataNew = 

