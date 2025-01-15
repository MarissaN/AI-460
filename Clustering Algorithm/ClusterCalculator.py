import math

countc = 1
countn = 1
while countc <= 3:
    C1 = float(input("Enter center 1: "))
    C2 = float(input("Enter center 2: "))
    countc += 1
    while countn <= 12 :
        N1 = float(input("Enter number 1: "))
        N2 = float(input("Enter number 2: "))
        answer1 = pow((N1 - C1),2)
        answer2 = pow((N2 - C2),2)
        answer3 = answer1 + answer2
        print("Answer before Square root ", answer3)
        x_answer = math.sqrt(answer3)
        print("Answer after Square root ", x_answer)
        countn += 1
    




