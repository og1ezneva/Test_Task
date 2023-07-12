

def print_next_line(base_length, line_number):
  base = '*' * base_length
  if (line_number == 0):
    print(base)
    return
  left_part = ' ' * line_number + base[line_number:]
  result_part = left_part[:len(base) - line_number] + ' ' * line_number
  print(result_part)


if __name__ == '__main__':
    print_next_line(9, 0)
    print_next_line(9, 1)
    print_next_line(9, 2)
    print_next_line(9, 3)
    print_next_line(9, 4)

    print_next_line(9, 4)
    print_next_line(9, 3)
    print_next_line(9, 2)
    print_next_line(9, 1)
    print_next_line(9, 0)
