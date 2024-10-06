#include <bits/stdc++.h>
using namespace std;

struct DNode {
    int info;
    struct DNode* next;
    struct DNode* prev;
};
typedef DNode DN;
    DN* lp = nullptr;
    DN* rp = nullptr;

DN* create(DN* ptr) {
    char choice;
    
    cout << "Do you want to create a new node? (y/n): ";
    cin >> choice;
    
    if (choice == 'n' || choice == 'N') {
        return nullptr;
    }

    ptr = new DN; // Create the first node
    cout << "Input value of this node: ";
    cin >> ptr->info;
    ptr->next = nullptr;
    ptr->prev = nullptr;
    lp = ptr;  // Save the lp pointer

    cout << "Do you want to create another node? (y/n): ";
    cin >> choice;

    while (choice == 'y' || choice == 'Y') {
        rp = new DN;
        cout << "Input value of this node: ";
        cin >> rp->info;
        rp->next = nullptr;
        rp->prev = ptr;
        ptr->next = rp;
        ptr = rp;

        cout << "Do you want to create another node? (y/n): ";
        cin >> choice;
    }

    return lp;
}

void display(DN* lp) {
    DN* rp = lp;
    while (rp != nullptr) {
        cout << rp->info << " ";
        rp = rp->next;
    }
    cout << endl;
}

int main() {
    DN* lp = nullptr;
    lp = create(lp);
    display(lp);

    // Free allocated memory
    DN* current = lp;
    DN* nextNode = nullptr;
    while (current != nullptr) {
        nextNode = current->next;
        delete current;
        current = nextNode;
    }
    return 0;
}
