getwd()
setwd('c:/easy_r')
library(dplyr)
exam <- read.csv('csv_exam.csv')
exam

exam %>% filter(class==1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english < 90 | science <50 )

exam %>% filter(class == 1 | class == 3 | class == 5)

exam %>% filter(class %in% c(1,3,5))

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)
mean(class1$math)
mean(class2$math)

##혼자서해보기

library(ggplot2)
mpg
q1_1 <- mpg %>% filter(displ<=4)
q1_2 <- mpg %>% filter(displ > 5)
q1_1
q1_2
mean(q1_1$hwy)
mean(q1_2$hwy)

q2_1 <- mpg %>% filter(manufacturer == 'audi')
q2_1
q2_2 <- mpg %>% filter(manufacturer == 'toyota')
mean(q2_1$cty)
mean(q2_2$cty)

q3_1 <- mpg %>% filter(manufacturer == 'chevrolet' | manufacturer == 'ford' | manufacturer == 'honda')
q3_1
mean(q3_1$hwy)
q3_2 <- mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda'))
q3_2
class(mpg)


exam %>%  select(math)
exam %>%  select(english)
exam %>% select(class,math,english)
exam %>% select(-math)
exam %>% select(-math, -english)

exam %>% filter(class == 1) %>% select(english)
#가독성 있게 바꾼 코드
exam %>% 
  filter(class == 1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head(10)

#혼자서 해보기

Q1_1 <- mpg %>% select(class,cty)
Q1_1 %>% head(10)

Q2_1 <- mpg %>% filter(class == 'suv') %>% select(cty)
Q2_2 <- mpg %>% filter(class == 'compact') %>% select(cty)
mean(Q2_1$cty)
mean(Q2_2$cty)


exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class,math)

qq1 <- mpg %>% filter(manufacturer == 'audi') %>% select(model,hwy) %>% arrange(desc(hwy))
qq1 %>% head(5)


exam %>% mutate(total = math + english + science) %>% head

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>% head

exam %>% 
  mutate(test = ifelse(science >= 60, 'pass', 'fail')) %>% head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head


#혼자서 해보기 144p

mpg2 <- mpg %>% 
  mutate(total_mpg = cty + hwy)
mpg2 %>% select(cty,hwy,total_mpg)

mpg3 <- mpg %>% 
  mutate(total_mpg = cty + hwy,
         mean_mpg = (cty+hwy)/2)
mpg3 %>% select(cty,hwy,total_mpg,mean_mpg)

mpg3 %>% arrange(desc(mean_mpg)) %>% head(3)

mpg %>% 
  mutate(total_mpg = cty + hwy,
         mean_mpg = (cty+hwy)/2) %>% 
  arrange(desc(mean_mpg)) %>% head(3)



exam %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)


### dplyr 조합하기
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == 'suv') %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)


### 혼자서 해보기 150p
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))


mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))


mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)


mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == 'compact') %>% 
  summarise(n_compact = n()) %>% 
  arrange(desc(n_compact))




test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))

total <- left_join(test1, test2, by = 'id')
total

name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c('kim','lee','park','choi','jung'))
name

exam_new <- left_join(exam, name, by = 'class')
exam_new


group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70,83,65,95,80))

group_all <- bind_rows(group_a, group_b)
group_all



#혼자서 해보기 156p
fuel <- data.frame(fl = c('c','d','e','p','r'),
                   price_fl = c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel

mpg_new <- left_join(mpg,fuel,by = 'fl')
mpg_new %>% 
  select(model,fl,price_fl) %>% 
  head(5)


#분석 도전 160p
midwest
midwest2 <- midwest %>% 
  mutate(rate = 100 * (poptotal-popadults)/poptotal,
         )

midwest2 %>% 
  select(county,rate) %>% 
  arrange(desc(rate))

lunch = data.frame()

midwest3 <- midwest %>% 
  mutate(rate = 100 * (poptotal-popadults)/poptotal,
         aa = ifelse(rate>= 40,'large',ifelse(rate<30,'small','middle'))
  )

midwest3 %>% 
  group_by(aa) %>% 
  summarise(n = n())

midwest4 <- midwest %>% 
  mutate(asianrate = (100*popasian)/poptotal) %>% 
  select(state,county,asianrate) %>% 
  arrange(asianrate) %>% 
  head(10)
midwest4



#그래픽기초

var1 <- c(1,2,3,4,5)
plot(var1)
var2 <- c(2,2,2)
plot(var2)

x <- 1:3
y <- 3:1
plot(x,y)
plot(x,y,xlim=c(1,10),ylim=c(1,5))
plot(x,y,xlim=c(1,10),ylim=c(1,5),
     xlab='x축 값', ylab='y축 값',
     main = 'plot test')




plot.new()
dev.new()


#조금 더 멋진 그래프 예

v1 <- c(100,130,120,160,150)
plot(v1,type='o', col='red', ylim=c(0,200),
     axes = FALSE, ann=FALSE)
axis(1,at=1:5,
     lab=c('mon','tue','wed','thu','fri'))
axis(2,ylim=c(0,200))

title(main = 'fruit', col.main='red',font.main=4)
title(xlab='day', col.lab='black')
title(ylab='price',col.lab='blue')


v1
par(mfrow=c(1,3))
plot(v1,type='o')
plot(v1,type='s')
plot(v1,type='l')


v1
par(mfrow=c(1,3))
pie(v1)
plot(v1,type='o')
barplot(v1)


a <- c(1,2,3)
plot(a,xlab='aaa')

par(mgp=c(3,1,0))
plot(a,xlab='aaa')

par(mgp=c(3,2,0))
plot(a,xlab='aaa')

par(mgp=c(3,2,1))
plot(a,xlab='aaa')

par(oma=c(2,1,0,0))
plot(a,xlab='aaa')

par(oma=c(0,2,0,0))
plot(a,xlab='aaa')

par(mfrow=c(1,1))
v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1,type='s',col='red',ylim=c(1,5))
par(new=T)
plot(v2,type='o',col='blue',ylim=c(1,5))
par(new=T)
plot(v3,type='l',col='green')

