#include <iostream>
using namespace std;

#define SIZE 100

int S[SIZE];
int TOS = -1;

struct Node {
    int data;
    Node* next;
};

struct DNode {
    int data;
    DNode* next;
    DNode* prev;
};

Node* top = nullptr;

int Q[SIZE];
int frontA = -1;
int rearA = -1;

Node* frontL = nullptr;
Node* rearL = nullptr;

DNode* frontDL = nullptr;
DNode* rearDL = nullptr;
//! array implentation of stack

void PUSH_array(int stack[], int &top, int value, int size) {
    if (top == size - 1) {
        cout << "Stack Overflow (Array)\n";
    } else {
        stack[++top] = value;
    }
}

int POP_array(int stack[], int &top) {
    if (top == -1) {
        return 0;
    } else {
        return stack[top--];
    }
}

void displayStack_array(int stack[], int top) {
    if (top == -1) {
        cout << "Stack is empty (Array).\n";
    } else {
        for (int i = 0; i <= top; i++) {
            cout << stack[i] << " ";
        }
        cout << endl;
    }
}

void Traverse_array(int S[], int &TOS) {
    int BS[SIZE];
    int TOSB = 0;
    bool flag = false;

    while (true) {
        int Info = POP_array(S, TOS);
        if (Info == 0) {
            cout << "Underflow\n";
            flag = true;
            break;
        } else {
            BS[TOSB++] = Info;
        }
    }

    for (int i = TOSB - 1; i >= 0; i--) {
        PUSH_array(S, TOS, BS[i], SIZE);
    }

    if (flag && TOSB != 0) {
        cout << "Stack was modified due to underflow.\n";
    }
}

bool PEEK_array(int S[], int TOS, int PInfo) {
    int BS[SIZE];
    int TOSB = 0;
    bool found = false;

    while (true) {
        int Info = POP_array(S, TOS);
        if (Info == 0) {
            cout << "Underflow\n";
            break;
        } else if (Info != PInfo) {
            BS[TOSB++] = Info;
        } else {
            found = true;
            break;
        }
    }

    for (int i = TOSB - 1; i >= 0; i--) {
        PUSH_array(S, TOS, BS[i], SIZE);
    }

    return found;
}
//! linked list implentation of stack

void PUSH_linked(int value) {
    Node* newNode = new Node;
    newNode->data = value;
    newNode->next = top;
    top = newNode;
}

int POP_linked() {
    if (top == nullptr) {
        return 0;
    } else {
        Node* temp = top;
        int poppedValue = top->data;
        top = top->next;
        delete temp;
        return poppedValue;
    }
}

void displayStack_linked() {
    if (top == nullptr) {
        cout << "Stack is empty (Linked List).\n";
    } else {
        Node* temp = top;
        while (temp != nullptr) {
            cout << temp->data << " ";
            temp = temp->next;
        }
        cout << endl;
    }
}

void Traverse_linked() {
    Node* BS = nullptr;
    Node* current = top;

    cout << "Stack elements (from top to bottom): ";
    
    while (current != nullptr) {
        cout << current->data << " ";
        Node* newNode = new Node;
        newNode->data = current->data;
        newNode->next = BS;
        BS = newNode;

        current = current->next;
    }
    cout << endl;

    current = BS;
    while (current != nullptr) {
        PUSH_linked(current->data);
        Node* temp = current;
        current = current->next;
        delete temp;
    }
}

bool PEEK_linked(int PInfo) {
    Node* BS = nullptr;
    Node* current = top;
    bool found = false;

    while (current != nullptr) {
        if (current->data == PInfo) {
            found = true;
        }

        Node* newNode = new Node;
        newNode->data = current->data;
        newNode->next = BS;
        BS = newNode;

        current = current->next;
    }

    current = BS;
    while (current != nullptr) {
        PUSH_linked(current->data);
        Node* temp = current;
        current = current->next;
        delete temp;
    }

    return found;
}

//! array implentation of queue
void enqueue_array(int queue[], int &rear, int &front, int value) {
    if (rear == SIZE - 1) {
        cout << "Queue Overflow (Array)\n";
    } else {
        if (front == -1) front = 0;
        queue[++rear] = value;
    }
}

int dequeue_array(int queue[], int &rear, int &front) {
    if (front == -1 || front > rear) {
        return 0;
    } else {
        return queue[front++];
    }
}

void displayQueue_array(int queue[], int rear, int front) {
    if (front == -1 || front > rear) {
        cout << "Queue is empty (Array).\n";
    } else {
        for (int i = front; i <= rear; i++) {
            cout << queue[i] << " ";
        }
        cout << endl;
    }
}

//! single linked list implentation of queue
void enqueue_linked(int value) {
    Node* newNode = new Node;
    newNode->data = value;
    newNode->next = nullptr;
    if (rearL == nullptr) {
        frontL = rearL = newNode;
    } else {
        rearL->next = newNode;
        rearL = newNode;
    }
}

int dequeue_linked() {
    if (frontL == nullptr) {
        return 0;
    } else {
        int value = frontL->data;
        Node* temp = frontL;
        frontL = frontL->next;
        if (frontL == nullptr) rearL = nullptr;
        delete temp;
        return value;
    }
}

