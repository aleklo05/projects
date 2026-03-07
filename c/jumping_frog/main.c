#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ncurses.h>

#define QUIT_TIME       5
#define QUIT            'k'
#define NOKEY           ' '
#define NUM_OBSTACLES 3

#define BET_TIME        2
#define FRAME_TIME      25
#define MVB_FACTOR      2
#define MVC_FACTOR      5

#define MAIN_COLOR  1
#define STAT_COLOR  2
#define PLAY_COLOR  3
#define CATN_COLOR      4
#define CATR_COLOR      5
#define Frog_COLOR      6
#define FRCAR_COLOR 7
#define FINISH_COLOR 8

#define BORDER          1
#define DELAY_ON        1
#define DELAY_OFF       0

#define OFFY            4
#define OFFX            8

#define RA(min, max) ( (min) + rand() % ((max) - (min) + 1) )




typedef struct {
        WINDOW* window;
        int x, y;
        int rows, cols;
        int color;
} WIN;

typedef struct {
        WIN* win;
        int color;
        int revcol;
        int bflag;
        int mv;
        int x, y;
        int width, height;
        int xmin, xmax;
        int ymin, ymax;
        char** shape;
        int is_friendly;
        int visible;
} OBJ;


typedef struct {
        unsigned int frame_time;
        float pass_time;
        int frame_no;
} TIMER;

typedef struct {
        int frog_width, frog_height;
        int car_width, car_height;
        int num_cars;
        int num_friendly_cars;
        int* car_speeds;
        int rows, cols;
        int time_limit;
} Config;


void ClearCarPosition(OBJ* car, OBJ* frog);
void UpdateCarMovement(OBJ* car, int dir);
void RedrawACar(OBJ* car, OBJ* frog);
void ChangeColors(OBJ* c) { c->bflag = !c->bflag; }
int CountVisibleCars(OBJ** cars, int num_cars);


//ODCZYTUJE KONFIGURACJE GRY Z PLIKU CONFIG.TXT
void ReadConfigFile(const char* filename, Config* config, char* speeds_line) {
        FILE* file = fopen(filename, "r");
        if (!file) {
                fprintf(stderr, "Could not open config file.\n");
                exit(EXIT_FAILURE);
        }
        fscanf(file, "frog_width=%d\n", &config->frog_width);
        fscanf(file, "frog_height=%d\n", &config->frog_height);
        fscanf(file, "car_width=%d\n", &config->car_width);
        fscanf(file, "car_height=%d\n", &config->car_height);
        fscanf(file, "num_cars=%d\n", &config->num_cars);
        fscanf(file, "num_friendly_cars=%d\n", &config->num_friendly_cars);
        fscanf(file, "car_speeds=%s\n", speeds_line);
        fscanf(file, "rows=%d\n", &config->rows);
        fscanf(file, "cols=%d\n", &config->cols);
        fscanf(file, "time_limit=%d\n", &config->time_limit);
        fclose(file);
}


//PRZETWARZA KONFIGURACJE I INICJALIZUJE PREDKOSC SAMOCHODOW
Config LoadConfig(Config* config, const char* speeds_line) {
        if (config->num_friendly_cars > config->num_cars) {
                fprintf(stderr, "Number of friendly cars cannot exceed total number of cars.\n");
                exit(EXIT_FAILURE);
        }
        config->car_speeds = (int*) malloc(config->num_cars * sizeof(int));
        if (!config->car_speeds) {
                fprintf(stderr, "Memory allocation failed for car speeds.\n");
                exit(EXIT_FAILURE);
        }
        char* mod_copy_speeds_line = strdup( speeds_line );
        if (!mod_copy_speeds_line) {
                fprintf(stderr, "Memory allocation failed for speeds_line copy.\n");
                exit(EXIT_FAILURE);
        }
        char* extracted_text = strtok(mod_copy_speeds_line, ",");
        for (int i = 0; i < config->num_cars; i++) {
                if (extracted_text == NULL) {
                        fprintf(stderr, "Not enough car speeds provided in config.\n");
                        free(mod_copy_speeds_line);
                        exit(EXIT_FAILURE);
                }
                config->car_speeds[i] = atoi(extracted_text);
                extracted_text = strtok(NULL, ",");
        }
        free(mod_copy_speeds_line);
        return *config;
}


