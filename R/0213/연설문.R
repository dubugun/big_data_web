getwd()
setwd('c:/easy_r')
library(KoNLP)
library(wordcloud)
library(stringr)
mergeUserDic(data.frame('ncn'))
txt <- readLines('noh.txt')
place <- sapply(txt,extractNoun, USE.NAMES = F)
#place
head(unlist(place),30)
cdata <- unlist(place)
place <- str_replace_all(cdata,'[^[:alpha:]]','')
place <- gsub(' ','',place)
#place

#txt <- readLines('서울명소gsub.txt')
#cnt_txt <- length(txt)
#i <- 1
#for(i in 1:cnt_txt){place <- gsub((txt[i]),'',place)}
#place

place <- Filter(function(x) {nchar(x) >= 2}, place)
#place
write(unlist(place),'연설문.txt')
rev <- read.table('연설문.txt')
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing=T),30)

library(RColorBrewer)
palete <- brewer.pal(9,'Set1')
wordcloud(names(wordcount),freq = wordcount, scale=c(2,0.25), rot.per = 0.25, min.freq=2, random.order = F, random.color=T, colors = palete)
legend(0.3, 1, '故노무현 대통령님 연설문 분석', cex = 0.8, fill=NA, border = NA, bg = 'white', text.col='red', text.font=2, box.col='red')