v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1,type='s',col='red',ylim=c(1,5))
lines(v2,type='o',col='blue',ylim=c(1,5))
lines(v3,type='l',col='green')

v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1,type='s',col='red',ylim=c(1,10))
lines(v2,type='o',col='blue',ylim=c(1,5))
lines(v3,type='l',col='green',ylim = c(1,15))
legend(1,9,c('v1','v2','v3'),cex=0.9,col=c('red','blue','green'),lty=1)



#실습문제(1)-보고서
y <- c(3,4,5,6,7)
plot(y)

y <- c(3,3,4,4)
plot(y)

x<- c(3,3,3)
y<- 2:4
plot(x,y)

x<- seq(10,90,10)
y <- seq(10,2,-1)
plot(x,y)

x<-c(2,4,6,8)
y <- c(16,17,19,18)
plot(x,y,xlim=c(0,10),ylim=c(15,20),xlab = 'xxx', ylab = 'yyy')

x<-c(2,4,6,8)
y <- c(16,17,19,18)
par(mgp=c(2,1,0))
plot(x,y,xlim=c(0,10),ylim=c(15,20),xlab = 'xxx', ylab = 'yyy')

par(mgp=c(4,2,0))
plot(x,y,xlim=c(0,10),ylim=c(15,20),xlab = 'xxx', ylab = 'yyy')

par(mgp=c(4,2,1))
plot(x,y,xlim=c(0,10),ylim=c(15,20),xlab = 'xxx', ylab = 'yyy')

par(oma=c(4,0,0,0))
plot(x,y,xlim=c(0,10),ylim=c(15,20),xlab = 'xxx', ylab = 'yyy')

par(oma=c(0,4,0,0))
plot(x,y,xlim=c(0,10),ylim=c(15,20),xlab = 'xxx', ylab = 'yyy')

par(oma=c(0,0,4,0))
plot(x,y,xlim=c(0,10),ylim=c(15,20),xlab = 'xxx', ylab = 'yyy')

par(oma=c(0,0,0,4))
plot(x,y,xlim=c(0,10),ylim=c(15,20),xlab = 'xxx', ylab = 'yyy')


#dev.new()
x <- 12:18
y <- c(30,31,33,32,28,27,30)
plot(x,y,xlim=c(10,20),ylim=c(26,34),xlab='7월의 날짜(일)',ylab = '최고기온')

x <- c(1,2,2)
y <- c(99,98,100)
plot(x,y,xlim = c(0,3), ylim = c(95,100), xlab = '4학년(반)',ylab = '점수(점)')
title(main = '4학년 1~3등 반 분포', col.main='black',font.main=4)




x <- 1:5
y <- c(5,7,7,6,1)
x
plot(x,y,type='o', col='red', ylim=c(0,8),
     axes = FALSE, ann=FALSE)
axis(1,at=1:5,
     lab=c('A','B','C','D','F'))
axis(2,ylim=c(0,8))

title(main = '학점별 학생수', col.main='red',font.main=4)
title(xlab='학점(점)', col.lab='black')
title(ylab='학생수(명)',col.lab='blue')


#과제 중간멈춤
x <- 1:4
y <- c(12,13,20,23)
plot(x,y,type='o', col='red', ylim=c(10,24),
     axes = FALSE, ann=FALSE)
axis(1,at=1:4,
     lab=c('나리','구슬','송이','난초'))
axis(2,ylim=c(10,24))

title(main = '반별 어린이수', col.main='red',font.main=4)
title(xlab='학점(점)', col.lab='black')
title(ylab='학생수(명)',col.lab='blue')





















x <- c(1,2,3,4,5)
barplot(x)
barplot(x,horiz=T)

x <- matrix(c(5,4,3,2),2,2)
barplot(x,beside=T,names=c(5,3),col = c('green','yellow'))
x
barplot(x,names=c(5,3),col=c('green','yellow'),ylim=c(0,12))
x
par(oma = c(1,0.5,1,0.5))
barplot(x,names=c(5,3),beside=T,col = c('green','yellow'),horiz = T)
barplot(x,names=c(5,3),col = c('green','yellow'),horiz = T)