Config ReadConfig(const char* filename) {
        Config config;
        char speeds_line[256];
        ReadConfigFile(filename, &config, speeds_line);
        return LoadConfig(&config, speeds_line);
}

//INICJALIZUJE OKNO NCURSES I KOLORY GRY
WINDOW* Start()
{
        WINDOW* win;
        if ( (win = initscr()) == NULL ) {
                fprintf(stderr, "Error initialising ncurses.\n");
                exit(EXIT_FAILURE);
            }

        start_color();
        init_pair(MAIN_COLOR, COLOR_WHITE, COLOR_BLACK);
        init_pair(PLAY_COLOR, COLOR_BLUE, COLOR_WHITE);
        init_pair(STAT_COLOR, COLOR_WHITE, COLOR_BLACK);
        init_pair(CATN_COLOR, COLOR_GREEN, COLOR_WHITE);
        init_pair(CATR_COLOR, COLOR_GREEN, COLOR_BLACK);
        init_pair(Frog_COLOR, COLOR_BLACK, COLOR_WHITE);
        init_pair(FRCAR_COLOR, COLOR_BLUE, COLOR_WHITE);
    init_pair(FINISH_COLOR, COLOR_BLACK, COLOR_GREEN);

        noecho();
        curs_set(0);
        return win;
}

//WYSWIETLA EKRAN POWITALNY I ZASADY GRY
void Welcome(WINDOW* win)
{
          int ch;
        mvwaddstr(win, 1, 1, "- Jumping Frog -");
        mvwaddstr(win, 2, 1, "Press 's' key to start. To exit while in the game: press 'k'.");
        wattron(win, A_BOLD);
        mvwaddstr(win, 5, 1, "--- RULES ---");
        wattroff(win, A_BOLD);
        mvwaddstr(win, 8, 1, "Some cars stop the movement when the frog is close to them, and some are disappearing when reaching the border (new random cars are placed on the street).");
        mvwaddstr(win, 9, 1, "There are friendly blue cars that, when you press 'g' while nearby, can transport you closer to the finish line!");
        mvwaddstr(win, 10, 1, "For every second in the game, you receive: 1 point.");
        mvwaddstr(win, 11, 1, "If you're lucky enough, you get a reward for reaching the other side of the street (green finish line): + ([YOUR_TIME] * 3) points.");
        mvwaddstr(win, 12, 1, "If you quit the game / don't make it before the end of time / there is a collision with a car OR an obstacle: 0 points in total.");
        do {
                ch = wgetch(win);
        } while (ch != 's');

        wclear(win);
        wrefresh(win);
}

void DrawGreenFinishLine(WIN* playwin) {
        wattron(playwin->window, COLOR_PAIR(FINISH_COLOR));
        for (int x = 0; x < playwin->cols; x++) {
                mvwprintw(playwin->window, 0, x, " ");
        }
        wattroff(playwin->window, COLOR_PAIR(FINISH_COLOR));
        wrefresh(playwin->window);
}

void DrawLineUnderEachCar(WIN* playwin, OBJ* car, OBJ* frog) {
        wattron(playwin->window, COLOR_PAIR(Frog_COLOR));
        for (int x = 0; x < playwin->cols; x++) {
                if (!(frog->y == car->y + car->height && x >= frog->x && x < frog->x + frog->width)) {
                        mvwprintw(playwin->window, car->y + car->height, x, "-");
                }
        }
        wattroff(playwin->window, COLOR_PAIR(Frog_COLOR));
        wrefresh(playwin->window);
}