void displayQueue_linked() {
    if (frontL == nullptr) {
        cout << "Queue is empty (Linked List).\n";
    } else {
        Node* temp = frontL;
        while (temp != nullptr) {
            cout << temp->data << " ";
            temp = temp->next;
        }
        cout << endl;
    }
}

//! doubly linked list implentation of queue

void enqueue_dlinked(int value) {
    DNode* newNode = new DNode;
    newNode->data = value;
    newNode->next = nullptr;

    if (rearDL == nullptr) {
        newNode->prev = nullptr;
        frontDL = rearDL = newNode;
    } else {
        newNode->prev = rearDL;
        rearDL->next = newNode;
        rearDL = newNode;
    }
}

int dequeue_dlinked() {
    if (frontDL == nullptr) {
        return 0;
    } else {
        int value = frontDL->data;
        DNode* temp = frontDL;
        frontDL = frontDL->next;
        if (frontDL != nullptr) frontDL->prev = nullptr;
        else rearDL = nullptr;
        delete temp;
        return value;
    }
}

void displayQueue_dlinked() {
    if (frontDL == nullptr) {
        cout << "Queue is empty (Doubly Linked List).\n";
    } else {
        DNode* temp = frontDL;
        while (temp != nullptr) {
            cout << temp->data << " ";
            temp = temp->next;
        }
        cout << endl;
    }
}

int main() {
    int impl_choice, choice, value;

    cout << "Choose Implementation:\n";
    cout << "1. Stack\n";
    cout << "2. Queue\n";
    cout << "Enter your choice: ";
    cin >> impl_choice;

    if (impl_choice == 1) {
        int stack_impl;
        cout << "Choose Stack Implementation:\n";
        cout << "1. Array-based Stack\n";
        cout << "2. Singly Linked List-based Stack\n";
        cout << "Enter your choice: ";
        cin >> stack_impl;

        while (true) {
            cout << "\nMenu:\n";
            cout << "1. Push\n";
            cout << "2. Pop\n";
            cout << "3. Display Stack\n";
            cout << "4. Traverse\n";
            cout << "5. Peek\n";
            cout << "6. Exit\n";
            cout << "Enter your choice: ";
            cin >> choice;

            switch (choice) {
                case 1:
                    cout << "Enter value to push: ";
                    cin >> value;
                    if (stack_impl == 1) {
                        PUSH_array(S, TOS, value, SIZE);
                    } else {
                        PUSH_linked(value);
                    }
                    break;
                case 2:
                    if (stack_impl == 1) {
                        cout << "Popped: " << POP_array(S, TOS) << endl;
                    } else {
                        cout << "Popped: " << POP_linked() << endl;
                    }
                    break;
                case 3:
                    if (stack_impl == 1) {
                        displayStack_array(S, TOS);
                    } else {
                        displayStack_linked();
                    }
                    break;
                case 4:
                    if (stack_impl == 1) {
                        Traverse_array(S, TOS);
                    } else {
                        Traverse_linked();
                    }
                    break;
                case 5:
                    cout << "Enter value to peek: ";
                    cin >> value;
                    if (stack_impl == 1) {
                        cout << (PEEK_array(S, TOS, value) ? "Found" : "Not Found") << endl;
                    } else {
                        cout << (PEEK_linked(value) ? "Found" : "Not Found") << endl;
                    }
                    break;
                case 6:
                    exit(0);
                default:
                    cout << "Invalid choice!\n";
            }
        }
    } else if (impl_choice == 2) {
        int queue_impl;
        cout << "Choose Queue Implementation:\n";
        cout << "1. Array-based Queue\n";
        cout << "2. Singly Linked List-based Queue\n";
        cout << "3. Doubly Linked List-based Queue\n";
        cout << "Enter your choice: ";
        cin >> queue_impl;

        while (true) {
            cout << "\nMenu:\n";
            cout << "1. Enqueue\n";
            cout << "2. Dequeue\n";
            cout << "3. Display Queue\n";
            cout << "4. Exit\n";
            cout << "Enter your choice: ";
            cin >> choice;

            switch (choice) {
                case 1:
                    cout << "Enter value to enqueue: ";
                    cin >> value;
                    if (queue_impl == 1) {
                        enqueue_array(Q, rearA, frontA, value);
                    } else if (queue_impl == 2) {
                        enqueue_linked(value);
                    } else {
                        enqueue_dlinked(value);
                    }
                    break;
                case 2:
                    if (queue_impl == 1) {
                        cout << "Dequeued: " << dequeue_array(Q, rearA, frontA) << endl;
                    } else if (queue_impl == 2) {
                        cout << "Dequeued: " << dequeue_linked() << endl;
                    } else {
                        cout << "Dequeued: " << dequeue_dlinked() << endl;
                    }
                    break;
                case 3:
                    if (queue_impl == 1) {
                        displayQueue_array(Q, rearA, frontA);
                    } else if (queue_impl == 2) {
                        displayQueue_linked();
                    } else {
                        displayQueue_dlinked();
                    }
                    break;
                case 4:
                    exit(0);
                default:
                    cout << "Invalid choice!\n";
            }
        }
    } else {
        cout << "Invalid implementation choice.\n";
    }

    return 0;
}
