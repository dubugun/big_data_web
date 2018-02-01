list_ex1 = ['risk','issue','test','maintenance','maturity']
list_ex2 = ['security', 'plan', 'design', 'systematic', 'safety']
list_ex3 = ['maintenance','verification','validation']

list1 = [list_ex1, list_ex2, list_ex3]


for i in range(len(list1)) :
    if ( 'maintenance' in list1[i] ) and len(list1[i]) >= 5 :
        print(list1[i],"는 시험 문제로 쓰일 수 있습니다.")
    
