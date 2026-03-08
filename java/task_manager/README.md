# Console Task Manager

**Work in Progress (WIP)**
*This project is currently under active development. Some features are implemented, but the application is not yet complete.*

## About the Project
A console-based task management application written in Java. This project serves as an intermediate-level exercise to practice Object-Oriented Programming (OOP), collection management, Java 8+ features (Streams, Lambdas), and file I/O operations.

## Tech Stack
* **Language:** Java (17+)
* **Concepts:** OOP, Interfaces, Enums, Streams, Encapsulation

## Features

### Currently Implemented
* **Domain Model:** Encapsulated `Task` class with automatic ID generation and timestamping (`LocalDateTime`).
* **Status Management:** Defined states using Enums (`NEW`, `IN_PROGRESS`, `DONE`).
* **Core Logic:** `TaskManager` interface implemented via `InMemoryTaskManager`.
* **In-Memory Operations:** * Adding new tasks
  * Removing tasks by ID
  * Updating task statuses
  * Fetching all tasks
  * Filtering tasks by status using Java Stream API

### Planned / Coming Soon
* **Interactive CLI:** A console menu allowing users to interact with the app via keyboard input.
* **Data Persistence:** Saving and loading tasks from a local file (e.g., `.csv` or `.txt`) so data isn't lost between sessions.
* **Error Handling:** Custom exceptions (e.g., `TaskNotFoundException`) and input validation.

## How to Run
*(Instructions will be added once the Command Line Interface is fully implemented.)*