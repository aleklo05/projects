'''
A Python console-based Student Grade Tracker that lets you add students,
assign multiple grades per subject, update grades, calculate averages, and find the top student.
It uses nested dictionaries and lists to store structured data,
with options to extend it using JSON for saving and loading between program runs.

'''


import json

students = {}

def add_student():
    name = input("Enter student name: ")
    
    # If the student doesn't exist yet, create an empty dict

    if name in students:
        print("This student already exists!")
        return
        
    elif name not in students:
        students[name] = {}

    print(f"Student {name} added!")

    print(students)

def add_grade():
    name = input("Enter student name: ")
    if name not in students:
        print(f"{name} is not in our database!")
        return
    
    subject = input("Enter subject: ")
    if subject not in students[name]:
        students[name][subject] = [] 
    
    try:
        grade = int(input("Enter grade (0 - 100): "))
        if not (0 <= grade <= 100):
            print("Grade must be between 0 and 100.")
            return
    except ValueError:
        print("Invalid grade! Please enter a number.")
        return


    students[name][subject].append(grade)
    print(f"New grade for student {name} added!")
    print(students)
    

def update_grade():
    name = input("Enter student name: ")
    if name not in students:
        print(f"{name} is not in our database!")
        return
    
    subject = input("Enter subject to update: ")
    if subject not in students[name]:
        print(f"{name} has no grade for {subject} yet.")
        return
    
    grades = students[name][subject]
    print(f"Current grades for {name} in {subject}:")
    for i, g in enumerate(grades, start=1):
        print(f"{i}. {g}")
        
    try:
        index = int(input("Which grade do you want to update? (number): ")) - 1
        if not (0 <= index < len(grades)):
            print("Invalid choice.")
            return
        new_grade = int(input("Enter new grade (0 - 100): "))
        if not (0 <= new_grade <= 100):
            print("Grade must be between 0 and 100.")
            return
    except ValueError:
        print("Invalid input!")
        return

    grades[index] = new_grade
    print(f"{name}'s grade for {subject} has been updated!")
    print(students)

def calculate_average():
    name = input("Enter student name: ")
    
    if name not in students:
        print(f"{name} is not in our database!")
        return
    
    all_grades = []

    for subject, grades in students[name].items():
        all_grades.extend(grades) # <- adding all grades to the list

    if not all_grades:                     
        print(f"{name} has no grades yet.")
        return
    
    average = sum(all_grades) / len(all_grades)
    
    print(f"{name}'s average grade is {average:.2f}")



def find_top_student():
    highest_average = 0
    top_student = None

    for name, subjects in students.items():
        all_grades = []
        for subject, grades in subjects.items():
            all_grades.extend(grades)

        if all_grades:  # <- only if a student has any grades
            tmp_average = sum(all_grades) / len(all_grades)
            if tmp_average > highest_average:
                highest_average = tmp_average
                top_student = name

    if top_student:
        print(f"The top student is {top_student} with an average equal to {highest_average:.2f}")
    else:
        print("No students with grades yet.")

def all_students():
    if not students:
        print("No students in our database yet!")
        return
    for i, (student, subjects) in enumerate(students.items(), start=1):
        print(f"{i}. {student}")  # name
        for subject, grades in subjects.items():
            print(f"   {subject}: {', '.join(str(grade) for grade in grades)}")




def save_data(filename="students.json"):
    with open(filename, "w") as file:
        json.dump(students, file, indent=4)
    print("Data saved successfully!")

def load_data(filename="students.json"):
    global students
    try:
        with open(filename, "r") as file:
            students = json.load(file)
        print("Data loaded successfully!")
    except FileNotFoundError:
        print("No saved data found.")


def main():
    while True:
        print("""
Choose an option:
1. Add Student
2. Add grade
3. Update Grade
4. Calculate Student Average
5. Find Top Student
6. See all students
7. Save Data
8. Load Data
9. Exit
""")

        choice = input("Enter your choice: ")

        if choice == "1":
            add_student()
        elif choice == "2":
            add_grade()
        elif choice == "3":
            update_grade()
        elif choice == "4":
            calculate_average()
        elif choice == "5":
            find_top_student()
        elif choice == "6":
            all_students()
        elif choice == "7":
            save_data()
        elif choice == "8":
            load_data()
        elif choice == "9":
            print("Goodbye!")
            break
        else:
            print("Invalid option, try again.")
        
        

main()
