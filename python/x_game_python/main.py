import random
from math import sqrt 

all_coordinates = []
where_exes = []


def main():
    points = 0
    x = int(input("Enter the width of your board: "))
    y = int(input("Enter the height of your board: "))

    print(f"Okay! Your board's dimensions are: {x}x{y}")

    for i in range(x):
        for j in range(y):
            all_coordinates.append((i+1,j+1))

    how_many_exes = int(sqrt(x*y - (x-1)*(y-1))) * 2

    print(f"{how_many_exes} X's are being placed!")

    while how_many_exes > 0:
        random_position = (random.randint(1,x),random.randint(1,y))
        if random_position not in where_exes:
            where_exes.append(random_position)
            how_many_exes -= 1
            
            
    attempts = int(sqrt(x*y)) + int(sqrt(x+y))
    while attempts > 0:
        print(f"You have only {attempts} atttempts left!")
        user_x = int(input("x: "))
        user_y = int(input("y: "))
        if where_exes == []:
            print(f"Game over! Your points: {points}")
            return
        if (user_x,user_y) in where_exes:
            points += 10
            print(f"Congrats! +10 pts and 1 attempt more!")
            where_exes.remove((user_x,user_y))
            attempts += 1
        elif user_x > x or user_y > y:
            print(f"Are you sure that this value is in the range of the maximum coordinates?")
        else:
            attempts -= 1
            
    print(f"Game over! Your points: {points}")
    print(f"The X's were placed on: {where_exes}")
    

main()
