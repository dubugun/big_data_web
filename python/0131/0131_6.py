ss = input("문장을 입력해주세요")

if ss.isdigit() == True:
    print("숫자입니다")
    
elif ss.isalpha() == True:
    print("글자입니다.")

elif ss.isalnum() == True:
    print('영숫자 입니다')

else :
    print('모르겠습니다.')
    
