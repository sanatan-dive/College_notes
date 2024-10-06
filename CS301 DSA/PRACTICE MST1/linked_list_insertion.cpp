#include <iostream>
using namespace std;

struct node {
    int data;
    node* next;
};

typedef node ND;

// Global head pointer
ND* head = nullptr;

void beginInsert(int item) {
    ND* ptr = new ND; // Allocate memory using new

    if (ptr == nullptr) {
        cout << "Overflow" << endl;
        return;
    }

    ptr->data = item;
    ptr->next = head; // Insert at the beginning
    head = ptr; 
    cout << "Node inserted at the beginning with value: " << ptr->data << endl;
}

void lastInsert(int val){
    ND* newNode = new ND;  // Create a new node
    newNode->data = val;
    newNode->next = nullptr;

    if (head == nullptr) { // If the list is empty, new node becomes the head
        head = newNode;
        cout << "Node inserted as the only element with value: " << val << endl;
        return;
    }

    ND* temp = head;
    while (temp->next != nullptr) {
        temp = temp->next;
    }
    
    temp->next = newNode;
    cout << "Node inserted at the end with value: " << newNode->data << endl;
}

void randomInsert(int item, int loc) {
    ND* ptr = new ND;

    if (ptr == nullptr) {
        cout << "Overflow" << endl;
        return;
    }

    ptr->data = item;

    if (head == nullptr) {
        cout << "List is empty, inserting at the beginning." << endl;
        ptr->next = nullptr;
        head = ptr;
        cout << "Node inserted with value: " << ptr->data << endl;
        return;
    }

    if (loc == 0) {
        ptr->next = head;
        head = ptr;
        cout << "Node inserted at location 0 with value: " << item << endl;
        return;
    }

    ND* temp = head;
    for (int i = 0; i < loc - 1; i++) {
        if (temp == nullptr || temp->next == nullptr) {
            cout << "Location out of bounds, can't insert." << endl;
            delete ptr; // Clean up allocated memory
            return;
        }
        temp = temp->next;
    }

    ptr->next = temp->next;
    temp->next = ptr;
    cout << "Node inserted with value: " << ptr->data << " at location: " << loc << endl;
}

void beginDelete() {
    if (head == nullptr) {
        cout << "\nList is empty\n";
        return;
    }

    ND* ptr = head;
    head = head->next;
    delete ptr; // Correctly deallocate memory
    cout << "\nNode deleted from the beginning ...\n";
}

void lastDelete() {
    if (head == nullptr) {
        cout << "\nList is empty" << endl;
        return;
    } 

    if (head->next == nullptr) {
        delete head;
        head = nullptr;
        cout << "\nOnly node of the list deleted ...\n";
        return;
    }

    ND* ptr = head;

    while (ptr->next->next != nullptr) {
        ptr = ptr->next;
    }
    delete ptr->next;
    ptr->next = nullptr;
    cout << "\nDeleted Node from the last ...\n";
}

ND* kdelete(ND* head, int el){
    if (head == nullptr) return head;

    if (head->data == el) {
        ND* ptr = head;
        head = head->next;
        delete ptr;
        return head;
    }

    ND* ptr = head;
    ND* prev = nullptr;

    while (ptr != nullptr) {
        if (ptr->data == el) {
            prev->next = ptr->next;
            delete ptr;
            break;
        }
        prev = ptr;
        ptr = ptr->next;
    }
    return head;
}

ND* search(ND* head, int val){
    ND* ptr = head;
    int count = 0;
    bool found = false;

    while (ptr != nullptr) {
        if (ptr->data == val) {
            cout << "Found " << ptr->data << " at position " << count << endl;
            found = true;
        }
        ptr = ptr->next;
        count++;
    }

    if (!found) cout << "Element " << val << " not found in the list." << endl;
    return head;
}

void randomDelete() {
    int loc;
    cout << "\nEnter the location of the node after which you want to perform deletion: ";
    cin >> loc;

    if (head == nullptr) {
        cout << "\nList is empty" << endl;
        return;
    }

    ND* ptr = head;
    ND* prev = nullptr;

    for (int i = 0; i < loc; i++) {
        if (ptr == nullptr || ptr->next == nullptr) {
            cout << "\nLocation out of bounds, can't delete." << endl;
            return;
        }
        prev = ptr;
        ptr = ptr->next;
    }

    if (ptr == nullptr) {
        cout << "\nCan't delete" << endl;
        return;
    }

    prev->next = ptr->next;
    delete ptr;
    cout << "\nDeleted node at location: " << loc << endl;
}

void traverseList() {
    ND* ptr = head;
    cout << "List contents: ";
    while (ptr != nullptr) {
        cout << ptr->data << " ";
        ptr = ptr->next;
    }
    cout << endl;
}

int main() {
    beginInsert(1);  // Insert at the beginning
    lastInsert(2);   // Insert at the end
    randomInsert(4, 0); // Insert at the beginning (again)
    traverseList();
    search(head, 2);
    // kinsert(head, 2, 69); // Insert after the 2nd position
    // traverseList();
    // randomDelete(); // Delete node at a random location
    // traverseList(); // Print the list to verify again

    // Clean up allocated memory
    ND* temp;
    while (head != nullptr) {
        temp = head;
        head = head->next;
        delete temp;
    }

    return 0;
}
