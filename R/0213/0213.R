no <- c(1,2,3,4)
name <- c('Apple','Peach','Banana','Grape')
price <- c(500,200,100,50)
qty <- c(5,2,4,7)
sales <- data.frame(No = no, Name = name, PRICE = price, QTY = qty)
sales

sales2 <- matrix(c(1,'Apple',500,5,
                   2,'Peach',200,2,
                   3,'Banana',100,4,
                   4,'Grape',50,7),nrow=4,byrow=T)
sales2
df1 <- data.frame(sales2)
df1
names(df1) <- c('NO','NAME','PRICE','QTY')
df1

sales
sales$Name
sales[1,3]
sales[1,]
sales[,3]
sales[c(1,2),]
sales[,c(1,2)]
sales[,c(1:3)]

subset(sales,qty<5)
subset(sales,price==200)
subset(sales,name=='Apple')

no <- c(1,2,3)
name <- c('apple','banana','peach')
price <- c(100,200,300)
df1 <- data.frame(NO = no, NAME = name, PRICE = price)
df1

no <- c(10,20,30)
name <- c('train','car','airplane')
price <- c(1000,2000,3000)
df2 <- data.frame(NO=no, NAME=name, PRICE=price)
df2

df3 <- cbind(df1, df2)
df3

df4 <- rbind(df1,df2)
df4

df1 <- data.frame(name=c('apple','banana','cherry'), price = c(300,200,100))

df2 <- data.frame(name=c('apple','cherry','berry'), qty = c(10,20,30))

df1
df2

merge(df1,df2)
merge(df1,df2,all=T)

new <- data.frame(name = 'mango',price=400)
new
df1 <- rbind(df1,new)
df1
#또는
df1 <- rbind(df1,data.frame(name='berry',price=500))
df1

df1 <- cbind(df1,data.frame(qty=c(10,20,30,40,50)))
df1

no <- c(1,2,3,4,5)
name <- c('서진수','주시현','최경우','이동근','윤정웅')
address <- c('서울','대전','포항','경주','경기')
tel <- c(1111,2222,3333,4444,5555)
hobby <- c('독서','미술','놀고먹기','먹고놀기','노는애감시하기')
member <- data.frame(NO = no, NAME = name, ADDRESS = address, TEL=tel, HOBBY = hobby)
member

member2 <- subset(member,select = c(NO,NAME,TEL))
member2

member3 <- subset(member,select = -TEL)
member3

colnames(member3) <- c('번호','이름','주소','취미')
member3

sales
ncol(sales)
nrow(sales)
names(sales)
rownames(sales)
sales[c(2,3,1),]

#혼자서 해보기
name <- c('사과','딸기','수박')
price <- c(1800,1500,3000)
qty <- c(24,38,13)
saless <- data.frame(Name = name, PRICE = price, QTY = qty)
names(saless) <- c('제품','가격','판매량')
saless

meanprice <- mean(saless[,2])
meanprice
meanqty <- mean(saless[,3])
meanqty

#실습문제
no <- c(1,2,3)
name <- c('apple','banana','peach')
price <- c(100,200,300)
sales3 <- data.frame(NO = no, NAME = name, PRICE = price)
sales3

no <- c(10,20,30)
name <- c('train','car','airplane')
price <- c(1000,2000,3000)
sales4 <- data.frame(NO = no, NAME = name, PRICE = price)
sales4

name <- c('김길동','강길동','박길동')
kor <- c(100,90,85)
mat <- c(90,95,98)
eng <- c(80,98,100)
s <- data.frame(name, kor,mat,eng)
s
names(s)
nrow(s)
s[,c(1,2)]
s[,c(1,3)]
s$name
subset(s,kor>=90)
subset(s,name=='박길동')
rbind(s,data.frame(name = '최길동',kor = 80, mat = 90, eng = 93))

#실습문제 2

name <- c('강길동','박길동','최길동')
kor <- c(100,90,92)
mat <- c(90,95,100)
t <- data.frame(name,kor,mat)
t
sci <- c(88,80,94)
t <- cbind(t,sci)
t
ncol(t)
t[-2,]
t[,-1]
t[,c(1,4,2,3)]

#실습문제 3

merge(s,t)
merge(s,t,all = T)
cbind(s,t)
cbind(t,s)
tt<- t[,c(1,2,3)]
tt
ss <- s[,c(1,2,3)]
ss
rbind(tt,ss)
rbind(ss,tt)

#외부 data

list.files()
list.files(recursive = T)
list.files(all.files=T)

#scan 함수로 텍스트 파일 읽어서 배열에 저장
setwd()
scan1 <- scan('scan_1.txt')
scan1
scan2 <- scan('scan_2.txt')
scan2

scan2 <- scan('scan_2.txt',what='')
scan2
scan3 <- scan('scan_3.txt',what='')
scan3
scan4 <- scan('scan_4.txt',what='')
scan4

input <- scan()
input
input2 <- scan(what='')
input2
input3 <- readline()
input3
input4 <- readline('Are you OK? :')
input4
input5 <- readLines('scan_4.txt')
input5

