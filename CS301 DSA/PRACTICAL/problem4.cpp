#include <iostream>
#include <fstream>
#include <cstring>
#include <cctype>

using namespace std;

#define SIZE 100

struct Record {
    char aadharNumber[SIZE];
    char name[SIZE];
    char gender[10];
    char fatherName[SIZE];
    char motherName[SIZE];
    char dob[11]; // Date of Birth (DD/MM/YYYY)
    Record* next;
    Record* prev;
};

// Utility functions
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

bool isValidAadharNumber(const char* aadharNumber) {
    if (strlen(aadharNumber) != 14) return false;
    if (aadharNumber[4] != ' ' || aadharNumber[9] != ' ') return false;

    for (int i = 0; i < 14; i++) {
        if (i != 4 && i != 9 && !isdigit(aadharNumber[i])) return false;
    }
    return true;
}

bool isValidGender(const char* gender) {
    return strcmp(gender, "male") == 0 || strcmp(gender, "female") == 0 || strcmp(gender, "others") == 0;
}

bool validateAlphabet(char ch) {
    return isalpha(ch) || ch == ' ';
}

bool validateName(char ch) {
    return isalpha(ch) || ch == ' ';
}

// Function to take input with spaces and validate real-time
void takeValidatedInput(char* input, int size, bool (*validateChar)(char)) {
    int i = 0;
    char ch;
    while (i < size - 1) {
        ch = getchar();
        if (ch == '\n') {
            break;
        }
        if (validateChar(ch)) {
            input[i++] = ch;
        } else {
            cout << "\nInvalid input, please enter again from the last valid position: ";
            cout << string(input, i);
            // Clear the input buffer
            while ((ch = getchar()) != '\n' && ch != EOF);
            continue;
        }
    }
    input[i] = '\0';
}

void insertRecord(Record*& head, Record*& tail, char aadharNumber[SIZE], char name[SIZE], char gender[10], char fatherName[SIZE], char motherName[SIZE], char dob[11]) {
    // Create the new record
    Record* newRecord = new Record();
    strcpy(newRecord->aadharNumber, aadharNumber);
    strcpy(newRecord->name, name);
    strcpy(newRecord->gender, gender);
    strcpy(newRecord->fatherName, fatherName);
    strcpy(newRecord->motherName, motherName);
    strcpy(newRecord->dob, dob);
    newRecord->next = nullptr;
    newRecord->prev = nullptr;

    // Insert the new record in sorted order (by Aadhar number)
    if (!head) {
        head = tail = newRecord;
    } else {
        Record* temp = head;
        while (temp && strcmp(temp->aadharNumber, newRecord->aadharNumber) < 0) {
            temp = temp->next;
        }

        if (!temp) {
            tail->next = newRecord;
            newRecord->prev = tail;
            tail = newRecord;
        } else if (temp == head) {
            newRecord->next = head;
            head->prev = newRecord;
            head = newRecord;
        } else {
            newRecord->next = temp;
            newRecord->prev = temp->prev;
            temp->prev->next = newRecord;
            temp->prev = newRecord;
        }
    }
    cout << "Record added successfully.\n";
}

void updateRecord(Record* head, char aadharNumber[SIZE], char name[SIZE], char gender[10], char fatherName[SIZE], char motherName[SIZE], char dob[11]) {
    Record* temp = head;
    while (temp && strcmp(temp->aadharNumber, aadharNumber) != 0) {
        temp = temp->next;
    }

    if (!temp) {
        cout << "Record not found.\n";
        return;
    }

    if (strlen(name) > 0) strcpy(temp->name, name);
    if (strlen(fatherName) > 0) strcpy(temp->fatherName, fatherName);
    if (strlen(motherName) > 0) strcpy(temp->motherName, motherName);
    if (strlen(gender) > 0) strcpy(temp->gender, gender);
    if (strlen(dob) > 0) strcpy(temp->dob, dob);

    cout << "Record updated successfully.\n";
}