void CleanWin(WIN* W, int bo)
{
        int i, j;
        wattron(W->window, COLOR_PAIR(W->color));
        if (bo) box(W->window, 0, 0);
        for (i = bo; i < W->rows - bo; i++)
                for (j = bo; j < W->cols - bo; j++)
                        mvwprintw(W->window, i, j, " ");
}

//TWORZY I INICJALIZUJE OKNO DLA OBSZARU GRY
WIN* Init(WINDOW* parent, int rows, int cols, int y, int x, int color, int bo, int delay)
{

        WIN* W = (WIN*)malloc(sizeof(WIN));
        W->x = x; W->y = y; W->rows = rows; W->cols = cols; W->color = color;
        W->window = subwin(parent, rows, cols, y, x);
        CleanWin(W, bo);
        if (delay == DELAY_OFF)  nodelay(W->window,TRUE);
        wrefresh(W->window);
        return W;
}

//WYSWIETLA KOMUNIKAT O ZAKONCZENIU GRY WRAZ Z PUNKTAMI I LICZNIKIEM CZASU
void EndGame(const char* info, WIN* W, int points)
{
        CleanWin(W,1);
        for(int i = QUIT_TIME; i > 0; i--) {
                mvwprintw(W->window,1,2,"%s You scored %d points. Closing the game in %d seconds...",info,points,i);
                wrefresh(W->window);
                sleep(1);
        }
}

//WYSWIETLA AKTUALNY STAN GRY (PUNKTY, POZYCJE ZABY..)
void ShowStatus(WIN* W, OBJ* o, int pts, TIMER* timer)
{
        mvwprintw(W->window, 1, 35, "Points: %d", pts);
        mvwprintw(W->window, 1, 55, "x: %d  y: %d  ", o->x, o->y);
        mvwprintw(W->window, 1, 75, "%s", "Aleksander Klos");
        wrefresh(W->window);
}

//WYSWIETLA AKTUALNY LICZNIK CZASU
void ShowTimer(WIN* W, TIMER* timer) {
        mvwprintw(W->window, 1, 15, "                 ");
        mvwprintw(W->window, 1, 15, "Time: %.2f", timer->pass_time);
        wrefresh(W->window);
}

void Print(OBJ* ob)
{
        for(int i = 0; i < ob->height; i++){
                mvwprintw(ob->win->window, ob->y+i, ob->x, "%s", ob->shape[i]);
        }
}

//AKTUALIZUJE POZYCJE OBIEKTU
void Show(OBJ* ob, int dx, int dy) {
        if (!ob->visible) return;

        char *sw = (char*)malloc(sizeof(char) * (ob->width + 1));
        memset(sw, ' ', ob->width);
        sw[ob->width] = '\0';

        if (ob->bflag) wattron(ob->win->window, COLOR_PAIR(ob->color));
        else wattron(ob->win->window, COLOR_PAIR(ob->revcol));

        for (int i = 0; i < ob->height; i++) {
                mvwprintw(ob->win->window, ob->y + i, ob->x, "%s", sw);
        }

        if ((dy == 1) && (ob->y + ob->height < ob->ymax)) {
                ob->y += dy;
        }
        if ((dy == -1) && (ob->y > ob->ymin)) {
                ob->y += dy;
        }
        if ((dx == 1) && (ob->x + ob->width < ob->xmax)) {
                ob->x += dx;
        }
        if ((dx == -1) && (ob->x > ob->xmin)) {
                ob->x += dx;
        }

        for (int i = 0; i < ob->height; i++) {
                mvwprintw(ob->win->window, ob->y + i, ob->x, "%s", ob->shape[i]);
        }

        if (ob->bflag) wattron(ob->win->window, COLOR_PAIR(ob->win->color));
        wrefresh(ob->win->window);

        free(sw);
}

