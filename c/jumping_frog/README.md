Jumping Frog



A terminal-based arcade game written in C using the ncurses library. Guide your frog across a busy street, avoid speeding cars, use friendly blue vehicles to teleport, and score as many points as possible before time runs out!



Requirements

To compile and run this game, you need:



A C compiler (e.g., GCC).



The ncurses library.



Installing ncurses (Linux)

If you are using a Debian/Ubuntu-based distribution, you can install the required library with the following commands:



Bash

sudo apt-get update

sudo apt-get install libncurses5-dev libncursesw5-dev





Compilation and Execution

Open your terminal in the directory containing your source code and the config.txt file.



Compile the game using the following command:



Bash

gcc main.c -o jumping\_frog -lncurses

Run the compiled executable:



Bash

./jumping\_frog



Controls

w - Move Up



s - Move Down



a - Move Left



d - Move Right



q / e / z / c - Move Diagonally



g - TELEPORT (Press when near a friendly blue car to jump closer to the finish line)



s - Start game (from the main menu)



k - Quit the game



Rules

The Goal: Reach the other side of the street (the green finish line).



Cars and Obstacles: Colliding with a regular car or a static obstacle (#) immediately ends the game with a total score of 0 points.



Friendly Vehicles (Blue): If you get close to a blue car and press g, it will transport you closer to the finish line.



Scoring: You receive 1 point for every second you survive in the game.



Finish Line Bonus: Successfully reaching the other side grants a massive bonus: Remaining Time \* 3 points.

