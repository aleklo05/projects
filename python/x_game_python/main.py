import random
from math import sqrt 

# stores all possible coordinates on the board
all_coordinates = []

# stores coordinates where X's are placed
where_exes = []


def place_exes(x,y):
    """Places random X's on the board and calculates number of attempts."""
    
    how_many_exes = int(sqrt(x*y - (x-1)*(y-1))) * 2
    total_exes = how_many_exes # save original count for printing
    
    while how_many_exes > 0:
        random_position = (random.randint(1,x), random.randint(1,y))
        if random_position not in where_exes:
            where_exes.append(random_position)
            how_many_exes -= 1

    print(f"{total_exes} X's are placed!")

    # calculate the number of attempts based on board size    
    attempts = int(sqrt(x*y)) + int(sqrt(x+y))

    return attempts


def generate_board():
    """Generates board dimensions and coordinate list."""
    
    x = int(input("Enter the width of your board: "))
    y = int(input("Enter the height of your board: "))

    print(f"Okay! Your board's dimensions are: {x}x{y}")

    # generate all possible board coordinates
    for i in range(x):
        for j in range(y):
            all_coordinates.append((i+1,j+1))

    # randomly place X's on the board and get number of attempts
    attempts = place_exes(x,y)

    return x, y, attempts

        
            
def main():
    """Main game logic."""
    
    points = 0 # player's score
    
    # generate the board and initialize game variables
    x, y, attempts = generate_board()


    # main game loop
    while attempts > 0:
        print(f"You have only {attempts} atttempts left!")
        user_x = int(input("x: "))
        user_y = int(input("y: "))

        # end the game early if all X's are found
        if where_exes == []:
            print(f"Game over! Your points: {points}")
            return

        # successful hit
        if (user_x,user_y) in where_exes:
            points += 10
            print(f"Congrats! +10 pts and 1 attempt more!")
            where_exes.remove((user_x,user_y))
            attempts += 1

        # invalid coordinates
        elif user_x > x or user_y > y:
            print("Are you sure these values are within the board range?")

        # missed attempt
        else:
            attempts -= 1  # decrease attempts after a miss

    # game summary     
    print(f"Game over! Your points: {points}")
    print(f"The X's were placed on: {where_exes}")
    

main()