void deleteRecord(Record*& head, Record*& tail, char aadharNumber[SIZE]) {
    Record* temp = head;
    while (temp && strcmp(temp->aadharNumber, aadharNumber) != 0) {
        temp = temp->next;
    }

    if (!temp) {
        cout << "Record not found.\n";
        return;
    }

    if (temp == head) {
        head = temp->next;
        if (head) head->prev = nullptr;
    } else {
        temp->prev->next = temp->next;
    }

    if (temp == tail) {
        tail = temp->prev;
        if (tail) tail->next = nullptr;
    } else {
        temp->next->prev = temp->prev;
    }
    delete temp;
    cout << "Record deleted successfully.\n";
}

void displayAllRecords(Record* head) {
    if (!head) {
        cout << "No records to display.\n";
        return;
    }

    Record* temp = head;

    while (temp) {
        cout << "Complete Report:\n";
        cout << "Aadhar Number: " << temp->aadharNumber << endl;
        cout << "Name: " << temp->name << endl;
        cout << "Gender: " << temp->gender << endl;
        cout << "Father's Name: " << temp->fatherName << endl;
        cout << "Mother's Name: " << temp->motherName << endl;
        cout << "Date of Birth: " << temp->dob << endl;
        cout << "\n";
        temp = temp->next;
    }
}

void findRecord(Record* head, char aadharNumber[SIZE]){
    if (!head) {
        cout << "No records to display.\n";
        return;
    }

    Record* temp = head;
    while (temp && strcmp(temp->aadharNumber, aadharNumber) != 0) {
        temp = temp->next;
    }

    if (temp) {
        cout << "Complete Report:\n";
        cout << "Aadhar Number: " << temp->aadharNumber << endl;
        cout << "Name: " << temp->name << endl;
        cout << "Gender: " << temp->gender << endl;
        cout << "Father's Name: " << temp->fatherName << endl;
        cout << "Mother's Name: " << temp->motherName << endl;
        cout << "Date of Birth: " << temp->dob << endl;
    } else {
        cout << "Record not found.\n";
    }
}

void searchRecord(Record* head, char input[SIZE], int choice) {
    if (!head) {
        cout << "No records to display.\n";
        return;
    }

    Record* temp = head;
    bool found = false;

    while (temp) {
        if (choice == 2) {
            if (strcmp(temp->name, input) == 0) {
                cout << "Complete Report:\n";
                cout << "Aadhar Number: " << temp->aadharNumber << endl;
                cout << "Name: " << temp->name << endl;
                cout << "Gender: " << temp->gender << endl;
                cout << "Father's Name: " << temp->fatherName << endl;
                cout << "Mother's Name: " << temp->motherName << endl;
                cout << "Date of Birth: " << temp->dob << endl;
                found = true;
                break;
            }
        }
        temp = temp->next;
    }

    if (!found) {
        cout << "Record not found.\n";
    }
}

void saveRecordsToFile(Record* head, const char* filename) {
    ofstream file(filename);
    if (!file.is_open()) {
        cout << "Error opening file for saving.\n";
        return;
    }

    Record* temp = head;
    while (temp) {
        file << temp->aadharNumber << ',';
        file << temp->name << ',';
        file << temp->gender << ',';
        file << temp->fatherName << ',';
        file << temp->motherName << ',';
        file << temp->dob << '\n';
        temp = temp->next;
        
    }

    file.close();
    cout << "Records saved to file successfully.\n";
}

void loadRecordsFromFile(Record*& head, Record*& tail, const char* filename) {
    ifstream file(filename);
    if (!file.is_open()) {
        cout << "Error opening file for loading.\n";
        return;
    }

    // Clear existing list
    Record* temp = head;
    while (temp) {
        Record* toDelete = temp;
        temp = temp->next;
        delete toDelete;
    }
    head = tail = nullptr;

    char buffer[SIZE * 6];
    while (file.getline(buffer, sizeof(buffer))) {
        char* token = strtok(buffer, ",");
        if (!token) continue;

        char aadharNumber[SIZE], name[SIZE], gender[10], fatherName[SIZE], motherName[SIZE], dob[11];

        strcpy(aadharNumber, token);
        token = strtok(nullptr, ",");
        strcpy(name, token);
        token = strtok(nullptr, ",");
        strcpy(gender, token);
        token = strtok(nullptr, ",");
        strcpy(fatherName, token);
        token = strtok(nullptr, ",");
        strcpy(motherName, token);
        token = strtok(nullptr, ",");
        strcpy(dob, token);

        insertRecord(head, tail, aadharNumber, name, gender, fatherName, motherName, dob);
    }

    file.close();
    cout << "Records loaded from file successfully.\n";
}

