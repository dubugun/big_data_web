import urllib.request
import urllib.parse
import re


def bind_url():
    default_url = 'https://openapi.naver.com/v1/search/image.xml?'
    sort = 'sort=sim'
    start = '&start=1'
    display = '&display=10'
    query = '&query='+urllib.parse.quote_plus(str(input('검색어를 입력하세요:')))
    full_url = default_url + sort + start + display + query
    return full_url

def fetch_contents_from_url():
    url = bind_url()
    headers={
    'Host':'openapi.naver.com',
    'User-Agent' : 'curl/7.43.0',
    'Accept':'*/*',
    'Content-Type':'application/xml',
    'X-Naver-Client-Id' : 'vXNhBWcj7JqPgiA6Z1BF',
    'X-Naver-Client-Secret':'dN2b9_qOFj'
    }
    r = urllib.request.Request(url,headers=headers)
    q = urllib.request.urlopen(r)
    html = q.read()
    return html

def extract_text_in_tags(tags,tagname='title') :
    txt = []
    reg = '[^<' + tagname + '>][^<]+'
    for tag in tags :
        txt.append(re.search(reg,tag).group())
    return txt

def get_contents_from_html() :
    html = fetch_contents_from_url()
    title_tags = re.findall('<title>[^<]+</title>',html.decode('utf-8'))
    link_tags = re.findall('<link>[^<]+</link>',html.decode('utf-8'))
    titles = extract_text_in_tags(title_tags,tagname = 'title')
    links = extract_text_in_tags(link_tags,tagname = 'link')
    f = open('image.html','w')
    f.write('<html><body>')
    for i in range(1,len(titles)) :
        f.write('<p>'+titles[i]+'</p>')
        f.write('<img src='+links[i]+'/>')
    f.write('</body></html>')
    f.close()

get_contents_from_html()
    
