#install.packages('ggmap')
#install.packages('stringr')
library(ggmap)
#library(stringr)

gangbuk <- read.csv('project_gangbuk_data.csv',header=T)

g_m <- get_map('gangbukgu',zoom=13,maptype='roadmap')
gang.map <- ggmap(g_m)+geom_point(data=gangbuk, aes(x = LON, y=LAT), size=0.5, alpha = 0.7, color = '#980000')
gang.map
#kor.map + geom_text(data=loc, aes(x = 寃쎈룄, y = ?쐞?룄 + 0.001, label=NA),size=2)
ggsave('c:/easy_r/gangbukcctv.png',dpi=500)




no_one <- read.csv('서울특별시_노원구_CCTV_20170525.csv',header=T)
n_m <- get_map(c(lon=127.07,lat = 37.65),zoom=13,maptype='roadmap')
noone.map <- ggmap(n_m)+geom_point(data=no_one, aes(x = 경도, y=위도), size=0.25, alpha = 0.7, color = '#980000')
noone.map
#kor.map + geom_text(data=loc, aes(x = 寃쎈룄, y = ?쐞?룄 + 0.001, label=NA),size=2)
ggsave('c:/easy_r/noonecctv.png',dpi=500)



#?깋援щ퀎
loc2 <- str_sub(loc$二쇱감?옣紐?, start=-2, end=-2)
loc2
colors <- c()
for(i in 1:length(loc2)){
  if(loc2[i] == '援?'){
    colors <- c(colors,'red')
  }
  else {
    colors <- c(colors,'blue')
  }
}
kd <- get_map('Amsa-dong',zoom=13, maptype = 'roadmap')
kor.map <- ggmap(kd) + geom_point(data=loc, aes(x=LON,y=LAT), size = 3, alpha= 0.7, color=colors)
kor.map + geom_text(data=loc, aes(x = LON, y = LAT + 0.001, label=二쇱감?옣紐?),size=3)
ggsave('c:/easy_r/kd2.png',dpi=500)



