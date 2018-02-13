#지도 점찍기
#install.packages('ggmap')
#install.packages('stringr')
#library(ggmap)
#library(stringr)

loc <- read.csv('EDGE.csv',header=T)
#loc
kd <- get_map(c(lon=127.0,lat=37.52),zoom=11,maptype='roadmap')
kor.map <- ggmap(kd)+geom_point(data=loc, aes(x = 경도, y=위도), size=1, alpha = 0.7, color = 'red')
kor.map + geom_text(data=loc, aes(x = 경도, y = 위도 + 0.001, label=NA),size=2)
ggsave('c:/easy_r/edge.png',dpi=500)




#색구별
loc2 <- str_sub(loc$주차장명, start=-2, end=-2)
loc2
colors <- c()
for(i in 1:length(loc2)){
  if(loc2[i] == '구'){
    colors <- c(colors,'red')
  }
  else {
    colors <- c(colors,'blue')
  }
}
kd <- get_map('Amsa-dong',zoom=13, maptype = 'roadmap')
kor.map <- ggmap(kd) + geom_point(data=loc, aes(x=LON,y=LAT), size = 3, alpha= 0.7, color=colors)
kor.map + geom_text(data=loc, aes(x = LON, y = LAT + 0.001, label=주차장명),size=3)
ggsave('c:/easy_r/kd2.png',dpi=500)



