package org.example;

import java.util.ArrayList;
import java.util.List;

public class InMemoryTaskManager implements TaskManager {
    private List<Task> tasks = new ArrayList<>();
    private int nextId = 1;

    @Override
    public void addTask(String title, String description){
        Task newTask = new Task(nextId, title, description);

        tasks.add(newTask);

        nextId++;

        System.out.println("Dodano zadanie: " + title);
    }

    @Override
    public List<Task> getAllTasks(){
        return tasks;
    }

    @Override
    public void removeTask(int id) {
        boolean isRemoved = tasks.removeIf(task -> task.getId() == id);

        if (isRemoved) {
            System.out.println("Usunieto zadanie o ID: " + id);
        } else {
            System.out.println("Nie znaleziono zadania o ID: " + id);
        }
    }

    @Override
    public void updateTaskStatus(int id, Task.TaskStatus status) {
        for (Task task : tasks) {
            if (task.getId() == id) {
                task.setStatus(status);
                System.out.println("Zmieniono status zadania [" + id + "] na: " + status);
                return;
            }
        }

        System.out.println("Nie znaleziono zadania o ID: " + id);
    }

    @Override
    public List<Task> getTasksByStatus(Task.TaskStatus status) {
        return tasks.stream()
                .filter(task -> task.getStatus() == status)
                .toList();
    }


}
