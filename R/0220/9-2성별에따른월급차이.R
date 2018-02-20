install.packages("foreign") # foreign 패키지 설치
install.packages("readxl")

library(foreign) # SPSS 파일 로드
library(dplyr) # 전처리
library(ggplot2) # 시각화

library(readxl) # 엑셀 파일 불러오기
setwd("c://easy_r")
# 데이터 불러오기

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
# 복사본 만들기

welfare <- raw_welfare
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)
welfare <- rename(welfare,
                  sex = h10_g3, # 성별
                  birth = h10_g4, # 태어난 연도
                  marriage = h10_g10, # 혼인 상태
                  religion = h10_g11, # 종교
                  income = p1002_8aq1, # 월급
                  code_job = h10_eco9, # 직종 코드
                  code_region = h10_reg7) # 지역 코드

class(welfare$sex)
table(welfare$sex)

welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
table(is.na(welfare$sex))

welfare$sex <- ifelse(welfare$sex == 1, 'male', 'female')
table(welfare$sex)

plot.new()
dev.new()
qplot(welfare$sex)



class(welfare$income)
summary(welfare$income)
qplot(welfare$income) + xlim(0,1000)
summary(welfare$income)
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))


sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
sex_income


ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()