//INICJALIZUJE STATYCZNA PRZESZKODE
OBJ* InitStaticObstacle(WIN* w, int x, int y, int width, int height) {
        OBJ* ob = (OBJ*)malloc(sizeof(OBJ));
        ob->win = w;
        ob->width = width;
        ob->height = height;
        ob->x = x;
        ob->y = y;
        ob->color =Frog_COLOR;

        ob->shape = (char**)malloc(sizeof(char*) * ob->height);
        for (int i = 0; i < ob->height; i++) {
                ob->shape[i] = (char*)malloc(sizeof(char) * (ob->width + 1));
                memset(ob->shape[i], '#', ob->width);
                ob->shape[i][ob->width] = '\0';
        }

        Print(ob);
        return ob;
}

//TWORZY/STAWIA ZESTAW PRZESZKOD NA DRODZE
OBJ** InitializeObstacles(WIN* playwin, int lane_step, int num_lanes) {
        OBJ** obstacles = (OBJ**)malloc((num_lanes - 1) * sizeof(OBJ*));
        if (!obstacles) {
                fprintf(stderr, "Memory allocation failed for obstacles.\n");
                exit(EXIT_FAILURE);
        }

        for (int i = 0; i < num_lanes - 1; i++) {
                int y_position = (i + 1) * lane_step;
                int x_position = RA(5, playwin->cols - 10);
                int width = RA(2, 5);
                obstacles[i] = InitStaticObstacle(playwin, x_position, y_position, width, 1);
        }

        return obstacles;
}

//USTAWIA POZYCJE POCZATKOWA OBIEKTU
void InitPos(OBJ* ob, int xs, int ys)
{
        ob->x      = xs;
        ob->y      = ys;
}

//INICJALIZUJE ZABE Z JEJ KSZTALTEM I POZYCJA
OBJ* InitJumpingFrog(WIN* w, int col, int rev, int frog_width, int frog_height) {
        OBJ* ob = (OBJ*)malloc(sizeof(OBJ));
        ob->bflag = 1;
        ob->revcol = rev;
        ob->color = col;
        ob->win = w;
        ob->width = frog_width;
        ob->height = frog_height;
        ob->mv = 0;
        ob->visible = 1;

        ob->shape = (char**)malloc(sizeof(char*) * ob->height);
        for (int i = 0; i < ob->height; i++) {
                ob->shape[i] = (char*)malloc(sizeof(char) * (ob->width + 1));
        }

        strcpy(ob->shape[0], " 'O' ");

        InitPos(ob, (ob->win->cols - ob->width) / 2, ob->win->rows - ob->height - 1);
        ob->xmin = 1;
        ob->xmax = w->cols - 1;
        ob->ymin = 1;
        ob->ymax = w->rows - 1;
        return ob;
}

//INICJALIZUJE SAMOCHOD Z JEGO KSZTALTEM I POZYCJA
OBJ* InitCar(WIN* w, int col, int lane, int car_speed, int car_height, int car_width, int is_friendly) {
        OBJ* ob = (OBJ*)malloc(sizeof(OBJ));
        ob->bflag = 1;
        ob->color = is_friendly ? FRCAR_COLOR : col;
        ob->win = w;
        ob->width = car_width;
        ob->height = car_height;
        ob->mv = car_speed;
        ob->is_friendly = is_friendly;
        ob->visible = 1;

        ob->shape = (char**)malloc(sizeof(char*) * ob->height);
        for (int i = 0; i < ob->height; i++) {
                ob->shape[i] = (char*)malloc(sizeof(char) * (ob->width + 1));
        }

        if (is_friendly) {
                strcpy(ob->shape[0], " ___ ");
                strcpy(ob->shape[1], " o o ");
        } else {
                strcpy(ob->shape[0], "  ___  ");
                strcpy(ob->shape[1], " o _ o ");
        }

        InitPos(ob, RA(1, w->cols - ob->width), lane);
        ob->xmin = 1;
        ob->xmax = w->cols - 1;
        ob->ymin = 1;
        ob->ymax = w->rows - 1;
        return ob;
}


