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

#


class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)
table(is.na(welfare$birth))
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))


welfare$age <- 2018 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)



age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))
head(age_income)
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()


#


plot.new()
dev.new()
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
welfare$sex <- ifelse(welfare$sex == 1, 'male', 'female')
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
welfare$age <- 2018 - welfare$birth + 1


sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mean_income = mean(income))
sex_income


welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, 'young',
                       ifelse(age<= 59, 'middle','old')))
table(welfare$ageg)
qplot(welfare$ageg)
ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))
ageg_income
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col() + scale_x_discrete(limits = c('young','middle','old'))
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) + geom_col(position =) + scale_x_discrete(limits = c('young','middle','old'))







plot.new()
dev.new()
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
welfare$sex <- ifelse(welfare$sex == 1, 'male', 'female')
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
welfare$age <- 2018 - welfare$birth + 1


sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mean_income = mean(income))
sex_income

ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) + geom_col() + scale_x_discrete(limits = c('young','middle','old'))




welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, 'young',
                       ifelse(age<= 59, 'middle','old')))
table(welfare$ageg)
qplot(welfare$ageg)
ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))
ageg_income
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col() + scale_x_discrete(limits = c('young','middle','old'))

#-----------------------------------------

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


#----------------------------------------

job_male <- welfare %>% 
  filter(!is.na(job) & sex == 'male') %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_male

job_female <- welfare %>% 
  filter(!is.na(job) & sex == 'female') %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_female


ggplot(data = job_male, aes(x = reorder(job, n), y = n)) + geom_col() + coord_flip()
ggplot(data = job_female, aes(x = reorder(job, n), y = n)) + geom_col() + coord_flip()


#-------------------------------------9-8

welfare$religion <- ifelse(welfare$religion == 1, 'yes','no')
table(welfare$religion)

welfare$group_marriage <- ifelse(welfare$marriage == 1, 'marriage', ifelse(welfare$marriage == 3, 'divorce', NA))
table(welfare$group_marriage)

religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))
religion_marriage

divorce <- religion_marriage %>% 
  filter(group_marriage == 'divorce') %>% 
  select(religion, pct)
divorce

ggplot(data = divorce, aes(x = religion, y = pct)) + geom_col()

#-----------------------------------------

ageg_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))
ageg_marriage

ageg_divorce <- ageg_marriage %>% 
  filter(ageg != 'young' & group_marriage == 'divorce') %>% 
  select(ageg, pct)
ageg_divorce

ageg_religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage) & ageg != 'young') %>% 
  group_by(ageg, religion, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))
ageg_religion_marriage

df_divorce <- ageg_religion_marriage %>% 
  filter(group_marriage == 'divorce') %>% 
  select(ageg, religion, pct)
df_divorce
ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion)) + geom_col(position = 'dodge')

#----------------------------------------------

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

#------------------------------------8장

library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy))

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6) + ylim(10,30)


ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()


ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0,500000) + ylim(0,10000)

#막대그래프
#library(dplyr)
plot.new()
dev.new()

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
df_mpg

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col() 

#빈도막대그래프

ggplot(data = mpg, aes(x = drv)) + geom_bar()

ggplot(data = mpg, aes(x = hwy)) + geom_bar()

mpg$class
#혼자서해보기


df2_mpg <- mpg %>% 
  filter(class == 'suv') %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(5)
df2_mpg
ggplot(data = df2_mpg, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()


ggplot(data = mpg, aes(x = class)) + geom_bar()



#선그래프


ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()


#혼자서 해보기 195p
ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()


#상자 그래프

ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()


#혼자서 해보기198p

df3_mpg <- mpg %>% 
  filter(class =='compact' | class == 'subcompact' | class == 'suv')
df3_mpg
ggplot(data = df3_mpg, aes(x = class, y = cty)) + geom_boxplot()
