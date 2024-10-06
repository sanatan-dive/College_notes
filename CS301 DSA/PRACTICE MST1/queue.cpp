#include <iostream>
using namespace std;

// Node structure for the doubly linked list
struct Node {
    int data;
    Node* next;
    Node* prev;
};

// Function to create a new node
Node* createNode(int value) {
    Node* newNode = new Node();
    newNode->data = value;
    newNode->next = nullptr;
    newNode->prev = nullptr;
    return newNode;
}

// Function to insert an element into the deque
void insert(Node*& front, Node*& rear, int value, int& f, int& r, int n) {
    // Check if deque is full
    if ((r == n && f == 1) || (r + 1 == f)) {
        cout << "Overflow" << endl;
        return;
    }

    // If deque is empty, initialize front and rear
    if (r == 0) {
        rear = createNode(value);
        front = rear;
        f = 1;
        r = 1;
    }
    // Insert at the rear if there's space
    else if (r < n) {
        Node* newNode = createNode(value);
        newNode->prev = rear;
        rear->next = newNode;
        rear = newNode;
        r++;
    }
    // Insert at the front if there's space
    else if (f > 1) {
        Node* newNode
