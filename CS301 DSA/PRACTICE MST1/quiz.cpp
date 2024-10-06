#include <iostream>
#include <fstream>
#include <cstring>
#include <bits/stdc++.h>

using namespace std;

#define SIZE 100

// Structure to represent a subject
struct Subject {
    string subjectCode;
    string subjectTitle;
    int maxSessionalMarks;
    int maxTheoryMarks;
    int marksAwardedSessional;
    int marksAwardedTheory;
    Subject* next;
};

// Structure to represent a student's record
struct StudentRecord {
    string enrollmentNumber;
    string studentName;
    string fatherName;
    string dateOfBirth;
    string semesterAndYear;
    string scheme;
    Subject* subjects;
    StudentRecord* next;
    StudentRecord* prev;
};

// Structure to represent a scheme
struct Scheme {
    string schemeCode;
    string schemeName;
    Subject* subjects;
};
void sana_getline(char* input, int size) {
    int i = 0;
    
    char ch;
    while (i < size - 1) {
        ch = getchar();
        if (ch == '\n') {
            break;
        }
        input[i++] = ch;
    }
    input[i] = '\0';
}
// Utility functions
bool isDigit(char ch) {
    return (ch >= '0' && ch <= '9');
}
bool isValidString(const char* str) {
    for (int i = 0; str[i] != '\0'; i++) {
        char ch = str[i];
        if (!((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || ch == '.' || ch == ' ')) {
            return false;
        }
    }
    return true;
}


bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

bool isValidDate(const char* date) {
    if (strlen(date) != 10) return false;
    if (date[2] != '/' || date[5] != '/') return false;

    int day = (date[0] - '0') * 10 + (date[1] - '0');
    int month = (date[3] - '0') * 10 + (date[4] - '0');
    int year = (date[6] - '0') * 1000 + (date[7] - '0') * 100 + (date[8] - '0') * 10 + (date[9] - '0');

    if (year < 1900 || year > 2100) return false;

    bool leap = isLeapYear(year);

    if (month < 1 || month > 12) return false;
    if (day < 1 || day > 31) return false;
    if (month == 2) {
        if (leap && day > 29) return false;
        if (!leap && day > 28) return false;
    }
    if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30) return false;

    return true;
}


// Function to add a scheme to the database
void addScheme() {
    Scheme scheme;
    cout << "Enter scheme code: ";
    cin >> scheme.schemeCode;
    cout << "Enter scheme name: ";
    cin.ignore();
    getline(cin, scheme.schemeName);

    int numSubjects;
    cout << "Enter number of subjects: ";
    cin >> numSubjects;

    Subject* head = nullptr;
    Subject* tail = nullptr;

    for (int i = 0; i < numSubjects; i++) {
        Subject* subject = new Subject;
        cout << "Enter subject code: ";
        cin >> subject->subjectCode;
        cout << "Enter subject title: ";
        cin.ignore();
        getline(cin, subject->subjectTitle);
        cout << "Enter maximum sessional marks: ";
        cin >> subject->maxSessionalMarks;
        cout << "Enter maximum theory marks: ";
        cin >> subject->maxTheoryMarks;
        subject->next = nullptr;

        if (head == nullptr) {
            head = tail = subject;
        } else {
            tail->next = subject;
            tail = subject;
        }
    }

    scheme.subjects = head;

    // Save scheme to file
    ofstream schemeFile("scheme.txt", ios::app);
    schemeFile << scheme.schemeCode << "," << scheme.schemeName << "," << numSubjects << endl;
    Subject* temp = scheme.subjects;
    while (temp != nullptr) {
        schemeFile << temp->subjectCode << "," << temp->subjectTitle << "," << temp->maxSessionalMarks << "," << temp->maxTheoryMarks << endl;
        temp = temp->next;
    }
    schemeFile.close();
}

// Function to delete a scheme from the database
void deleteScheme() {
    string schemeCode;
    cout << "Enter scheme code to delete: ";
    cin >> schemeCode;

    ifstream schemeFile("scheme.txt");
    ofstream tempFile("temp.txt");

    string line;
    while (getline(schemeFile, line)) {
        if (line.find(schemeCode) != 0) {
            tempFile << line << endl;
        } else {
            int numSubjects;
            schemeFile >> numSubjects;
            for (int i = 0; i < numSubjects; i++) {
                getline(schemeFile, line);
            }
        }
    }

    schemeFile.close();
    tempFile.close();

    remove("scheme.txt");
    rename("temp.txt", "scheme.txt");
}

