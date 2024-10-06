#include <bits/stdc++.h>
#define SIZE 80
#define LOG_SIZE 100 // Maximum number of log entries

using namespace std;

struct address {
    char house_no[100];
    char street[100];
    char city[100];
    char state[100];
    char country[100];
};

struct record {
    int roll_no;
    char name[100];
    char father_name[100];
    char mother_name[100];
    char standard[100];
    int semester;
    char branch[100];
    address addr;
};

typedef struct record RD;
RD S_DB[SIZE];
int lindex = 0;

struct log_entry {
    char operation[100];
    RD student;
};

log_entry log_table[LOG_SIZE];
int log_index = 0;

// Function declarations
void display_student(const RD& student);
RD input();
void add(const RD& rd);
void del(int roll_no);
void display(int roll_no);
void search_by_city(const char city[]);
void search_by_state(const char state[]);
void search_by_country(const char country[]);
void generate_report();
void display_log_table();
char* s_get_name();

char* s_get_name() {
    static char str[100];
    int i = 0;
    char ch;

    while ((ch = getchar()) != '\n' && ch != EOF) {
        if (i < sizeof(str) - 1) {
            str[i++] = ch;
        }
    }
    str[i] = '\0';

    return str;
}

RD input() {
    RD rd;

    cout << "Enter the roll number: ";
    cin >> rd.roll_no;
    cin.ignore();

    cout << "Enter the name: ";
    strcpy(rd.name, s_get_name());

    cout << "Enter the father's name: ";
    cin >> rd.father_name;

    cout << "Enter the mother's name: ";
    cin >> rd.mother_name;

    cout << "Enter the standard: ";
    cin >> rd.standard;

    cout << "Enter the semester: ";
    cin >> rd.semester;
    cin.ignore();

    cout << "Enter the branch: ";
    cin >> rd.branch;
    cout << "Enter the house number: ";
    cin >> rd.addr.house_no;

    cout << "Enter the street: ";
    cin >> rd.addr.street;

    cout << "Enter the city: ";
    cin >> rd.addr.city;

    cout << "Enter the state: ";
    cin >> rd.addr.state;

    cout << "Enter the country: ";
    cin >> rd.addr.country;

    return rd;
}

void add(const RD& rd) {
    for (int i = 0; i < lindex; i++) {
        if (S_DB[i].roll_no == rd.roll_no) {
            cout << "Duplicate roll number found. Record not added." << endl;
            return;
        }
    }
    if (lindex == SIZE) {
        cout << "Database is full." << endl;
        return;
    }

    int i;
    for (i = 0; i < lindex; i++) {
        if (S_DB[i].roll_no > rd.roll_no) {
            break;
        }
    }

    for (int j = lindex; j > i; j--) {
        S_DB[j] = S_DB[j - 1];
    }

    S_DB[i] = rd;
    lindex++;
}

void log_operation(const char operation[], const RD& student) {
    if (log_index < LOG_SIZE) {
        strcpy(log_table[log_index].operation, operation);
        log_table[log_index].student = student;
        log_index++;
    } else {
        cout << "Log table is full. Unable to log operation." << endl;
    }
}

void del(int roll_no) {
    for (int i = 0; i < lindex; i++) {
        if (S_DB[i].roll_no == roll_no) {
            log_operation("Delete", S_DB[i]);

            for (int j = i; j < lindex - 1; j++) {
                S_DB[j] = S_DB[j + 1];
            }
            lindex--;
            cout << "Student deleted successfully." << endl;
            return;
        }
    }
    cout << "Student record not found." << endl;
}

void display(int roll_no) {
    for (int i = 0; i < lindex; i++) {
        if (S_DB[i].roll_no == roll_no) {
            display_student(S_DB[i]);
            return;
        }
    }
    cout << "Student record not found." << endl;
}

