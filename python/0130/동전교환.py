a = int(input("교환할 돈은 얼마?"))


b =a//500

c = a-(500 *b)
d = c//100

e = c-(100*d)
f = e//50          

g = e-(50*f)
h = g//10

i = g-(10*h)        

print("오백원짜리 ==>%d" % b)
print("백원짜리 ==>%d" % d)
print("오십원짜리 ==>%d" % f)
print("십원짜리 ==>%d" % h)
print("바꾸지 못한 잔돈 ==> %d 원" %i)