// Function to update a scheme in the database
void updateScheme() {
    string schemeCode;
    cout << "Enter scheme code to update: ";
    cin >> schemeCode;

    ifstream schemeFile("scheme.txt");
    ofstream tempFile("temp.txt");

    string line;
    while (getline(schemeFile, line)) {
        if (line.find(schemeCode) != 0) {
            tempFile << line << endl;
        } else {
            int numSubjects;
            schemeFile >> numSubjects;

            Scheme scheme;
            scheme.schemeCode = schemeCode;
            cout << "Enter new scheme name: ";
            cin.ignore();
            getline(cin, scheme.schemeName);

            Subject* head = nullptr;
            Subject* tail = nullptr;

            for (int i = 0; i < numSubjects; i++) {
                Subject* subject = new Subject;
                cout << "Enter new subject code: ";
                cin >> subject->subjectCode;
                cout << "Enter new subject title: ";
                cin.ignore();
                getline(cin, subject->subjectTitle);
                cout << "Enter new maximum sessional marks: ";
                cin >> subject->maxSessionalMarks;
                cout << "Enter new maximum theory marks: ";
                cin >> subject->maxTheoryMarks;
                subject->next = nullptr;

                if (head == nullptr) {
                    head = tail = subject;
                } else {
                    tail->next = subject;
                    tail = subject;
                }
            }

            scheme.subjects = head;

            tempFile << scheme.schemeCode << "," << scheme.schemeName << "," << numSubjects << "," << numSubjects << endl;

            Subject* temp = scheme.subjects;

            while (temp != nullptr) {

                tempFile << temp->subjectCode << "," << temp->subjectTitle << "," << temp->maxSessionalMarks << "," << temp->maxTheoryMarks << endl;

                temp = temp->next;

            }

        }

    }


    schemeFile.close();

    tempFile.close();


    remove("scheme.txt");

    rename("temp.txt", "scheme.txt");

}


// Function to add a student record

void addStudentRecord(StudentRecord*& head, StudentRecord*& tail) {
    StudentRecord* student = new StudentRecord;

    cout << "Enter enrollment number: ";
    cin >> student->enrollmentNumber;

    // Validate student name
    do {
        cout << "Enter student name: ";
        cin.ignore();  // Clear the newline character from the input buffer
        getline(cin, student->studentName);

        if (!isValidString(student->studentName.c_str())) {
            cout << "Invalid name. Only letters, dots, and spaces are allowed." << endl;
        }
    } while (!isValidString(student->studentName.c_str()));

    // Validate father's name
    do {
        cout << "Enter father's name: ";
        getline(cin, student->fatherName);

        if (!isValidString(student->fatherName.c_str())) {
            cout << "Invalid name. Only letters, dots, and spaces are allowed." << endl;
        }
    } while (!isValidString(student->fatherName.c_str()));

    // Validate Date of Birth (DOB)
    do {
        cout << "Enter date of birth (DD/MM/YYYY): ";
        cin >> student->dateOfBirth;

        if (!isValidDate(student->dateOfBirth.c_str())) {
            cout << "Invalid date format or value. Please enter the date in DD/MM/YYYY format." << endl;
        }
    } while (!isValidDate(student->dateOfBirth.c_str()));

    cin.ignore();

    cout << "Enter semester and year: ";
    getline(cin,student->semesterAndYear);

    cout << "Enter scheme: ";
    cin >> student->scheme;

    int numSubjects;
    cout << "Enter number of subjects: ";
    cin >> numSubjects;

    Subject* headSubjects = nullptr;
    Subject* tailSubjects = nullptr;

    for (int i = 0; i < numSubjects; i++) {
        Subject* subject = new Subject;
        cout << "Enter subject code: ";
        cin >> subject->subjectCode;
        cout << "Enter subject title: ";
        cin.ignore();
        getline(cin, subject->subjectTitle);
        cout << "Enter maximum sessional marks: ";
        cin >> subject->maxSessionalMarks;
        cout << "Enter maximum theory marks: ";
        cin >> subject->maxTheoryMarks;
        cout << "Enter marks awarded in sessional: ";
        cin >> subject->marksAwardedSessional;
        cout << "Enter marks awarded in theory: ";
        cin >> subject->marksAwardedTheory;
        subject->next = nullptr;

        if (headSubjects == nullptr) {
            headSubjects = tailSubjects = subject;
        } else {
            tailSubjects->next = subject;
            tailSubjects = subject;
        }
    }

    student->subjects = headSubjects;

    if (head == nullptr) {
        head = tail = student;
    } else {
        tail->next = student;
        tail = student;
    }

    // Save student record to file
    ofstream studentFile("student.txt", ios::app);
    studentFile << student->enrollmentNumber << "," << student->studentName << "," << student->fatherName << "," << student->dateOfBirth << "," << student->semesterAndYear << "," << student->scheme << "," << numSubjects << endl;
    Subject* temp = student->subjects;
    while (temp != nullptr) {
        studentFile << temp->subjectCode << "," << temp->subjectTitle << "," << temp->maxSessionalMarks << "," << temp->maxTheoryMarks << "," << temp->marksAwardedSessional << "," << temp->marksAwardedTheory << endl;
        temp = temp->next;
    }
    studentFile.close();
}

