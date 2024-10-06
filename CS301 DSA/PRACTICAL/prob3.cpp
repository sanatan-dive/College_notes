#include <bits/stdc++.h>

using namespace std;

typedef struct Employee {
    int id;
    char name[100];
    char father_name[100];
    char mother_name[100];
    char rank[50];
    char department[50];
    char date_of_joining[11];
    char address[100];
    char house_no[10];
    char street_name[50];
    char city[50];
    char state[50];
    char country[50];
    int pin;
    struct Employee* next;
} Employee;

// Function to validate the employee ID
bool isValidID(int id) {
    return id > 0;
}

// Function to validate the date of joining (DDMMYYYY)
bool isValidDate(const string& date) {
    if (date.length() != 8) return false;

    for (char ch : date) {
        if (!isdigit(ch)) return false;
    }
    return true;
}

// Function to validate the PIN code
bool isValidPin(int pin) {
    return pin >= 100000 && pin <= 999999;
}

//Check duplicates
bool is_duplicate(Employee* head, int id) {
    Employee* temp = head;
    while (temp != nullptr) {
        if (temp->id == id) {
            return true;
        }
        temp = temp->next;
    }
    return false;
}

// Function to handle space in input
char* space_char() {
    static char str[100];
    int i = 0;
    char ch;

    while ((ch = getchar()) != '\n' && ch != EOF) {
        if (static_cast<size_t>(i) < sizeof(str) - 1) {
            str[i++] = ch;
        }
    }
    str[i] = '\0';

    return str;
}

// Function to insert a new employee in the sorted linked list
void insert_record(Employee*& head, int id, char* name, char* father_name, char* mother_name, char* rank, char* department, char* date_of_joining, char* address, char* house_no, char* street_name, char* city, char* state, char* country, int pin) {
    Employee* new_employee = new Employee;

    new_employee->id = id;
    strcpy(new_employee->name, name);
    strcpy(new_employee->father_name, father_name);
    strcpy(new_employee->mother_name, mother_name);
    strcpy(new_employee->rank, rank);
    strcpy(new_employee->department, department);
    strcpy(new_employee->date_of_joining, date_of_joining);
    strcpy(new_employee->address, address);
    strcpy(new_employee->house_no, house_no);
    strcpy(new_employee->street_name, street_name);
    strcpy(new_employee->city, city);
    strcpy(new_employee->state, state);
    strcpy(new_employee->country, country);
    new_employee->pin = pin;

    new_employee->next = head;
    head = new_employee;
    cout << "Record added successfully!\n";
}

//Delete record
void delete_record(Employee*& head, int id) {
    Employee *temp = head, *prev = nullptr;

    if (temp != nullptr && temp->id == id) {
        head = temp->next;
        delete temp;
        cout << "Record deleted successfully!\n";
        return;
    }

    while (temp != nullptr && temp->id != id) {
        prev = temp;
        temp = temp->next;
    }

    if (temp == nullptr) {
        cout << "Record not found.\n";
        return;
    }

    prev->next = temp->next;
    delete temp;
    cout << "Record deleted successfully!\n";
}

//Find a record
Employee* find_record(Employee* head, int id) {
    Employee* temp = head;
    while (temp != nullptr) {
        if (temp->id == id) {
            return temp;
        }
        temp = temp->next;
    }
    cout << "Record not found.\n";
    return nullptr;
}

// Update a record
void update_record(Employee* head, int id, char* rank, char* department, char* date_of_joining, char* address, char* house_no, char* street_name, char* city, char* state, char* country, int pin) {
    Employee* employee = find_record(head, id);
    if (employee == nullptr) {
        return;
    }

    strcpy(employee->rank, rank);
    strcpy(employee->department, department);
    strcpy(employee->date_of_joining, date_of_joining);
    strcpy(employee->address, address);
    strcpy(employee->house_no, house_no);
    strcpy(employee->street_name, street_name);
    strcpy(employee->city, city);
    strcpy(employee->state, state);
    strcpy(employee->country, country);
    employee->pin = pin;
        cout << "Record updated successfully!\n";
}

