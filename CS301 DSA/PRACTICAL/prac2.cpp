#include <bits/stdc++.h>
#define SIZE 80
#define LOG_SIZE 100
using namespace std;

struct addr {
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
    addr address;
};

typedef struct record RD;
RD S_DB[SIZE];

RD del_log[LOG_SIZE];
RD search_log[LOG_SIZE];

int del_log_index = 0;
int search_log_index = 0;
int lindex = 0;

void display_student(const RD& student);
void add(const RD& rd);
void del(int roll_no);
void display(int roll_no);
void search_by_city(const char* city);
void search_by_state(const char* state);
void search_by_country(const char* country);
void display_all();
void display_del_log();
void display_search_log(const char* filter_type);

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
    strcpy(rd.father_name, s_get_name());

    cout << "Enter the mother's name: ";
    strcpy(rd.mother_name, s_get_name());

    cout << "Enter the standard: ";
    cin >> rd.standard;

    cout << "Enter the semester: ";
    cin >> rd.semester;
    cin.ignore();

    cout << "Enter the branch: ";
    cin >> rd.branch;
    cin.ignore();

    cout << "Enter the house number: ";
    cin >> rd.address.house_no;
    cin.ignore();

    cout << "Enter the street: ";
    cin >> rd.address.street;
    cin.ignore();

    cout << "Enter the city: ";
    cin >> rd.address.city;
    cin.ignore();

    cout << "Enter the state: ";
    strcpy(rd.address.state, s_get_name());

    cout << "Enter the country: ";
    strcpy(rd.address.country, s_get_name());

    return rd;
}

