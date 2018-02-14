getwd()
setwd('c:/easy_r')
#install.packages('ggmap')
#install.packages('stringr')
library(ggmap)
library(stringr)

#gu <- read.csv('서울시구청위치정보_new.csv',header=T)
#gu2 <- get_map('seoul',zoom=11,maptype = 'hybrid')
#gu.map <- ggmap(gu2) + geom_point(data=gu,aes(x=LON,y=LAT),size = 5,alpha = 1, color='green')
#gu.map + geom_text(data=gu, aes(x = LON, y = LAT + 0.01, label=name),size = 3)
#ggsave('goffice.png',dpi=500)


#loc <- read.csv('서울지하철2호선위경도정보.csv',header=T)
#center <- c(mean(loc$LON), mean(loc$LAT))
#kor <- get_map(center, zoom=11, maptype='roadmap')
#kor.map <- ggmap(kor)+geom_point(data=loc, aes(x = LON, y=LAT), size=3, alpha = 0.7)
#kor.map + geom_text(data=loc, aes(x = LON, y = LAT, label = 역명),size=3)
#ggsave('line2.png',dpi=500)




loc <- read.csv('강북구주차장.csv',header=T)
#loc
center <- c(mean(loc$LON), mean(loc$LAT))
kor <- get_map(center, zoom=13, maptype='roadmap')
kor.map <- ggmap(kor)+geom_point(data=loc, aes(x = LON, y=LAT), size=3, alpha = 0.7)
kor.map + geom_text(data=loc, aes(x = LON, y = LAT, label = 이름),size=3)
ggsave('강북구주차장.png',dpi=500)

