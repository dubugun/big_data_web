#install.packages("foreign") # foreign 패키지 설치
#install.packages("readxl")

library(foreign) # SPSS 파일 로드
library(dplyr) # 전처리
library(ggplot2) # 시각화

library(readxl) # 엑셀 파일 불러오기
setwd("c://easy_r")
# 데이터 불러오기

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
# 복사본 만들기

welfare <- raw_welfare
#head(welfare)
#tail(welfare)
#View(welfare)
#dim(welfare)
#str(welfare)
#summary(welfare)
welfare <- rename(welfare,
                  sex = h10_g3, # 성별
                  birth = h10_g4, # 태어난 연도
                  marriage = h10_g10, # 혼인 상태
                  religion = h10_g11, # 종교
                  income = p1002_8aq1, # 월급
                  code_job = h10_eco9, # 직종 코드
                  code_region = h10_reg7) # 지역 코드

plot.new()
dev.new()
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
welfare$sex <- ifelse(welfare$sex == 1, 'male', 'female')
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
welfare$age <- 2018 - welfare$birth + 1
welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, 'young',
                       ifelse(age<= 59, 'middle','old')))



class(welfare$code_job)
table(welfare$code_job)
list_job <- read_excel('Koweps_Codebook.xlsx', col_names = T, sheet = 2)
head(list_job)
dim(list_job)
welfare <- left_join(welfare, list_job, id = 'code_job')
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)
job_income <- welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income))
head(job_income)

top10 <- job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
top10
ggplot(data = top10, aes(x= reorder(job, mean_income), y = mean_income)) + geom_col() + coord_flip()

bottom10 <- job_income %>% 
  arrange(mean_income) %>% 
  head(10)
ggplot(data = bottom10, aes(x = reorder(job, -mean_income), y = mean_income)) +
  geom_col() +
  coord_flip() +
  ylim(0, 850)
