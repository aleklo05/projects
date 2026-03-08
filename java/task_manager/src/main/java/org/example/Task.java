package org.example;
import java.time.LocalDateTime;

public class Task {
    private int id;
    private String title;
    private String description;
    private TaskStatus status;
    private LocalDateTime createdAt;


    // Typ wyliczeniowy dla statusu
    public enum TaskStatus{
        NEW,
        IN_PROGRESS,
        DONE
    }

    // Konstruktor
    public Task(int id, String title, String description){
        this.id = id;
        this.title = title;
        this.description = description;
        this.status = TaskStatus.NEW;
        this.createdAt = LocalDateTime.now();
    }

    // Gettery i settery
    public int getId (){
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public TaskStatus getStatus() {
        return status;
    }

    public void setStatus(TaskStatus status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }


    @Override
    public String toString() {
        return String.format("[%d] %s (Status: %s) - Utworzono: %s\nOpis: %s\n",
                id, title, status, createdAt, description);
    }

}
