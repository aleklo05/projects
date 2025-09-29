euro = [1, 2, 5, 10, 20, 50, 100, 200, 500]

def how_to_pay(value, currency):
    answer = {}
    currency = sorted(currency, reverse=True)  # use larger denominations first
    
    for coin in currency:
        if value >= coin:
            count = value // coin
            answer[coin] = count
            value -= coin * count
    
    return answer





print(how_to_pay(12455453,euro))
