def from_roman_numeral(roman_numeral):
    numbers = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    
    prev = 0
    total = 0
    
    for char in reversed(roman_numeral):
        current = numbers[char]

        if current >= prev:
            total += current
        else:
            total -= current
        prev = current

    return total





print(from_roman_numeral('MMMM'))
