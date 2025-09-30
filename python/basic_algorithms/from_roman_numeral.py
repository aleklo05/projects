numbers = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
subtractive_pairs = {'IV', 'IX', 'XL', 'XC', 'CD', 'CM'}

def check(roman_numeral):
    if not roman_numeral:
        return False

    repeat_count = 1  # to track how many times a character repeats in a row
    prev_char = roman_numeral[0]
    
    if prev_char not in numbers:
        return False

    prev_value = numbers[prev_char]

    for i in range(1, len(roman_numeral)):
        curr_char = roman_numeral[i]

        if curr_char not in numbers:
            return False

        curr_value = numbers[curr_char]

        # check for character repetition rules
        if curr_char == prev_char:
            repeat_count += 1

            if curr_char in {'V', 'L', 'D'}:
                return False  # V, L, D cannot be repeated

            if repeat_count > 3:
                return False  # I, X, C, M cannot repeat more than 3 times
        else:
            repeat_count = 1  # reset repeat count if character changes


        # check for valid subtractive pairs like IV, IX, etc.
        if prev_value < curr_value:
            pair = prev_char + curr_char
            if pair not in subtractive_pairs:
                return False  

            # prevent multiple subtractive pairs in a row (like IXC)
            if i >= 2 and numbers[roman_numeral[i - 2]] < numbers[roman_numeral[i - 1]]:
                return False

        
        prev_char = curr_char
        prev_value = curr_value

    return True  



    
def from_roman_numeral(roman_numeral):
    if check(roman_numeral):
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
    
    else:
        return f"{roman_numeral} is not a correct roman numeral!"





print(from_roman_numeral('CCLIII'))