fruits <- read.table('fruits.txt')
fruits
fruits <- read.table('fruits.txt',header=T)
fruits
fruit2 <- read.table('fruits_2.txt')
fruit2
fruit2 <- read.table('fruits_2.txt',skip=2)
fruit2
fruit2 <- read.table('fruits_2.txt',nrows=2)
fruit2
fruits3 <- read.table('fruits.txt',header=T,nrows=2)
fruits3
fruits3 <- read.table('fruits.txt',header=F,skip = 2, nrows=2)
fruits3

# csv 파일 install.packages('readxl')

fruit3 <- read.csv('fruits_3.csv')
fruit3
fruit4 <- read.csv('fruits_4.csv')
fruit4
fruit4 <- read.csv('fruits_4.csv',header=F)
fruit4

label <- c('NO','NAME','PRICE','QTY')
fruit4 <- read.csv('fruits_4.csv',header=F,col.names=label)
fruit4

df_csv_exam <- read.csv('csv_exam.csv',stringsAsFactors = F)
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm
write.csv(df_midterm, file = 'df_midterm.csv')

#install.packages('googleVis'), install.packages('sqldf')
library(googleVis)
library(sqldf)
Fruits

df_exam <- read_excel('excel_exam.xlsx')
df_exam
mean(df_exam$english)
mean(df_exam$science)


df_exam <- read_excel('C:/easy_r/excel_exam.xlsx')
df_exam_novar <- read_excel('excel_exam_novar.xlsx',col_names = F)
df_exam_novar

df_exam_sheet <- read_excel('excel_exam_sheet.xlsx', sheet = 3)
df_exam_sheet

#sql 생략

txt1 <- read.csv('csv_test.txt')
txt1

txt2 <- readLines('csv_test.txt')
txt2

txt3 <- read.table('csv_test.txt')
txt3

txt3 <- read.table('csv_test.txt',sep=',')
txt3
txt3 <- read.table('csv_test.txt',sep=',',header=T)
txt3

txt1 <- readLines('write_test.txt')
txt1
write(txt1,'write_test2.txt')
txt2 <- readLines('write_test2.txt')
txt2

txt1 <- read.table('write_test.txt')
txt1
write(txt1, 'write_test3.txt')
txt2 <- read.table('write_test3.txt')
txt2
# 에러
txt1 <- read.table('table_test.txt',head = T)
txt1
write.table(txt1,'table_test2.txt')
txt2 <- read.table('table_test2.txt',head=T)
txt2
# 에러
txt4 <- read.csv('csv_test.csv')
txt4
write(txt4,'csv_test2.csv') # 에러
write.table(txt4,'csv_test2.csv')
txt2 <- read.csv('csv_test2.csv')
txt2
write.csv(txt4, 'csv_test3.csv')
txt3 <- read.csv('csv_test3.csv')
txt3
#install.packages('xlsx')
library(xlsx)
write.xlsx(item, 'item.xlsx')
#에러 item ㅇㄷ?

save(df_midterm, file = 'df_midterm.rda')
rm(df_midterm)
df_midterm
load('df_midterm.rda')
df_midterm

#지도 점찍기
#install.packages('ggmap')
#install.packages('stringr')
#library(ggmap)
#library(stringr)
loc <- read.csv('서울특별시_영등포구_육교정보_20171115.csv',header=T)
loc
kd <- get_map(c(lon=126.9,lat=37.52),zoom=13,maptype='roadmap')
kor.map <- ggmap(kd)+geom_point(data=loc, aes(x = 경도, y=위도), size=3, alpha = 0.7, color = 'red')
kor.map + geom_text(data=loc, aes(x = 경도, y = 위도 + 0.001, label=육교명),size=2)
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



#프로젝트 데이터만들기
getwd()
setwd('c:/easy_r/육교')
a <- read.csv('서울특별시_강남구_육교정보_20171116.csv')
b <- read.csv('서울특별시_강서구_육교정보_20171122.csv')
c <- read.csv('서울특별시_관악구_육교정보_20171124.csv')
d <- read.csv('서울특별시_구로구_육교정보_20171124.csv')
e <- read.csv('서울특별시_송파구_육교정보_20171121.csv')
f <- read.csv('서울특별시_양천구_육교정보_20171101.csv')
g <- read.csv('서울특별시_종로구_육교정보_20171108.csv')
h <- read.csv('서울특별시_중구_육교정보_20171123.csv')
i <- read.csv('서울특별시_영등포구_육교정보_20171115.csv')

df1 <- rbind(a,b)
df2 <- rbind(df1,c)
df3 <- rbind(df2,d)
df4 <- rbind(df3,e)
df5 <- rbind(df4,f)
df6 <- rbind(df5,g)
df7 <- rbind(df6,h)
df8 <- rbind(df7,i)

nrow(a)
nrow(b)
nrow(c)
nrow(d)
nrow(e)
nrow(f)
nrow(g)
nrow(h)
nrow(i)

write.csv(df8, file = 'EDGE.csv')