// Function to display records of employees belonging to a particular city/state/country/pin
void display_records_by_location(Employee* head, char* location) {
    Employee* temp = head;
    bool found = false;

    while (temp != nullptr) {
        if (strcmp(temp->city, location) == 0 || strcmp(temp->state, location) == 0 || strcmp(temp->country, location) == 0 || temp->pin == atoi(location)) {
            cout << "Record found:" << endl;
            cout << "Employee ID: " << temp->id << endl;
            cout << "Employee Name: " << temp->name << endl;
            cout << "Employee Father's Name: " << temp->father_name << endl;
            cout << "Employee Mother's Name: " << temp->mother_name << endl;
            cout << "Employee Rank/Position: " << temp->rank << endl;
            cout << "Employee Department: " << temp->department << endl;
            cout << "Date of Joining: " << temp->date_of_joining << endl;
            cout << "Employee Address: " << temp->address << endl;
            cout << "House No: " << temp->house_no << endl;
            cout << "Street Name: " << temp->street_name << endl;
            cout << "City: " << temp->city << endl;
            cout << "State: " << temp->state << endl;
            cout << "Country: " << temp->country << endl;
            cout << "Pin: " << temp->pin << endl;
            found = true;
        }
        temp = temp->next;
    }

    if (!found) {
        cout << "No records found." << endl;
    }
}

//City wise report
void generate_city_wise_report(Employee* head) {
    Employee* temp = head;

    while (temp != nullptr) {
        cout << "City: " << temp->city << ", ID: " << temp->id << ", Name: " << temp->name << endl;
        temp = temp->next;
    }
}

int main() {
    Employee* head = nullptr;  // Initialize the head of the linked list to nullptr
    int choice, id;
    char name[100], father_name[100], mother_name[100], rank[50], department[50], date_of_joining[11], address[100], house_no[10], street_name[50], city[50], state[50], country[50];
    int pin;
    char location[50];

    do {
        cout << "\nEmployee Management System\n";
        cout << "1. Insert Record\n";
        cout << "2. Delete Record\n";
        cout << "3. Find Record\n";
        cout << "4. Update Record\n";
        cout << "5. Display Records by Location\n";
        cout << "6. Generate City-wise Report\n";
        cout << "7. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;
        cin.ignore();  // To handle the newline character left by cin

        switch (choice) {
            case 1:
                cout << "Enter Employee Id: ";
                cin >> id;
                cout << "Enter Employee Name: ";
                strcpy(name, space_char());
                cout << "Enter Father's Name: ";
                strcpy(father_name, space_char());
                cout << "Enter Mother's Name: ";
                strcpy(mother_name, space_char());
                cout << "Enter Employee Rank: ";
                strcpy(rank, space_char());
                cout << "Enter Employee Department: ";
                strcpy(department, space_char());
                cout << "Enter Date of Joining (DDMMYYYY): ";
                cin >> date_of_joining;
                cout << "Enter Employee Address: ";
                strcpy(address, space_char());
                cout << "Enter House No.: ";
                strcpy(house_no, space_char());
                cout << "Enter Street Name: ";
                strcpy(street_name, space_char());
                cout << "Enter City: ";
                strcpy(city, space_char());
                cout << "Enter State: ";
                strcpy(state, space_char());
                cout << "Enter Country: ";
                strcpy(country, space_char());
                cout << "Enter PIN Code: ";
                cin >> pin;
                insert_record(head, id, name, father_name, mother_name, rank, department, date_of_joining, address, house_no, street_name, city, state, country, pin);
                break;
            case 2:
                cout << "Enter Employee Id to delete: ";
                cin >> id;
                delete_record(head, id);
                break;
            case 3:
                cout << "Enter Employee Id to find: ";
                cin >> id;
                find_record(head, id);
                break;
             case 4:
                cout << "Enter Employee Id to update: ";
                cin >> id;
                cout << "Enter new Rank/Position: ";
                strcpy(rank, space_char());
                cout << "Enter new Department: ";
                strcpy(department, space_char());
                cout << "Enter new Date of Joining (DDMMYYYY): ";
                cin >> date_of_joining;
                cout << "Enter new Address: ";
                strcpy(address, space_char());
                cout << "Enter new House No.: ";
                strcpy(house_no, space_char());
                cout << "Enter new Street Name: ";
                strcpy(street_name, space_char());
                cout << "Enter new City: ";
                strcpy(city, space_char());
                cout << "Enter new State: ";
                strcpy(state, space_char());
                cout << "Enter new Country: ";
                strcpy(country, space_char());
                cout << "Enter new PIN Code: ";
                cin >> pin;
                update_record(head, id, rank, department, date_of_joining, address, house_no, street_name, city, state, country, pin);
                break;
            case 5:
                cout << "Enter the key (City/State/Country/Pin) to search: ";
                strcpy(location, space_char());
                display_records_by_location(head, location);
                break;
            case 6:
                generate_city_wise_report(head);
                break;
            case 7:
                cout << "Exiting...\n";
                break;
            default:
                cout << "Invalid choice! Please try again.\n";
        }
    } while (choice != 7);

    return 0;
}