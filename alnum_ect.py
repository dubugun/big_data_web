ss.isdigit( ) : 전체가 숫자로만 구성되어 있는가
ss.isalpha( ) : 전체가 글자(한글/영어)로만 구성되어 있는가
ss.isalnum( ) : 전체가 글자와 숫자가 섞여서 구성되어 있는가
ss.islower( ) : 전체가 소문자로만 구성되어 있는가
ss.isupper( ) : 전체가 대문자로만 구성되어 있는가
ss.isspace( ) : 전체가 공백문자로만 구성되어 있는가


ss.center( ) : 숫자만큼 전체 자릿수를 잡은 후 문자열을 가운데 배치
ss.ljust( ) : 왼쪽에 붙여 출력
ss.rjust( ) : 오른쪽에 붙여 출력
ss.zfill( ) : 오른쪽으로 붙여 쓰고 왼쪽 빈 공간은 0으로 채움


.strip() 공백제거

.replace(원래, 고칠거)


count( ) : 찾을 문자열이 몇 개 들었는지 개수를 셈

find( ) : 찾을 문자열이 몇 번째 위치하는지 찾음
  find(‘찾을 문자열’, 시작위치) 함수 : 시작위치부터 문자열을 찾음
  
rfind( ) : 오른쪽부터 셈

index( ) : find() 함수와 동일한 용도, 찾을 문자열이 없다면 오류가 발생

startswith( ) : 문자열로 시작하면 True를, 그렇지 않으면 False를 반환

endswith( ) : 문자열로 끝나면 True를 반환
