hour = int(input("시각을 입력하시오"))
minute = int(input("분을 입력하시오"))
sec = int(input("초를 입력하시오"))

total = hour * 3600 + minute * 60 + sec

print("총 시간을 초로 환산하면",total,"초 입니다")
