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

    
def main():
    while True:
        print("""
Choose an option:
1. Add Student
2. Add grade
3. Update Grade
4. Calculate Student Average
5. Find Top Student
6. Save Data
7. Load Data
8. Exit
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
        elif choice == "8":
            print("Goodbye!")
            break
        else:
            print("Invalid option, try again.")
        
        

main()
