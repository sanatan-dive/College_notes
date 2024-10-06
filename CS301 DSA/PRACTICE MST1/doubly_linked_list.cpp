#include <iostream>

using namespace std;

struct Node {
    Node* prev;
    Node* next;
    int data;

    Node(int value) : prev(nullptr), next(nullptr), data(value) {}
};

Node* head = nullptr;

void insertion_beginning() {
    int item;
    cout << "\nEnter Item value: ";
    cin >> item;
    Node* ptr = new Node(item);

    if (head == nullptr) {
        head = ptr;
    } else {
        ptr->next = head;
        head->prev = ptr;
        head = ptr;
    }
    cout << "\nNode inserted\n";
}

void insertion_last() {
    int item;
    cout << "\nEnter value: ";
    cin >> item;
    Node* ptr = new Node(item);

    if (head == nullptr) {
        head = ptr;
    } else {
        Node* temp = head;
        while (temp->next != nullptr) {
            temp = temp->next;
        }
        temp->next = ptr;
        ptr->prev = temp;
        ptr->next = nullptr;
    }
    cout << "\nNode inserted\n";
}

void insertion_specified() {
    int item, loc;
    cout << "Enter the location: ";
    cin >> loc;

    Node* ptr = new Node(0);
    Node* temp = head;

    for (int i = 0; i < loc - 1; ++i) {
        if (temp == nullptr) {
            cout << "\nThere are less than " << loc << " elements\n";
            delete ptr;
            return;
        }
        temp = temp->next;
    }

    if (temp == nullptr) {
        cout << "\nCannot insert at this location\n";
        delete ptr;
        return;
    }

    cout << "Enter value: ";
    cin >> item;
    ptr->data = item;
    ptr->next = temp->next;
    temp->prev = ptr;

    ptr->prev = temp;
    if (temp->next != nullptr) {
        temp->next->prev = ptr;
    }
    temp->next = ptr;
    cout << "\nNode inserted\n";
}

void deletion_beginning() {
    if (head == nullptr) {
        cout << "\nUnderflow\n"; 
    } else {
        Node* ptr = head;
        head = head->next;
        head->prev = nullptr;
        delete ptr;
        cout << "\nNode deleted\n";
    }
}

void deletion_last() {
    if (head == nullptr ) {
        cout << "\nUnderflow\n";
    } else {
        Node* ptr = head;
        if (ptr->next == nullptr) {
            head = nullptr;
        } else {
            while (ptr->next->next != nullptr) {
                ptr = ptr->next;
            }
            delete ptr->next;
            ptr->next = nullptr;
        
        }
        cout << "\nNode deleted\n";
    }
}

void deletion_specified() {
    int val;
    cout << "\nEnter the data after which the node is to be deleted: ";
    cin >> val;

    Node* ptr = head;
    while (ptr != nullptr && ptr->data != val) {
        ptr = ptr->next;
    }

    if (ptr == nullptr || ptr->next == nullptr) {
        cout << "\nCannot delete\n";
    } else {
        Node* temp = ptr->next;
        ptr->next = temp->next;
        if (temp->next != nullptr) {
            temp->next->prev = ptr;
        }
        delete temp;
        cout << "\nNode deleted\n";
    }
}

void display() {
    Node* ptr = head;
    cout << "\nPrinting values...\n";
    if (ptr == nullptr) {
        cout << "List is empty\n";
        return;
    }
    while (ptr != nullptr) {
        cout << ptr->data << endl;
        ptr = ptr->next;
    }
}

void search() {
    int item;
    cout << "\nEnter item which you want to search: ";
    cin >> item;

    Node* ptr = head;
    int i = 0;
    while (ptr != nullptr) {
        if (ptr->data == item) {
            cout << "\nItem found at location " << i + 1 << endl;
            return;
        }
        i++;
        ptr = ptr->next;
    }
    cout << "\nItem not found\n";
}

int main() {
    int choice = 0;
    while (choice != 9) {
        cout << "\n********* Main Menu *********\n";
        cout << "\nChoose one option from the following list ...\n";
        cout << "\n===============================================\n";
        cout << "\n1. Insert at beginning\n2. Insert at last\n3. Insert at specified location\n4. Delete from beginning\n";
        cout << "5. Delete from last\n6. Delete the node after the given data\n7. Search\n8. Display\n9. Exit\n";
        cout << "\nEnter your choice: ";
        cin >> choice;
        switch (choice) {
            case 1:
                insertion_beginning();
                break;
            case 2:
                insertion_last();
                break;
            case 3:
                insertion_specified();
                break;
            case 4:
                deletion_beginning();
                break;
            case 5:
                deletion_last();
                break;
            case 6:
                deletion_specified();
                break;
            case 7:
                search();
                break;
            case 8:
                display();
                break;
            case 9:
                exit(0);
            default:
                cout << "Please enter a valid choice.\n";
        }
    }
    return 0;
}