v1 <- seq(100,180,20)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)
qty <- data.frame(BANANA = v1, CHERRY = v2, ORANGE = v3)
qty


barplot(as.matrix(qty),main = "Fruit's Sales QTY",
        beside = T, 
        col = rainbow(nrow(qty)),ylim=c(0,400))
legend(14,400,c('MON','TUE','WED','THU','FRI'),cex = 0.8, fill = rainbow(nrow(qty)))


barplot(t(qty),main = "Fruit's Sales QTY", ylim=c(0,900), col = rainbow(length(qty)), space = 0.1, cex.axis=0.8, las = 1, names.arg = c('MON','TUE','WED','THU','FRI'))


qty
t(qty)


peach <- c(180,200,250,198,170)
colors <- c()
for (i in 1:length(peach))
  {if (peach[i] >= 200)
    {colors <- c(colors,'red')}
  else if (peach[i] >= 180)
    {colors <- c(colors, 'yellow')}
  else 
    {colors <- c(colors, 'green')
  }
}
barplot(peach,main='Peach sales QTY',
        names.arg=c('MON','TUE','WED','THU','FRI'),col = colors)


height <- c(182,175,167,172,163,178,181,166,159,155)
hist(height,main = 'histogram of height')

par(mfrow=c(1,2),oma=c(2,2,0.1,0.1))
hist <- c(1,1,2,3,3,3)
hist(hist)
plot(hist,main='Plot')


#pie chart 파이차트 그리기

par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)
pie(p1,radius=1)

pie(p1,radius=1,init.angle= 90)

pie(p1,radius=1,init.angle= 90,col = rainbow(length(p1)), label = c('Week 1','Week 2', 'Week 3', 'Week 4'))


pct <- round(p1/sum(p1) * 100,1)
lab <- paste(pct,' %')
pie(p1,radius=1,init.angle= 90,col = rainbow(length(p1)), label = lab)
legend(1,1.1,c('Week 1','Week 2', 'Week 3', 'Week 4'), cex = 0.5, fill = rainbow(length(p1)))


pct <- round(p1/sum(p1) * 100,1)
lab1 <- c('Week 1','Week 2', 'Week 3', 'Week 4')
lab2 <- paste(lab1,'\n',pct,' %')
pie(p1,radius=1,init.angle= 90,col = rainbow(length(p1)), label = lab2)


#3d 파이
#패키지다운
#install.packages('plotrix')
library(plotrix)

p1 <- c(10,20,30,40,50)
f_day <- round(p1/sum(p1)*100,1)
f_label <- paste(f_day,'%')
pie3D(p1,main='3D Pie Chart',col = rainbow(length(p1)), cex=0.5, labels=f_label, explode = 0.05)
legend(0.5,1,c('MON','TUE','WED','THU','FRI'),cex = 0.6, fill=rainbow(length(p1)))


#박스플랏 상자차트
v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
boxplot(v1,v2,v3)
boxplot(v1,v2,v3,col=c('blue','yellow','pink'), names = c('Blue','Yellow','Pink'), horizontal = T)




#7장 162p
df <- data.frame(sex = c('M','F',NA,'M','F'),
                 score = c(5,4,3,4,NA))
df

is.na(df)

table(is.na(df$sex))
table(is.na(df$score))

#NA
mean(df$score)
mean(df$score)

library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

#결측지 제외 데이터로 분석하기
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

#원했던거
df_nomiss2 <- na.omit(df)
df_nomiss2

mean(df$score, na.rm = T)
sum(df$score, na.rm = T)



exam <- read.csv('csv_exam.csv')
exam
exam[c(3,8,15), 'math'] <- NA
exam

exam %>% 
  summarise(mean_math = mean(math))
exam %>% 
  summarise(mean_math = mean(math,na.rm = T))
exam %>% 
  summarise(mean_math = mean(math, na.rm = T),
            sum_math = sum(math, na.rm = T),
            median_math = median(math, na.rm = T))

mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math),55,exam$math)
table(is.na(exam$math))
mean(exam$math)



#혼자서 해보기 170p
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),'hwy'] <- NA
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean1 = mean(hwy))





#이상한 데이터
outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
outlier
#결측치제거
table(outlier$sex)
table(outlier$score)
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
outlier$score <- ifelse(outlier$score >5, NA, outlier$score)
outlier

#결측치 제외후 분석
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))


#범위정해서 제외하기
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))



#혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), 'drv'] <- 'k'
mpg[c(29,43,129,203),'cty'] <- c(3,4,39,42)
mpg$drv[10]

boxplot(mpg$drv)
boxplot(mpg$cty)
boxplot(mpg$cty)$stats

mpg$drv <- ifelse(mpg$drv == "k",NA,mpg$drv)
table(is.na(mpg$drv))

mpg$cty <- ifelse(mpg$cty <9 | mpg$cty >26,NA,mpg$cty)
table(is.na(mpg$cty))

mpg <- na.omit(mpg)
mpg %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean = mean(cty))







