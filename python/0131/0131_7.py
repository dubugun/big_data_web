num = input("주민등록 번호를 입력해주세요")


if num[-7] == '1' or num[-7] == '3':
    print("남자입니다.")

elif num[-7] == '2' or num[-7] == '4':
    print("여자입니다.")

else :
    print("주민등록 번호를 다시 입력해주세요")