void MoveJumpingFrog(OBJ* ob, char ch, unsigned int frame)
{
        if (frame - ob->mv >= MVC_FACTOR)
        {
                switch( ch ) {
                        case 'w': Show(ob,0,-1);        break;
                        case 's': Show(ob,0,1);  break;
                        case 'a': Show(ob,-1,0);        break;
                        case 'd': Show(ob,1,0);         break;
                        case 'q': Show(ob,-1,-1);       break;
                        case 'e': Show(ob, 1,-1);       break;
                        case 'z': Show(ob,-1,1);        break;
                        case 'c': Show(ob,1,1);
                }
                ob->mv = frame;
        }
}

void UpdateCarVisibility(OBJ** cars, int num_cars, unsigned int frame) {
        for (int i = 0; i < num_cars; i++) {
                if (!cars[i]->visible) {
                        if (frame % (FRAME_TIME * 4) == 0) {
                                cars[i]->x = RA(cars[i]->xmin, cars[i]->xmax - cars[i]->width);
                                cars[i]->visible = 1;
                        }
                }
        }

        int visible_count = CountVisibleCars(cars, num_cars);
        for (int i = 0; i < num_cars && visible_count < 5; i++) {
                if (!cars[i]->visible) {
                        cars[i]->x = RA(cars[i]->xmin, cars[i]->xmax - cars[i]->width);
                        cars[i]->visible = 1;
                        visible_count++;
                }
        }
}



int Collision(OBJ* frog, OBJ** cars, int num_cars, OBJ* car, int* teleport_flag) {
        if (frog->y + frog->height > car->y && frog->y < car->y + car->height &&
                frog->x + frog->width > car->x && frog->x < car->x + car->width) {
                if (car->is_friendly) {
                        if (*teleport_flag) {
                                frog->y = 2;
                                *teleport_flag = 0;
                        }
                        return 2;
                } else {
                        return 1;
                }
                }
        return 0;
}

//CZYSCI WIDOCZNA REPREZENTACJE AUTA I AKTUALIZUJE POD NIM LINIE
void ClearCarPosition(OBJ* car, OBJ* frog) {
        wattron(car->win->window, COLOR_PAIR(Frog_COLOR));
        for (int i = 0; i < car->height; i++) {
                mvwprintw(car->win->window, car->y + i, car->x, "                   ");
        }
        wattroff(car->win->window, COLOR_PAIR(Frog_COLOR));
        DrawLineUnderEachCar(car->win, car, frog);
}

//PRZESUWA AUTO W LEWO/PRAWO/RESETUJE POZYCJE
void UpdateCarMovement(OBJ* car, int dir) {
        if (dir == 1 && car->x + car->width < car->xmax) {
                car->x += 1;
        } else if (dir == -1 && car->x > car->xmin) {
                car->x -= 1;
        } else {
                if (rand() % 2 == 1) {
                        car->visible = 0;
                } else {
                        car->x = (dir == 1) ? car->xmin : car->xmax - car->width;
                }
        }
}

void MoveCarPosition(OBJ* car, int dir, unsigned int frame, OBJ* frog) {
        int space = 5;
        if (abs(frog->y - car->y) <= space &&
                abs(frog->x - car->x) <= space) {
                return;
                }
        if (frame % (FRAME_TIME / car->mv) != 0) {
                return;
        }
        ClearCarPosition(car, frog);
        UpdateCarMovement(car, dir);
        RedrawACar(car, frog);
}


void RedrawACar(OBJ* car, OBJ* frog) {
        if (car->visible) {
                wattron(car->win->window, COLOR_PAIR(car->color));
                for (int i = 0; i < car->height; i++) {
                        mvwprintw(car->win->window, car->y + i, car->x, "%s", car->shape[i]);
                }
                wattroff(car->win->window, COLOR_PAIR(car->color));
        }
        DrawLineUnderEachCar(car->win, car, frog);
        wrefresh(car->win->window);
}

void MoveCar(OBJ* car, int dir, unsigned int frame, OBJ* frog, int* teleport_flag) {
        if (!car->visible) {
                return;
        }
        MoveCarPosition(car, dir, frame, frog);
}


