#include <iostream>
using namespace std;

struct Node {
    int info;
    Node* next;
};

typedef Node ND;
ND* start = nullptr;

void create();
void display(ND*);

void create() {
    ND* ptr = new ND;
    cout << "Enter the info for the first node: ";
    cin >> ptr->info;
    ptr->next = nullptr;
    start = ptr;

    char ch;
    cout << "Do you want to add more nodes (y/n)? ";
    cin >> ch;
    while (ch == 'y' || ch == 'Y') {
        ND* newNode = new ND;
        cout << "Enter the info for the next node: ";
        cin >> newNode->info;
        newNode->next = nullptr;

        ptr->next = newNode;
        ptr = newNode;

        cout << "Do you want to add more nodes (y/n)? ";
        cin >> ch;
    }
}
 void sorting(ND* start)
 {ND* prev;
 int temp;
    ND* ptr;
    ptr = start;
    if(start == NULL){
        cout <<"list is empty" << endl;
        return;
    }
    else {
    while (ptr ->next != NULL){
        prev = ptr;
        ptr = ptr -> next;
        if (prev->info>ptr->info){
            temp = ptr->info; 
            ptr->info = prev->info;
            prev->info = temp;
            sorting(start);
        }
        
    }
    }

 }

void display(ND* ptr) {
    while (ptr != nullptr) {
        cout << ptr->info << " ";
        ptr = ptr->next;
    }
    cout << endl;
}

int main() {
    create();
    cout <<"before sortings" << endl;
    display(start);
    
    sorting(start);
    cout << "AFTER SORTING" << endl;
    display(start);
    return 0;
}