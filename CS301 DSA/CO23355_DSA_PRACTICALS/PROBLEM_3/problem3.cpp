#include <iostream>
#include <cstring>
using namespace std;

#define SIZE 100

struct Employee {
    int id;
    char name[SIZE];
    char fatherName[SIZE];
    char motherName[SIZE];
    char position[SIZE];
    char department[SIZE];
    char doj[11];
    char houseNo[SIZE];
    char street[SIZE];
    char city[SIZE];
    char state[SIZE];
    char country[SIZE];
    char pin[10];
    Employee* next;
};

char* sana_get_name() {
    static char str[100];
    int i = 0;
    char ch;

    while ((ch = getchar()) != '\n' && ch != EOF) {
        if (i < sizeof(str) - 1) {
            str[i++] = ch;
        }
    }  
    str  [i ] = '\0';

    return str;
}

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

bool sana_isDuplicate(Employee* start, int id) {
    for (Employee* ptr = start; ptr != NULL; ptr = ptr->next) {
        if (ptr->id == id) return true;
    }
    return false;
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

bool sana_isValidDate(const char* date) {
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
void sana_inputemployee(Employee*& newEmployee) {
    do {
        cout << "Enter Employee Name: ";
        cin.ignore();
        strcpy(newEmployee->name, sana_get_name());
        if (!isValidString(newEmployee->name)) {
            cout << "Invalid name! Only alphabets, dots, and spaces are allowed.\n";
        }
    } while (!isValidString(newEmployee->name));

    do {
        cout << "Enter Employee Father's Name: ";
        strcpy(newEmployee->fatherName, sana_get_name());
        if (!isValidString(newEmployee->fatherName)) {
            cout << "Invalid father's name! Only alphabets, dots, and spaces are allowed.\n";
        }
    } while (!isValidString(newEmployee->fatherName));

    do {
        cout << "Enter Employee Mother's Name: ";
        strcpy(newEmployee->motherName, sana_get_name());
        if (!isValidString(newEmployee->motherName)) {
            cout << "Invalid mother's name! Only alphabets, dots, and spaces are allowed.\n";
        }
    } while (!isValidString(newEmployee->motherName));

    do {
        cout << "Enter Employee Position: ";
        strcpy(newEmployee->position, sana_get_name());
        if (!isValidString(newEmployee->position)) {
            cout << "Invalid position! Only alphabets, dots, and spaces are allowed.\n";
        }
    } while (!isValidString(newEmployee->position));

    do {
        cout << "Enter Employee Department: ";
        strcpy(newEmployee->department, sana_get_name());
        if (!isValidString(newEmployee->department)) {
            cout << "Invalid department! Only alphabets, dots, and spaces are allowed.\n";
        }
    } while (!isValidString(newEmployee->department));

    do{
    cout << "Enter Date of Joining (DD/MM/YYYY): ";
    sana_getline(newEmployee->doj, 11);
    if(!sana_isValidDate(newEmployee->doj)){
        cout << "Invalid date of joining! Please enter a valid date in DD/MM/YYYY format.\n";
    }
    }while(!sana_isValidDate(newEmployee->doj));

    cout << "Enter Employee Address-:\n";
    cout << "House No: ";
    cin.ignore();
    sana_getline(newEmployee->houseNo, 10);
    cout << "Street Name: ";
    sana_getline(newEmployee->street, 100);
    cout << "City: ";
    sana_getline(newEmployee->city, 100);
    cout << "State: ";
    sana_getline(newEmployee->state, 100);
    cout << "Country: ";
    sana_getline(newEmployee->country, 100);
    cout << "Pin: ";
    sana_getline(newEmployee->pin, 10);
}

void sana_displayEmployeeDetails(Employee* employee) {
    cout << "Employee ID: " << employee->id << endl;
    cout << "Name: " << employee->name << endl;
    cout << "Father's Name: " << employee->fatherName << endl;
    cout << "Mother's Name: " << employee->motherName << endl;
    cout << "Position: " << employee->position << endl;
    cout << "Department: " << employee->department << endl;
    cout << "Date of Joining: " << employee->doj << endl;
    cout << "Address: " << employee->houseNo << ", " << employee->street << ", " << employee->city << ", " << employee->state << ", " << employee->country << ", " << employee->pin << endl;
}

void sana_insertRecord(Employee*& start, int id) {
    if (sana_isDuplicate(start, id)) {
        cout << "Error: Record with Employee ID " << id << " already exists!\n";
        return;
    }

    Employee* newEmployee = new Employee;
    newEmployee->id = id;

    strcpy(newEmployee->name, "");
    strcpy(newEmployee->fatherName, "");
    strcpy(newEmployee->motherName, "");
    strcpy(newEmployee->position, "");
    strcpy(newEmployee->department, "");
    strcpy(newEmployee->doj, "");
    strcpy(newEmployee->houseNo, "");
    strcpy(newEmployee->street, "");
    strcpy(newEmployee->city, "");
    strcpy(newEmployee->state, "");
    strcpy(newEmployee->country, "");
    strcpy(newEmployee->pin, "");

    newEmployee->next = NULL;

    sana_inputemployee(newEmployee);

    if (start == NULL) {
        start = newEmployee;
    } else {
        Employee* ptr = start;
        while (ptr->next != NULL) {
            ptr = ptr->next;
        }
        ptr->next = newEmployee;
    }

    cout << "Record inserted successfully!\n";
}

void sana_updateRecord(Employee* start, int id) {
    Employee* ptr = start;

    while (ptr != NULL) {
        if (ptr->id == id) {
            cout << "Updating details for Employee ID: " << id << endl;
            sana_inputemployee(ptr);
            cout << "Record updated successfully!\n";
            return;
        }
        ptr = ptr->next;
    }
    cout << "Error: Record not found!\n";
}

void sana_deleteRecord(Employee*& start, int id) {
    if (start == NULL) {
        cout << "Error: No records found!\n";
        return;
    }

    if (start->id == id) {
        Employee* ptr = start;
        start = start->next;
        delete ptr;
        cout << "Record deleted successfully!\n";
        return;
    }

    Employee* ptr = start;
    Employee* prev = NULL;

    while (ptr != NULL && ptr->id != id) {
        prev = ptr;
        ptr = ptr->next;
    }

    if (ptr == NULL) {
        cout << "Error: Record not found!\n";
        return;
    }

    prev->next = ptr->next;
    delete ptr;
    cout << "Record deleted successfully!\n";
}

void sana_findRecord(Employee* start, int id) {
    for (Employee* ptr = start; ptr != NULL; ptr = ptr->next) {
        if (ptr->id == id) {
            sana_displayEmployeeDetails(ptr);
            return;
        }
    }
    cout << "Error: Employee ID not found!\n";
}

void sana_displayRecordsByLocation(Employee* start, const char* city, const char* state, const char* country, const char* pin) {
    if (start == NULL) {
        cout << "No records available to display.\n";
        return;
    }

    Employee* ptr = start;
    bool found = false;

    while (ptr != NULL) {
        bool match = true;

        if (strlen(city) > 0 && strcmp(ptr->city, city) != 0) match = false;
        if (strlen(state) > 0 && strcmp(ptr->state, state) != 0) match = false;
        if (strlen(country) > 0 && strcmp(ptr->country, country) != 0) match = false;
        if (strlen(pin) > 0 && strcmp(ptr->pin, pin) != 0) match = false;

        if (match) {
            sana_displayEmployeeDetails(ptr);
            found = true;
        }

        ptr = ptr->next;
    }

    if (!found) {
        cout << "No records found matching the specified location criteria.\n";
    }
}
void sana_generateCityWiseReport(Employee* start) {
    if (!start) {
        cout << "No records to display!\n";
        return;
    }
    for (Employee* ptr = start; ptr != NULL; ptr = ptr->next) {
        cout << "City: " << ptr->city << " | Employee ID: " << ptr->id << " | Name: " << ptr->name << endl;
    }
}

int main() {
    Employee* employeeList = NULL;

    
    int choice, id;
    char city[SIZE], state[SIZE], country[SIZE], pin[10];

    do {
        cout << "1. Insert Employee Record\n";
        cout << "2. Update Employee Record\n";
        cout << "3. Delete Employee Record\n";
        cout << "4. Find Employee Record by ID\n";
        cout << "5. Display Employee Records by Location\n";
        cout << "6. Generate city wise report\n";
        cout << "7. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
            case 1:
               cout << "Enter Employee ID to insert: (6 digit)";
                cin >> id;
                if(id<100000 || id>999999){
                    cout << "Error: Invalid Id , Please Enter 6 digit id\n";
                    break;
                }
                else{
                sana_insertRecord(employeeList, id);
                break;}
            case 2:
                cout << "Enter Employee ID to Update: ";
                cin >> id;
                sana_updateRecord(employeeList, id);
                break;
            case 3:
                cout << "Enter Employee ID to Delete: ";
                cin >> id;
                sana_deleteRecord(employeeList, id);
                break;
            case 4:
                cout << "Enter Employee ID to Find: ";
                cin >> id;
                sana_findRecord(employeeList, id);
                break;
            case 5:
                cin.ignore();
                cout << "Enter City (Leave empty if not needed): ";
                sana_getline(city, SIZE);
                cout << "Enter State (Leave empty if not needed): ";
                sana_getline(state, SIZE);
                cout << "Enter Country (Leave empty if not needed): ";
                sana_getline(country, SIZE);
                cout << "Enter Pin (Leave empty if not needed): ";
                sana_getline(pin, 10);
                sana_displayRecordsByLocation(employeeList, city, state, country, pin);
                break;
            case 6:
                sana_generateCityWiseReport(employeeList);
                break;
            case 7:
                cout << "Exiting...\n";
                break;
            default:
                cout << "Invalid choice! Please try again.\n";
        }
    } while (choice != 6);

    return 0;
}