// Function to print report card of a student

void printReportCard(StudentRecord* head) {

    string enrollmentNumber;

    cout << "Enter enrollment number: ";

    cin >> enrollmentNumber;


    StudentRecord* temp = head;

    while (temp != nullptr) {

        if (temp->enrollmentNumber == enrollmentNumber) {

            cout << "Report Card of " << temp->studentName << endl;

            cout << "Enrollment Number: " << temp->enrollmentNumber << endl;

            cout << "Father's Name: " << temp->fatherName << endl;

            cout << "Date of Birth: " << temp->dateOfBirth << endl;

            cout << "Semester and Year: " << temp->semesterAndYear << endl;

            cout << "Scheme: " << temp->scheme << endl;


            Subject* tempSubjects = temp->subjects;

            while (tempSubjects != nullptr) {

                cout << "Subject Code: " << tempSubjects->subjectCode << endl;

                cout << "Subject Title: " << tempSubjects->subjectTitle << endl;

                cout << "Maximum Sessional Marks: " << tempSubjects->maxSessionalMarks << endl;

                cout << "Maximum Theory Marks: " << tempSubjects->maxTheoryMarks << endl;

                cout << "Marks Awarded in Sessional: " << tempSubjects->marksAwardedSessional << endl;

                cout << "Marks Awarded in Theory: " << tempSubjects->marksAwardedTheory << endl;

                tempSubjects = tempSubjects->next;

            }


            return;

        }

        temp = temp->next;

       }

    cout << "Student record not found." << endl;
}

void printSemesterResults(StudentRecord* head, const string& semester) {
    StudentRecord* temp = head;
    bool found = false;
    
    while (temp != nullptr) {
        if (temp->semesterAndYear == semester) {
            cout << "Results for " << temp->studentName << " (" << temp->enrollmentNumber << "):" << endl;
            Subject* subTemp = temp->subjects;
            while (subTemp != nullptr) {
                cout << "Subject Code: " << subTemp->subjectCode << endl;
                cout << "Subject Title: " << subTemp->subjectTitle << endl;
                cout << "Sessional Marks: " << subTemp->marksAwardedSessional << "/" << subTemp->maxSessionalMarks << endl;
                cout << "Theory Marks: " << subTemp->marksAwardedTheory << "/" << subTemp->maxTheoryMarks << endl;
                subTemp = subTemp->next;
            }
            cout << "--------------------------" << endl;
            found = true;
        }
        temp = temp->next;
    }

    if (!found) {
        cout << "No results found for semester " << semester << "." << endl;
    }
}

