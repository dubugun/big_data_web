import urllib.request
import urllib.parse
from bs4 import BeautifulSoup

while True :
    wherenum = int(input('검색 분류를 입력하세요. 1-뉴스, 2-블로그, 3-카페'))
    where = ''
    if wherenum == 1 :
        where = 'news'
        break
    elif wherenum == 2 :
        where = 'blog'
        break
    elif wherenum == 3 :
        where = 'cafearticle'
        break
    else :
        print('잘못 입력 하셨습니다.')
        continue
    
defaultURL = ('https://openapi.naver.com/v1/search/%s.xml?' % where)

sort = 'sort=sim'
start = '&start=1'
display = '&display=100'
query = '&query='+urllib.parse.quote_plus(str(input('검색어를 입력하세요:')))
fullURL = defaultURL + sort + start + display + query


name = input('파일명을 입력하세요:')
filename = ('C:\\%s' % name)
file = open(filename,'w', encoding='utf-8')
print(fullURL)

headers={
    'Host':'openapi.naver.com',
    'User-Agent' : 'curl/7.43.0',
    'Accept':'*/*',
    'Content-Type':'application/xml',
    'X-Naver-Client-Id' : 'vXNhBWcj7JqPgiA6Z1BF',
    'X-Naver-Client-Secret':'dN2b9_qOFj'
    }
req = urllib.request.Request(fullURL,headers=headers)
f = urllib.request.urlopen(req)
resultXML = f.read()
xmlsoup = BeautifulSoup(resultXML,'html.parser')

items = xmlsoup.find_all('item')


for item in items :
    file.write('-------------------------------------\n')
    file.write('제목 : ' + item.title.get_text(strip=True) + '\n')
    file.write('요약 내용 :'+ item.description.get_text(strip=True) + '\n')
    if wherenum == 1:
        file.write('링크 : ' + item.originallink.get_text(strip=True) + '\n')
    elif wherenum == 2:
        file.write('링크 : ' + item.bloggerlink.get_text(strip=True) + '\n')
    else :
        file.write('링크 : ' + item.cafeurl.get_text(strip=True) + '\n')
    file.write('\n')
file.close()
