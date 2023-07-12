
with open("test_text.txt", "r") as file:
    letters_list = []
    for line in file:
        words = line.split(' ')
        for word in words:
            for letter in word:
                if letter != '\n':
                    letters_list.append(letter.lower())
    print('Количество уникальных букв - ' + str(len(set(letters_list))))