// Function to print all student records sorted by name or enrollment number
void listAndSortRecords(StudentRecord* head, bool byName = true) {
    // Convert linked list to array
    StudentRecord* arr[SIZE];
    int count = 0;
    StudentRecord* temp = head;
    
    while (temp != nullptr && count < SIZE) {
        arr[count++] = temp;
        temp = temp->next;
    }
    
    // Bubble sort
    for (int i = 0; i < count - 1; i++) {
        for (int j = 0; j < count - i - 1; j++) {
            bool swap = false;
            if (byName) {
                if (arr[j]->studentName > arr[j + 1]->studentName) {
                    swap = true;
                }
            } else {
                if (arr[j]->enrollmentNumber > arr[j + 1]->enrollmentNumber) {
                    swap = true;
                }
            }
            if (swap) {
                StudentRecord* temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }

    // Print sorted list
    for (int i = 0; i < count; i++) {
        cout << "Enrollment Number: " << arr[i]->enrollmentNumber << endl;
        cout << "Student Name: " << arr[i]->studentName << endl;
        cout << "Father's Name: " << arr[i]->fatherName << endl;
        cout << "Date of Birth: " << arr[i]->dateOfBirth << endl;
        cout << "Semester and Year: " << arr[i]->semesterAndYear << endl;
        cout << "Scheme: " << arr[i]->scheme << endl;
        cout << "--------------------------" << endl;
    }
}
void measureMaxNodes() {
    const int increment = 10000; // Number of nodes to attempt adding each time
    int count = 0;
    try {
        while (true) {
            StudentRecord* head = nullptr;
            StudentRecord* tail = nullptr;

            for (int i = 0; i < increment; ++i) {
                StudentRecord* node = new StudentRecord;
                if (head == nullptr) {
                    head = tail = node;
                } else {
                    tail->next = node;
                    tail = node;
                }
            }

            count += increment;
            cout << "Successfully allocated " << count << " nodes." << endl;

            // Clean up
            StudentRecord* current = head;
            while (current != nullptr) {
                StudentRecord* next = current->next;
                delete current;
                current = next;
            }  
        }
    } catch (bad_alloc& e) {
        cout << "Failed to allocate more nodes. Maximum nodes: " << count << endl;
    }
}

void measureSearchTime(StudentRecord* head) {
    if (head == nullptr) {
        cout << "No records to search." << endl;
        return;
    }

    string searchEnrollmentNumber;
    cout << "Enter enrollment number to search: ";
    cin >> searchEnrollmentNumber;

    auto start = chrono::high_resolution_clock::now();

    StudentRecord* temp = head;
    while (temp != nullptr) {
        if (temp->enrollmentNumber == searchEnrollmentNumber) {
            break;
        }
        temp = temp->next;
    }

    auto end = chrono::high_resolution_clock::now();
    chrono::duration<double> elapsed = end - start;

    if (temp != nullptr) {
        cout << "Student record found." << endl;
    } else {
        cout << "Student record not found." << endl;
    }
    cout << "Search time: " << elapsed.count() << " seconds." << endl;
}
void measureDeleteTime(StudentRecord*& head) {
    if (head == nullptr) {
        cout << "No records to delete." << endl;
        return;
    }

    string deleteEnrollmentNumber;
    cout << "Enter enrollment number to delete: ";
    cin >> deleteEnrollmentNumber;

    auto start = chrono::high_resolution_clock::now();

    StudentRecord* temp = head;
    StudentRecord* prev = nullptr;

    while (temp != nullptr) {
        if (temp->enrollmentNumber == deleteEnrollmentNumber) {
            if (prev != nullptr) {
                prev->next = temp->next;
            } else {
                head = temp->next;
            }
            delete temp;
            break;
        }
        prev = temp;
        temp = temp->next;
    }

    auto end = chrono::high_resolution_clock::now();
    chrono::duration<double> elapsed = end - start;

    if (temp != nullptr) {
        cout << "Student record deleted." << endl;
    } else {
        cout << "Student record not found." << endl;
    }
    cout << "Delete time: " << elapsed.count() << " seconds." << endl;
}
void measureInsertTime(StudentRecord*& head) {
    auto start = chrono::high_resolution_clock::now();

    StudentRecord* newStudent = new StudentRecord;
    cout << "Enter enrollment number for new record: ";
    cin >> newStudent->enrollmentNumber;

    // Assign other fields as needed
    newStudent->next = head;
    head = newStudent;

    auto end = chrono::high_resolution_clock::now();
    chrono::duration<double> elapsed = end - start;

    cout << "Student record inserted." << endl;
    cout << "Insert time: " << elapsed.count() << " seconds." << endl;
}


int main() {
    StudentRecord* head = nullptr;
    StudentRecord* tail = nullptr;

    int choice;
    while (true) {
        cout << "1. Add scheme" << endl;
        cout << "2. Delete scheme" << endl;
        cout << "3. Update scheme" << endl;
        cout << "4. Add student record" << endl;
        cout << "5. Print report card" << endl;
        cout << "6. Print semester results" << endl;
        cout << "7. List and sort records" << endl;
        cout << "8. Measure MaxNodes\n";
        cout << "9. Measure Search Time\n";
        cout << "10. Measure Delete Time\n";
        cout << "11. Measure Insert Time\n";
        cout << "0. Exit\n";
        cout << "Enter your choice: ";

        cin >> choice;

        switch (choice) {
            case 1:
                addScheme();
                break;
            case 2:
                deleteScheme();
                break;
            case 3:
                updateScheme();
                break;
            case 4:
                addStudentRecord(head, tail);
                break;
            case 5:
                printReportCard(head);
                break;
            case 6:
            {
                string semester;
                cout << "Enter semester and year (e.g., Fall 2024): ";
                cin.ignore();
                getline(cin, semester);
                printSemesterResults(head, semester);
                break;
            }
            case 7:
            {
                int sortChoice;
                cout << "Sort by: 1. Name 2. Enrollment Number" << endl;
                cout << "Enter your choice: ";
                cin >> sortChoice;
                bool byName = (sortChoice == 1);
                listAndSortRecords(head, byName);
                break;
            }
             case 8:
        measureMaxNodes();
    break;
        case 9:
   measureSearchTime(head);
    break;
        case 10:
   measureDeleteTime(head);
    break;
        case 11:
   measureInsertTime(head);
    break;

        case 0:
            cout << "Exiting program." << endl;
            break;
        default:
            cout << "Invalid choice. Please enter a number between 0 and 7." << endl;
        }
    } while (choice != 0);



    return 0;
}