void search_by_city(const char city[]) {
    bool found = false;
    for (int i = 0; i < lindex; i++) {
        if (strcmp(S_DB[i].addr.city, city) == 0) {
            display_student(S_DB[i]);
            log_operation("Search by City", S_DB[i]);
            found = true;
        }
    }
    if (!found) {
        cout << "No student records found for the city: " << city << endl;
    }
}

void search_by_state(const char state[]) {
    bool found = false;
    for (int i = 0; i < lindex; i++) {
        if (strcmp(S_DB[i].addr.state, state) == 0) {
            display_student(S_DB[i]);
            log_operation("Search by State", S_DB[i]);
            found = true;
        }
    }
    if (!found) {
        cout << "No student records found for the state: " << state << endl;
    }
}

void search_by_country(const char country[]) {
    bool found = false;
    for (int i = 0; i < lindex; i++) {
        if (strcmp(S_DB[i].addr.country, country) == 0) {
            display_student(S_DB[i]);
            log_operation("Search by Country", S_DB[i]);
            found = true;
        }
    }
    if (!found) {
        cout << "No student records found for the country: " << country << endl;
    }
}

void display_student(const RD& student) {
    cout << "Roll No: " << student.roll_no << endl;
    cout << "Name: " << student.name << endl;
    cout << "Father's Name: " << student.father_name << endl;
    cout << "Mother's Name: " << student.mother_name << endl;
    cout << "Standard: " << student.standard << endl;
    cout << "Semester: " << student.semester << endl;
    cout << "Branch: " << student.branch << endl;
    cout << "House No: " << student.addr.house_no << endl;
    cout << "Street: " << student.addr.street << endl;
    cout << "City: " << student.addr.city << endl;
    cout << "State: " << student.addr.state << endl;
    cout << "Country: " << student.addr.country << endl;
    cout << "-----------------------" << endl;
}

void generate_report() {
    cout << "Generating report of all students:" << endl;
    for (int i = 0; i < lindex; i++) {
        display_student(S_DB[i]);
    }
    cout << "End of report." << endl;
}

void display_log_table() {
    cout << "Displaying log of deleted and searched records:" << endl;
    for (int i = 0; i < log_index; i++) {
        cout << "Operation: " << log_table[i].operation << endl;
        display_student(log_table[i].student);
    }
}

int main() {
    int choice;
    do {
        cout << "Enter your choice:" << endl;
        cout << "1: Input data" << endl;
        cout << "2: Delete data" << endl;
        cout << "3: Display data" << endl;
        cout << "4: Search by City" << endl;
        cout << "5: Search by State" << endl;
        cout << "6: Search by Country" << endl;
        cout << "7: Generate Report" << endl;
        cout << "8: Display Log Table" << endl;
        cout << "9: Exit" << endl;

        cin >> choice;
        cin.ignore();

        switch (choice) {
            case 1: {
                RD new_student = input();
                add(new_student);
                break;
            }
            case 2: {
                int roll_no;
                cout << "Enter the roll number of the student to be deleted: ";
                cin >> roll_no;
                cin.ignore();
                del(roll_no);
                break;
            }
            case 3: {
                int roll_no;
                cout << "Enter the roll number of the student: ";
                cin >> roll_no;
                cin.ignore();
                display(roll_no);
                break;
            }
            case 4: {
                char city[100];
                cout << "Enter the city of the student: ";
                cin.getline(city, 100);
                search_by_city(city);
                break;
            }
            case 5: {
                char state[100];
                cout << "Enter the state of the student: ";
                cin.getline(state, 100);
                search_by_state(state);
                break;
            }
            case 6: {
                char country[100];
                cout << "Enter the country name: ";
                cin.getline(country, 100);
                search_by_country(country);
                break;
            }
            case 7:
                generate_report();
                break;
            case 8:
                display_log_table();
                break;
            case 9:
                cout << "Exiting..." << endl;
                break;
            default:
                cout << "Invalid choice. Please try again." << endl;
        }
    } while (choice != 9);

    return 0;
}
