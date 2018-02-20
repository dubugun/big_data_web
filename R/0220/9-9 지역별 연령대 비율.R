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
list_job <- read_excel('Koweps_Codebook.xlsx', col_names = T, sheet = 2)


welfare <- left_join(welfare, list_job, id = 'code_job')

welfare$religion <- ifelse(welfare$religion == 1, 'yes','no')
table(welfare$religion)

welfare$group_marriage <- ifelse(welfare$marriage == 1, 'marriage', ifelse(welfare$marriage == 3, 'divorce', NA))
table(welfare$group_marriage)




list_region <- data.frame(code_region = c(1:7),
                          region = c('서울',
                                     '수도권(인천/경기',
                                     '부산/경남/울산',
                                     '대구/경북',
                                     '대전/충남',
                                     '강원/충북',
                                     '광주/전남/전북/제주도'
                          ))


welfare <- left_join(welfare, list_region, id = 'code_region')
welfare %>% 
  select(code_region, region) %>% 
  head


region_ageg <- welfare %>% 
  group_by(region, ageg) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,2))
#head(region_ageg)


ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) + geom_col() + coord_flip()

list_order_old <- region_ageg %>% 
  filter(ageg == 'old') %>% 
  arrange(pct)
#list_order_old

order <- list_order_old$region

region_ageg$ageg <- factor(region_ageg$ageg, level = c('old','middle','young'))

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) + geom_col() + coord_flip()+
  scale_x_discrete(limits = order)