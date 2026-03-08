package org.example;
import java.util.List;

public interface TaskManager {
    void addTask(String title, String description);

    void removeTask(int id);

    void updateTaskStatus(int id, Task.TaskStatus status);

    List<Task> getAllTasks();

    List<Task> getTasksByStatus(Task.TaskStatus status);


}