// Program starts here
int main() {
    Record* head = nullptr;
    Record* tail = nullptr;
    int choice;

    while (true) {
        cout << "1. Add Record\n";
        cout << "2. Update Record\n";
        cout << "3. Delete Record\n";
        cout << "4. Display All Records\n";
        cout << "5. Find Record by Aadhar Number\n";
        cout << "6. Search Record by Name\n";
        cout << "7. Save Records to File\n";
        cout << "8. Load Records from File\n";
        cout << "9. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;
        cin.ignore(); // To ignore newline after entering the choice

        if (choice == 9) break;

        char aadharNumber[SIZE], name[SIZE], gender[10], fatherName[SIZE], motherName[SIZE], dob[11];

        switch (choice) {
            case 1:
                cout << "Enter Aadhar Number (xxxx xxxx xxxx): ";
                cin.getline(aadharNumber, SIZE);
                if (!isValidAadharNumber(aadharNumber)) {
                    cout << "Invalid Aadhar Number format.\n";
                    break;
                }

                cout << "Enter Name: ";
                takeValidatedInput(name, SIZE, validateName);

                cout << "Enter Gender (male/female/others): ";
                cin.getline(gender, 10);
                if (!isValidGender(gender)) {
                    cout << "Invalid gender.\n";
                    break;
                }

                cout << "Enter Father's Name: ";
                takeValidatedInput(fatherName, SIZE, validateName);

                cout << "Enter Mother's Name: ";
                takeValidatedInput(motherName, SIZE, validateName);

                cout << "Enter Date of Birth (DD/MM/YYYY): ";
                cin.getline(dob, 11);
                if (!isValidDate(dob)) {
                    cout << "Invalid Date of Birth.\n";
                    break;
                }

                insertRecord(head, tail, aadharNumber, name, gender, fatherName, motherName, dob);
                break;

            case 2:
                cout << "Enter Aadhar Number of the record to update: ";
                cin.getline(aadharNumber, SIZE);
                if (!isValidAadharNumber(aadharNumber)) {
                    cout << "Invalid Aadhar Number format.\n";
                    break;
                }

                cout << "Enter new Name (leave blank if no change): ";
                takeValidatedInput(name, SIZE, validateName);

                cout << "Enter new Gender (leave blank if no change): ";
                cin.getline(gender, 10);

                cout << "Enter new Father's Name (leave blank if no change): ";
                takeValidatedInput(fatherName, SIZE, validateName);

                cout << "Enter new Mother's Name (leave blank if no change): ";
                takeValidatedInput(motherName, SIZE, validateName);

                cout << "Enter new Date of Birth (leave blank if no change): ";
                cin.getline(dob, 11);

                updateRecord(head, aadharNumber, name, gender, fatherName, motherName, dob);
                break;

            case 3:
                cout << "Enter Aadhar Number of the record to delete: ";
                cin.getline(aadharNumber, SIZE);
                if (!isValidAadharNumber(aadharNumber)) {
                    cout << "Invalid Aadhar Number format.\n";
                    break;
                }

                deleteRecord(head, tail, aadharNumber);
                break;

            case 4:
                displayAllRecords(head);
                break;

            case 5:
                cout << "Enter Aadhar Number: ";
                cin.getline(aadharNumber, SIZE);
                if (!isValidAadharNumber(aadharNumber)) {
                    cout << "Invalid Aadhar Number format.\n";
                    break;
                }

                findRecord(head, aadharNumber);
                break;

            case 6:
                cout << "Enter Name to search: ";
                takeValidatedInput(name, SIZE, validateName);

                searchRecord(head, name, 2);
                break;

            case 7:
                saveRecordsToFile(head, "records.txt");
                break;

            case 8:
                loadRecordsFromFile(head, tail, "records.txt");
                break;

            default:
                cout << "Invalid choice. Try again.\n";
        }
    }

    // Clean up the list before exiting
    while (head) {
        Record* temp = head;
        head = head->next;
        delete temp;
    }

    return 0;
}