void Restart(OBJ* catcher, OBJ* Frog)
{
        ChangeColors(catcher); ChangeColors(Frog); Show(catcher,0,0); Show(Frog,0,0);
        sleep(BET_TIME);
        CleanWin(catcher->win,1);
        InitPos(catcher,(catcher->win->cols - catcher->width) / 2,(catcher->win->rows - catcher->height)/ 2);
        InitPos(Frog,Frog->xmin,Frog->ymin);
        ChangeColors(catcher); ChangeColors(Frog); Show(catcher,0,0); Show(Frog,0,0);
}


void Sleep(unsigned int tui) { usleep(tui * 1000); }

TIMER* InitTimer(WIN* status, int time_limit) {
        TIMER* timer = (TIMER*)malloc(sizeof(TIMER));
        if (!timer) {
                fprintf(stderr, "Memory allocation failed for TIMER.\n");
                exit(EXIT_FAILURE);
        }
        timer->frame_no = 1;
        timer->frame_time = FRAME_TIME;
        timer->pass_time = time_limit;
        return timer;
}


int UpdateTimer(TIMER* T, WIN* status, int* points) {
        T->frame_no++;
        T->pass_time -= (T->frame_time / 1000.0);

        if (T->pass_time <= 0) {
                T->pass_time = 0;
                return 1;
        }

        if (T->frame_no % (2000 / T->frame_time) == 0) {
                *points += 1;
        }

        ShowTimer(status, T);
        Sleep(T->frame_time);
        return 0;
}

void UpdateCarSpeeds(OBJ** cars, int num_cars, unsigned int frame) {
        if (frame % 200 == 0) {
                for (int i = 0; i < num_cars; i++) {
                        cars[i]->mv = RA(2, 6);
                }
        }
}

int CheckCollisionWithObstacles(OBJ* frog, OBJ** obstacles, int num_obstacles) {
        for (int i = 0; i < num_obstacles; i++) {
                OBJ* ob = obstacles[i];

                if ((frog->y + frog->height > ob->y && frog->y < ob->y + ob->height) &&
                        (frog->x + frog->width > ob->x && frog->x < ob->x + ob->width)) {
                        return 1;
                        }
        }
        return 0;
}

//PRZETWARZA DANE WEJSCIOWE GRACZA / OBSLUGUJE TELEPORTACJE (FRIENDLY CARS)
int HandleInput(WIN* status, OBJ* frog, TIMER* timer, int* teleport_flag) {
    int ch = wgetch(status->window);
    if (ch != ERR) {
        if (ch == QUIT) {
            return -1;
        }
        if (ch == 'g') {
            *teleport_flag = 1;
        }
        MoveJumpingFrog(frog, ch, timer->frame_no);
    }
    return 0;
}

//ZARZADZA RUCHEM AUTA, WIDOCZNOSCIA I WYKRYWANIEM KOLIZJI Z ZABA
int HandleCarMovements(OBJ* frog, OBJ* cars[], int num_cars, unsigned int frame_no, int* teleport_flag, WIN* status, int* pts) {
        UpdateCarVisibility(cars, num_cars, frame_no);
        for (int i = 0; i < num_cars; i++) {
                MoveCar(cars[i], (i % 2 == 0 ? 1 : -1), frame_no, frog, teleport_flag);
                int collision = Collision(frog, cars, num_cars, cars[i], teleport_flag);
                if (collision == 1) {
                        *pts = 0;
                        EndGame("Collision detected! Game over.", status, *pts);
                        return 1;
                }
        }
        return 0;
}


//ZARZADZA WYKRYWANIEM KOLIZJI MIEDZY ZABA A PRZESZKODAMI NA DRODZE
int HandleObstacles(OBJ* frog, OBJ* obstacles[], int num_obstacles, WIN* status, int* pts) {
    if (CheckCollisionWithObstacles(frog, obstacles, num_obstacles)) {
        *pts = 0;
        EndGame("Collision with obstacle! Game over.", status, *pts);
        return 1;
    }
    return 0;
}

