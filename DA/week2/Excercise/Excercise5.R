df = read.csv("D:/DA with R/DA/week2/RawData/Sampledatasafety.csv", header = T)
#loại N/A
df[df == "N/A"] = NA
df = na.omit(df)
#Loại $ và , trong $21,12 và đưa về numeric
df$Incident.Cost = as.numeric(gsub("[\\$,]", "", df$Incident.Cost))
incidentType_Burn = df[df$Incident.Type == "Burn", ]
totalCost = sum(incidentType_Burn$Incident.Cost)
# Trích ra một dữ liệu về số ca tai nạn trong năm 2020, đặt tên là data1, và một
# dữ liệu về số ca tai nạn trong năm 2021, đặt tên là data 2. So sánh tổng số ngày
# công mất đi do tai nạn (Days Lost) trong hai năm đó.
data1 = df[df$Year == 2020, ]
data2 = df[df$Year == 2021, ]
sum(data1$Days.Lost)
sum(data2$Days.Lost)
