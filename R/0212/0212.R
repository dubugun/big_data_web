a<-1111
b<-222
getwd()
setwd('c:/easy_r')
var1 <- c(1,2,5,7,8)
var2 <- c(1:5)
var3 <- seq(1,5)
var4 <- seq(1,10,by = 2)
var1 + 2
var1 + var2
str1 <- 'a'
str3 <- 'Hello World!'
str4 <- c('a','b','c')
x<- c(1,2,3)
x
mean(x)
max(x)
min(x)
str5 <- c('Hello!', 'World', 'is', 'good!')
str5
paste(str5, collapse = ' ')
x_mean <- mean(x)
x_mean
str5_paste <- paste(str5, collapse = ' ')
str5_paste
install.packages('ggplot2')
library(ggplot2)
x <- c('a','a','b','c')
x
qplot(x)
qplot(data = mpg, x= hwy)
qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x= drv, y = hwy, geom = 'line')
qplot(data = mpg, x= drv, y = hwy, geom = 'boxplot')
qplot(data = mpg, x= drv, y = hwy, geom = 'boxplot', colour = drv)
print(1+2)
1+2
print('a')
'a'
print(pi) #소수점7자리
print(pi, digits =3 ) # 자리수
cat(1,':','a','\n',2,':','b')
1;2;3
1+2;2*3;4/2
10000
100000
3e-1
as.numeric('1') + as.numeric('2')
date2 <- seq(from=as.Date('2014-01-01'),
             to=as.Date('2014-05-31'), by='month')
date2
date3 <- seq(from = as.Date('2014-01-01'),
             to = as.Date('2020-05-31'), by = 'year')
str1 = "I'm James Seo"
var1 <- 'aaa'
var2 <- 111
var3 <- Sys.Date()
var4 <- c('a','b','c')
var1
string1 <- 'Very Easy R Programming'
string2 <- "I'm James Seo"
comp <- c(1,'2')
num = c(80, 60, 70, 50, 90)
M = mean(num)
M
vec1 <- c(1,2,3,4,5)

mat1 <- matrix(c(1,2,3,4))
mat1
mat2 <- matrix(c(1,2,3,4,5,6),nrow=2)
mat2
mat3 <- matrix(c(1,2,3,4,5,6),nrow=2, byrow=T)
mat3
mat3[,1]
mat3[1,]
mat3[1,1]
mat4 <- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,byrow=T)
mat4
mat4 <- rbind(mat4,c(11,12,13))
mat4
mat4 <- rbind(mat4,c(15,16,17,18))

mat5 <- matrix(c('a','b','c','d'),nrow=2,byrow=T)
mat5
mat5 <- cbind(mat5,c('e','f'))
mat5

colnames(mat5) <- c('First','Second','Third')
mat5

list1 <- list(name='James Seo', address = 'Seoul', tel='010-8706-4712', pay = 500)
list1

list1$name
list1[1:2]

list1$birth <- '1975-10-23'
list1

list1$name <- c('Seojinsu','James Seo')
list1$name
list1$birth <- NULL
list1

txt <- readLines('jeju.txt')
place <- sapply(txt,extractNoun,USE.NAMES=F)
place
head(unlist(place), 30)
cdata <- unlist(place)
place <- str_replace_all(cdata,'[^[:alpha:]]','')
place <- gsub(' ','',place)
txt <- readLines('제주도여행코스gsub.txt')
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt){ place <- gsub((txt[i]),'',place)}
place
place <- Filter(function(x) {nchar(x) >= 2} , place)
write(unlist(place), 'jeju_2.txt')
rev <- read.table('jeju_2.txt')
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing=T),30)
library(RColorBrewer)
palete <- brewer.pal(9,'Set1')
wordcloud(names(wordcount),freq=wordcount, scale = c(5,1), rot.per = 0.25, min.freq=2, random.order = F, random.color = T, colors=palete)
legend(0.3,1,'제주도 추천 여행 코스 분석', cex = 0.8, fill=NA, border = NA, bg = 'white', text.col='red', text.font=2, box.col='red')