//SPRAWDZA, CZY ZABA DOTARLA DO CELU / OBLICZA WYNIK KONCOWY GRACZA
int HandleGoal(OBJ* frog, TIMER* timer, WIN* status, int* pts) {
    if (frog->y <= frog->ymin) {
        *pts += (timer->pass_time) * 3;
        EndGame("Wow, you've reached the goal!", status, *pts);
        return 1;
    }
    return 0;
}

//AKTUALIZUJE LICZNIK CZASU / OBSLUGUJE WARUNKI PRZEKROCZENIA LIMITU CZASU
int HandleTimer(TIMER* timer, WIN* status, int* pts) {
    if (UpdateTimer(timer, status, pts)) {
        *pts = 0;
        EndGame("Time's up! Game over.", status, *pts);
        return 1;
    }
    return 0;
}

void UpdateStatus(WIN* status, OBJ* frog, int pts, TIMER* timer) {
    ShowStatus(status, frog, pts, timer);
}

//PRZETWARZA POJEDYNCZA KLATKE GRY
int LoadFrame(WIN* status, OBJ* frog, OBJ* cars[], int num_cars, OBJ* obstacles[], int num_obstacles, TIMER* timer, int* pts) {
    static int teleport_flag = 0;
    if (HandleInput(status, frog, timer, &teleport_flag) == -1) {
        *pts = 0;
        EndGame("You've decided to quit the game.", status, *pts);
        return 0;
    }
    UpdateCarSpeeds(cars, num_cars, timer->frame_no);


    if (HandleCarMovements(frog, cars, num_cars, timer->frame_no, &teleport_flag, status, pts)) {
        return 0;
    }
    if (HandleObstacles(frog, obstacles, num_obstacles, status, pts)) {
        return 0;
    }
    if (HandleGoal(frog, timer, status, pts)) {
        return 0;
    }
    if (HandleTimer(timer, status, pts)) {
        return 0;
    }
    UpdateStatus(status, frog, *pts, timer);
    return 1;
}

int MainLoop(WIN* status, OBJ* frog, OBJ* cars[], int num_cars, OBJ* obstacles[], int num_obstacles, TIMER* timer) {
        int pts = 0;
        while (1) {
                if (!LoadFrame(status, frog, cars, num_cars, obstacles, num_obstacles, timer, &pts)) {
                        break;
                }
        }
        return pts;
}


void ReadAndValidateConfig(Config* config) {
        *config = ReadConfig("config.txt");
        if (config->num_cars <= 0 || config->rows <= 0 || config->cols <= 0) {
                fprintf(stderr, "Invalid configuration values.\n");
                exit(EXIT_FAILURE);
        }
}

void InitializeWindows(WINDOW** mainwin, WIN** playwin, WIN** statwin, Config* config) {
        *mainwin = Start();
        Welcome(*mainwin);
        *playwin = Init(*mainwin, config->rows, config->cols, OFFY, OFFX, PLAY_COLOR, 0, DELAY_ON);
        DrawGreenFinishLine(*playwin);
        *statwin = Init(*mainwin, 3, config->cols, config->rows + OFFY, OFFX, STAT_COLOR, BORDER, DELAY_OFF);
}


int* InitializeFriendlyFlags(int num_cars, int num_friendly_cars) {
        int* friendly_flags = (int*)calloc(num_cars, sizeof(int));
        if (!friendly_flags) {
                fprintf(stderr, "Memory allocation failed for friendly_flags.\n");
                exit(EXIT_FAILURE);
        }

        int friendly_count = 0;
        while (friendly_count < num_friendly_cars) {
                int random_index = RA(0, num_cars - 1);
                if (!friendly_flags[random_index]) {
                        friendly_flags[random_index] = 1;
                        friendly_count++;
                }
        }

        return friendly_flags;
}

