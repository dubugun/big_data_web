def calc_monthly_salary(time,money) :
    total = time * money
    print(total)


time = int(input("근로시간을 입력해주세요"))
money = int(input("시간당 임금을 입력해주세요"))

calc_monthly_salary(time,money)
