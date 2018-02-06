class Car :
    color = ''
    speed = 0
    count = 0

    def __init__(self) :
        self.speed = 0
        Car.count += 1

    def upSpeed(self, value) :
        self.speed += value

    def downSpeed(self, value) :
        self.speed -= value

myCar1, myCar2 = None, None


myCar1 = Car()
myCar1.color = '빨강'
myCar1.speed = 30


print('자동차1의 색상은 %s이며, 현재속도는 %d km, 생산된 자동차 숫자는 총 %d대입니다.' % (myCar1.color, myCar1.speed, Car.count))


myCar2 = Car()
myCar2.color = '파랑'
myCar2.speed = 60


print('자동차2의 색상은 %s이며, 현재속도는 %d km, 생산된 자동차 숫자는 총 %d대입니다.' % (myCar2.color, myCar2.speed, Car.count))


myCar3 = Car()
myCar3.color = '노랑'
myCar3.speed = 0



myCar3.upSpeed(0)
print('자동차3의 색상은 %s이며, 현재속도는 %d km 입니다.' % (myCar3.color, myCar3.speed))