OBJ** InitializeCars(WIN* playwin, Config* config) {
        OBJ** cars = (OBJ**)malloc(config->num_cars * sizeof(OBJ*));
        if (!cars) {
                fprintf(stderr, "Memory allocation failed for cars.\n");
                exit(EXIT_FAILURE);
        }

        int lane_step = (config->rows - config->car_height) / config->num_cars;

        int* friendly_flags = InitializeFriendlyFlags(config->num_cars, config->num_friendly_cars);

        for (int i = 0; i < config->num_cars; i++) {
                int lane = i * lane_step + 1;
                cars[i] = InitCar(playwin, Frog_COLOR, lane, config->car_speeds[i], config->car_height, config->car_width, friendly_flags[i]);
        }

        free(friendly_flags);
        return cars;
}

int CountVisibleCars(OBJ** cars, int num_cars) {
        int visible_count = 0;
        for (int i = 0; i < num_cars; i++) {
                if (cars[i]->visible) {
                        visible_count++;
                }
        }
        return visible_count;
}


void InitializeGame(Config* config, WINDOW** mainwin, WIN** playwin, WIN** statwin, OBJ*** cars, OBJ** frog, TIMER** timer) {
        ReadAndValidateConfig(config);
        InitializeWindows(mainwin, playwin, statwin, config);
        *timer = InitTimer(*statwin, config->time_limit);
        *frog = InitJumpingFrog(*playwin, CATN_COLOR, CATR_COLOR, config->frog_width, config->frog_height);
        *cars = InitializeCars(*playwin, config);
}


void CleanupGame(WIN* playwin, WIN* statwin, WINDOW* mainwin, OBJ** cars, int num_cars, OBJ* frog, TIMER* timer, Config* config) {
        for (int i = 0; i < num_cars; i++) {
                for (int j = 0; j < cars[i]->height; j++) {
                        free(cars[i]->shape[j]);
                }
                free(cars[i]->shape);
                free(cars[i]);
        }
        free(cars);

        for (int j = 0; j < frog->height; j++) {
                free(frog->shape[j]);
        }
        free(frog->shape);
        free(frog);

        free(timer);
        free(config->car_speeds);

        delwin(playwin->window);
        delwin(statwin->window);
        delwin(mainwin);
        endwin();
        refresh();
}


int InitializeAndStartGame(Config* config, WINDOW** mainwin, WIN** playwin, WIN** statwin, OBJ*** cars, OBJ** frog, TIMER** timer, OBJ*** obstacles) {
        InitializeGame(config, mainwin, playwin, statwin, cars, frog, timer);

        int lane_step = (config->rows - config->car_height) / config->num_cars;
        int num_lanes = config->num_cars;

        *obstacles = InitializeObstacles(*playwin, lane_step, num_lanes);
        Show(*frog, 0, 0);
        wrefresh((*playwin)->window);

        for (int i = 0; i < config->num_cars; i++) {
                Show((*cars)[i], 0, 0);
                wrefresh((*playwin)->window);
        }

        int points = MainLoop(*statwin, *frog, *cars, config->num_cars, *obstacles, num_lanes - 1, *timer);
        return points;
}

int main() {
        Config config;
        WINDOW* mainwin;
        WIN* playwin;
        WIN* statwin;
        OBJ** cars;
        OBJ* frog;
        TIMER* timer;
        OBJ** obstacles;

        int points = InitializeAndStartGame(&config, &mainwin, &playwin, &statwin, &cars, &frog, &timer, &obstacles);

        CleanupGame(playwin, statwin, mainwin, cars, config.num_cars, frog, timer, &config);

        for (int i = 0; i < config.num_cars - 1; i++) {
                for (int j = 0; j < obstacles[i]->height; j++) {
                        free(obstacles[i]->shape[j]);
                }
                free(obstacles[i]->shape);
                free(obstacles[i]);
        }
        free(obstacles);

        return EXIT_SUCCESS;
}