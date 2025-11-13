minutes = c(40, 42, 44, 46, 48, 50)
employee = c(25, 50, 60, 110, 90, 15)
data = rep(minutes, employee)
#a,
check_percent_employee = function(data, p){
  f = sum(data[data > 46]) / sum(data)
  min_percent = f - 1.96 * sqrt(f * ( 1- f) /  sum(data))
  max_percent = f + 1.96 * sqrt(f * ( 1- f) /  sum(data))
  if(p >= min_percent & p <= max_percent){
    sprintf("P_0 vừa nhập là đại diện cho tỉ lệ nhân viên đi làm hết nhiều hơn 46 phút")
  }else{
    sprintf("P_0 vừa nhập không phải là đại diện cho tỉ lệ nhân viên đi làm hết nhiều hơn 46 phút")
  }
}
check_percent_employee(data, 0.28)