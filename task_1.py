# простое число, это число которое делится без остатка на 1 и на само себя
def is_prime_number(number):
    if number == 1:
        return False
    if number % 1 == 0 and number % number == 0:
        for next_number in range(2, number):
            if number % next_number == 0:
                return False
            print('result=' + str(number % next_number))
        return True
    return False


input_number = input("Введите число для проверки ")

result = is_prime_number(int(input_number))
print(result)

# список простых чисел
# 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199
