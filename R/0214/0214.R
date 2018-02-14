vec1 <- c(1,2,3,4,5)
vec2 <- c('a','b','c','d','e')
max(vec1)
max(vec2)
mean(vec1)
mean(vec2)
min(vec1)
sd(vec1)
sum(vec1)
var(vec1)

#aggregate
#install.packages('googleVis')
library(googleVis)
Fruits
aggregate(Sales~Year,Fruits,sum)
aggregate(Sales~Fruit,Fruits,sum)
aggregate(Sales~Fruit,Fruits,max)
aggregate(Sales~Fruit+Year,Fruits,max)

#apply()함수
mat1 <- matrix(c(1,2,3,4,5,6),nrow=2,byrow=T)
mat1
apply(mat1,1,sum)
apply(mat1,2,sum)
apply(mat1[,c(2,3)],2,max)

#lapply()함수와 sapply()함수
list1 <- list(Fruits$Sales)
list1
list2 <- list(Fruits$Profit)
list2
lapply(c(list1,list2),max)
sapply(c(list1,list2),max)
Fruits
lapply(Fruits[,c(4,5)],max)
sapply(Fruits[,c(4,5)],max)

#tapply() / mapply() 함수
Fruits
tapply(Sales,Fruits,sum)
attach(Fruits)
tapply(Sales,Fruits,sum)
tapply(Sales,Year,sum)

vec1 <- c(1,2,3,4,5)
vec2 <- c(10,20,30,40,50)
vec3 <- c(100,200,300,400,500)
vec4 <- mapply(sum,vec1,vec2,vec3)
vec4
#class(vec4)

#기초문법-데이터변형 실습보고서
getwd()
data1 <- read.csv('data1.csv')
data1
sapply(data1[,c(2:15)],sum)
apply(data1[c(1:5),c(2:15)],1,sum)



#sweep 함수로 한꺼번에 차이 구하기
mat1
a <- c(1,1,1)
sweep(mat1, 2, a)

#length()함수
a <- c(1,2,3,4,5)
length(a)
Fruits
length(Fruits)
ggplot2::geom_bar

#sort()
sort1 <- Fruits$Sales
sort1
sort(sort1)
sort(sort1,decreasing=T)

#plyr()
getwd()
#install.packages('plyr')
library(plyr)
fruits <- read.csv('fruits_10.csv',header=T)
fruits
ddply(fruits,'name',summarise,sum_qty=sum(qty),sum_price=sum(price))
ddply(fruits,'name',summarise,max_qty=max(qty),min_price=min(price))
ddply(fruits,c('year','name'),summarise,max_qty=max(qty),min_price=min(price))
ddply(fruits,'name',transform,sum_qty=sum(qty),pct_qty=(100*qty)/sum(qty))


#dplyr() 패키지
#install.packages('dplyr')
#library(dplyr)
data1 <- read.csv('2013년_프로야구선수_성적.csv')
data1

data2 <- filter(data1,경기>120)
data2

data3 <- filter(data1, 경기>120& 득점 > 80)
data3

data4 <- filter(data1, 포지션 %in% c('1루수','3루수'))
data4

select(data1,선수명,포지션,팀)
select(data1,순위:타수)
select(data1,-홈런,-타점,-도루)

data1 %>%  select(선수명,팀,경기,타수) %>%  filter(타수 > 400)

data1 %>%  select(선수명,팀,경기,타수) %>%  filter(타수 > 400) %>% arrange(타수)

data1 %>%  select(선수명,팀,경기,타수) %>%  filter(타수 > 400) %>% arrange(desc(타수))

data1 %>%  select(선수명,팀,경기,타수) %>%  mutate(경기x타수 = 경기*타수) %>% arrange(경기x타수)

data1 %>% group_by(팀) %>% summarise(avarage = mean(경기,na.rm = TRUE))

data1 %>% group_by(팀) %>% summarise_each(funs(mean),경기,타수)

data1 %>% group_by(팀) %>% summarise_each(funs(mean,n()),경기,타수)

