import tweepy

import re

Consumer_Key = '1kCwYeAJTT6VEar5KrMwSZ4Xy'
Consumer_Secret = 'ge5i1VDsZVDlXUvyp9hpEYyKe1JjwzDQ2o2obNYU7VnanhCpZi'
Access_Token = '961405844544921600-N3RtPkfm3LA6ctRDoV6Sjw6PsNW8Vej'
Access_Token_Secret = 'Uc2IW80Pb2KycIYYv2oyy6XHPF4yVRB8fLWVG6fResEdp'


auth = tweepy.OAuthHandler(Consumer_Key, Consumer_Secret)

auth.set_access_token(Access_Token, Access_Token_Secret)

api = tweepy.API(auth)

keyword = '증권'

result = []

r = re.compile('[가-힣]+')
go = ''

for i in range(1,2):
    tweets = api.search(keyword)
    for tweet in tweets :
        go = r.match(str(tweet)).group()
        result.append(go)


print(len(result))
print(type(result[0]))

'''
for i in range(0,len(result)):
    print(result[i])
'''


for i in range(0,len(result)):
    try :
        print('성공')
    except UnicodeEncodeError:
        print('인코딩 에러입니다.')
        continue



f = open('tweet.txt','w')
for i in range(0,len(result)):
    try:
        f.write(str(result[i])+ '\n')
    except UnicodeEncodeError:
        print('인코딩 에러입니다.')
        continue
f.close()

