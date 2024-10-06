#include <bits/stdc++.h>
using namespace std;

struct Node{
int info;
struct Node* next;

};
typedef struct Node ND;
ND* start = nullptr;
//pprototype of push method
int push (ND* ptr, int item){
    if (ptr == nullptr){
        cout<< "list is empty";
        ptr = new ND;
        ptr->next = nullptr;
        ptr->info = item;
        start = ptr;
    }
    else{
        ptr->next = new ND;
        if (ptr->next == nullptr){
            cout<< "overflow";
            return 0;
        }
        ptr = ptr->next;
        ptr->info = item;
    }
    return 0;
}
void display(ND* start) {
    if (start == nullptr) {
        cout << "Stack is empty" << endl;
        return;
    }

    ND* ptr = start;
    while (ptr != nullptr) {
        cout << ptr->info << " ";
        ptr = ptr->next;
    }
    cout << endl;
}

int main() {
    push(start, 10);
    push(start, 20);
    push(start, 30);
    display(start);

    return 0;
}