void add(const RD& rd) {
    if (lindex == SIZE) {
        cout << "Database is full." << endl;
        return;
    }
    for (int i = 0; i < lindex; i++) {
        if (S_DB[i].roll_no == rd.roll_no) {
            cout << "Duplicate roll number found. Record not added." << endl;
            return;
        }
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

void del(int roll_no) {
    if (lindex == 0) {
        cout << "Empty Database!!!" << endl;
        return;
    }

    for (int i = 0; i < lindex; i++) {
        if (S_DB[i].roll_no == roll_no) {
            
            if (del_log_index < LOG_SIZE) {
                del_log[del_log_index++] = S_DB[i];
            }
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
    if (lindex == 0) {
        cout << "Empty Database!!!" << endl;
        return;
    }

    for (int i = 0; i < lindex; i++) {
        if (S_DB[i].roll_no == roll_no) {
            
            if (search_log_index < LOG_SIZE) {
                search_log[search_log_index++] = S_DB[i];
            }
            display_student(S_DB[i]);
            return;
        }
    }
    cout << "Student record not found." << endl;
}

void search_by_city(const char* city) {
    if (lindex == 0) {
        cout << "Empty Database!!!" << endl;
        return;
    }

    bool found = false;
    for (int i = 0; i < lindex; i++) {
        if (strcmp(S_DB[i].address.city, city) == 0) {
         if (search_log_index < LOG_SIZE) {
                search_log[search_log_index++] = S_DB[i];
            }
            display_student(S_DB[i]);
            found = true;
        }
    }
    if (!found) {
        cout << "No student records found for the city: " << city << endl;
    }
}

void search_by_state(const char* state) {
    if (lindex == 0) {
        cout << "Empty Database!!!" << endl;
        return;
    }

    bool found = false;
    for (int i = 0; i < lindex; i++) {
        if (strcmp(S_DB[i].address.state, state) == 0) {
         if (search_log_index < LOG_SIZE) {
                search_log[search_log_index++] = S_DB[i];
            }
            display_student(S_DB[i]);
            found = true;
        }
    }
    if (!found) {
        cout << "No student records found for the state: " << state << endl;
    }
}

void search_by_country(const char* country) {
    if (lindex == 0) {
        cout << "Empty Database!!!" << endl;
        return;
    }

    bool found = false;
    for (int i = 0; i < lindex; i++) {
        if (strcmp(S_DB[i].address.country, country) == 0) {
         if (search_log_index < LOG_SIZE) {
                search_log[search_log_index++] = S_DB[i];
            }
            display_student(S_DB[i]);
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
    cout << "House No: " << student.address.house_no << endl;
    cout << "Street: " << student.address.street << endl;
    cout << "City: " << student.address.city << endl;
    cout << "State: " << student.address.state << endl;
    cout << "Country: " << student.address.country << endl;
    cout << "-----------------------" << endl;
}

void display_all() {
    cout << "Generating report of all students:" << endl;
    for (int i = 0; i < lindex; i++) {
        display_student(S_DB[i]);
    }
    cout << "End of report." << endl;
}

void display_del_log() {
    if (del_log_index == 0) {
        cout << "No records in delete log." << endl;
        return;
    }

    cout << "Deleted Students Log:" << endl;
    for (int i = 0; i < del_log_index; i++) {
        display_student(del_log[i]);
    }
}

void display_search_log(const char* filter_type) {
    if (search_log_index == 0) {
        cout << "No records in search log." << endl;
        return;
    }

    cout << "Search Log (" << filter_type << "):" << endl;
    for (int i = 0; i < search_log_index; i++) {
        display_student(search_log[i]);
    }
}
void display_search_log_city(const char* filter_type) {
    if (search_log_index == 0) {
        cout << "No records in search log." << endl;
        return;
    }

    cout << "Search Log (" << filter_type << "):" << endl;
    for (int i = 0; i < search_log_index; i++) {
        display_student(search_log[i]);
    }
}
void display_search_log_state(const char* filter_type) {
    if (search_log_index == 0) {
        cout << "No records in search log." << endl;
        return;
    }

    cout << "Search Log (" << filter_type << "):" << endl;
    for (int i = 0; i < search_log_index; i++) {
        display_student(search_log[i]);
    }
}
void display_search_log_country(const char* filter_type) {
    if (search_log_index == 0) {
        cout << "No records in search log." << endl;
        return;
    }

    cout << "Search Log (" << filter_type << "):" << endl;
    for (int i = 0; i < search_log_index; i++) {
        display_student(search_log[i]);
    }
}

int main() {
    int choice;
    while (true) {
        cout << "1. Add Student Record" << endl;
        cout << "2. Delete Student Record" << endl;
        cout << "3. Search by Roll Number" << endl;
        cout << "4. Search by City" << endl;
        cout << "5. Search by State" << endl;
        cout << "6. Search by Country" << endl;
        cout << "7. Generate Report" << endl;
        cout << "8. Display Delete Log" << endl;
        cout << "9. Display Search Log" << endl;
        cout << "10. Exit" << endl;
        cout << "Enter your choice: ";
        cin >> choice;
        cin.ignore();

        switch (choice) {
            case 1: {
                RD rd = input();
                add(rd);
                break;
            }
            case 2: {
                int roll_no;
                cout << "Enter the roll number to delete: ";
                cin >> roll_no;
                cin.ignore();
                del(roll_no);
                break;
            }
            case 3: {
                int roll_no;
                cout << "Enter the roll number to search: ";
                cin >> roll_no;
                cin.ignore();
                display(roll_no);
                break;
            }
            case 4: {
                char city[100];
                cout << "Enter the city to search: ";
                cin.getline(city, sizeof(city));
                search_by_city(city);
                break;
            }
            case 5: {
                char state[100];
                cout << "Enter the state to search: ";
                cin.getline(state, sizeof(state));
                search_by_state(state);
                break;
            }
            case 6: {
                char country[100];
                cout << "Enter the country to search: ";
                cin.getline(country, sizeof(country));
                search_by_country(country);
                break;
            }
            case 7:
                display_all();
                break;
            case 8:
                display_del_log();
                break;
            case 9: {
                int log_choice;
                cout << "Select search log filter:" << endl;
                cout << "1. City" << endl;
                cout << "2. State" << endl;
                cout << "3. Country" << endl;
                cout << "Enter your choice: ";
                cin >> log_choice;
                cin.ignore();
                
                switch (log_choice) {
                    case 1:
                        display_search_log_city("City");
                        break;
                    case 2:
                        display_search_log_state("State");
                        break;
                    case 3:
                        display_search_log_country("Country");
                        break;
                    default:
                        cout << "Invalid choice, please try again." << endl;
                }
                break;
            }
            case 10:
                cout << "Exiting..." << endl;
                return 0;
            default:
                cout << "Invalid choice, please try again." << endl;
        }
    }
}
