#include <iostream>
using namespace std;

struct Node {
    int data;
    Node *left;
    Node *right;
};

// Create a new node
Node *createNode(int data) {
    Node *newNode = new Node();
    newNode->data = data;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// Insert nodes based on user input
void insertNode(Node **root) {
    int value, direction;
    string input;

    if (*root == NULL) {
        cout << "Enter root node value: ";
        cin >> value;
        *root = createNode(value);
    }

    Node *temp = *root;
    while (true) {
        cout << "Enter the value to insert (x to end input): ";
        cin >> input;
        if (input == "X" || input == "x") break;

        value = stoi(input);

        // Check for duplicates by traversing the tree
        Node *check = *root;
        bool isDuplicate = false;
        while (check != NULL) {
            if (check->data == value) {
                isDuplicate = true;
                break;
            }
            check = (value < check->data) ? check->left : check->right;
        }

        if (isDuplicate) {
            cout << "Error: Duplicate value! Please enter a different value.\n";
            continue;
        }

        temp = *root;
        while (true) {
            cout << "Enter direction of node: right->2, left->1 (" << temp->data << "): ";
            cin >> direction;
            if (direction == 1) {
                if (temp->left == NULL) {
                    temp->left = createNode(value);
                    break;
                } else {
                    temp = temp->left;
                }
            } else if (direction == 2) {
                if (temp->right == NULL) {
                    temp->right = createNode(value);
                    break;
                } else {
                    temp = temp->right;
                }
            } else {
                cout << "Invalid direction! Try again.\n";
            }
        }
    }
}

// Print the tree in a human-readable format with slashes
void printTree(Node *root, int space) {
    if (root == NULL) return;

    int count = 4;

    // Print right child first
    if (root->right != NULL) {
        printTree(root->right, space + count);
        for (int i = 0; i < space + count - 2; i++) cout << " ";
        cout << " /\n";
    }

    // Print current node
    for (int i = 0; i < space; i++) cout << " ";
    cout << root->data << endl;

    // Print left child
    if (root->left != NULL) {
        for (int i = 0; i < space + count - 2; i++) cout << " ";
        cout << " \\\n";
        printTree(root->left, space + count);
    }
}

// Wrapper function to print the binary tree
void printBinaryTree(Node *root) {
    printTree(root, 0);
}

// Pre-order traversal
void preOrder(Node *root, int *array, int &index) {
    if (root != NULL) {
        array[index++] = root->data;
        preOrder(root->left, array, index);
        preOrder(root->right, array, index);
    }
}

// In-order traversal
void inOrder(Node *root, int *array, int &index) {
    if (root != NULL) {
        inOrder(root->left, array, index);
        array[index++] = root->data;
        inOrder(root->right, array, index);
    }
}

// Post-order traversal
void postOrder(Node *root, int *array, int &index) {
    if (root != NULL) {
        postOrder(root->left, array, index);
        postOrder(root->right, array, index);
        array[index++] = root->data;
    }
}

// Function to create a tree from Pre-order and In-order
Node *buildTreeFromPreIn(int preOrder[], int inOrder[], int inStart, int inEnd, int &preIndex) {
    if (inStart > inEnd) return NULL;

    Node *root = createNode(preOrder[preIndex]);
    preIndex++;

    if (inStart == inEnd) return root;

    int inIndex;
    for (inIndex = inStart; inIndex <= inEnd; inIndex++) {
        if (inOrder[inIndex] == root->data) break;
    }

    root->left = buildTreeFromPreIn(preOrder, inOrder, inStart, inIndex - 1, preIndex);
    root->right = buildTreeFromPreIn(preOrder, inOrder, inIndex + 1, inEnd, preIndex);
    return root;
}

// Function to create a tree from Post-order and In-order
Node *buildTreeFromPostIn(int postOrder[], int inOrder[], int inStart, int inEnd, int &postIndex) {
    if (inStart > inEnd) return NULL;

    Node *root = createNode(postOrder[postIndex]);
    postIndex--;

    if (inStart == inEnd) return root;

    int inIndex;
    for (inIndex = inStart; inIndex <= inEnd; inIndex++) {
        if (inOrder[inIndex] == root->data) break;
    }

    root->right = buildTreeFromPostIn(postOrder, inOrder, inIndex + 1, inEnd, postIndex);
    root->left = buildTreeFromPostIn(postOrder, inOrder, inStart, inIndex - 1, postIndex);
    return root;
}

int main() {
    Node *root = NULL;
    int choice;
    while (true) {
        cout << "\n=== Binary Tree Operations ===\n";
        cout << "1. Create Binary Tree\n";
        cout << "2. Build Tree from Pre-order and In-order\n";
        cout << "3. Build Tree from Post-order and In-order\n";
        cout << "4. Pre-order Traversal\n";
        cout << "5. In-order Traversal\n";
        cout << "6. Post-order Traversal\n";
        cout << "7. Print Binary Tree\n";
        cout << "8. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;
        switch (choice) {
            case 1:
                insertNode(&root);
                break;
            case 2: {
                int n;
                cout << "Enter number of elements in the tree: ";
                cin >> n;
                int preOrder[100], inOrder[100];
                cout << "Enter elements in Pre-order:\n";
                for (int i = 0; i < n; i++) {
                    cin >> preOrder[i];
                }
                cout << "Enter elements in In-order:\n";
                for (int i = 0; i < n; i++) {
                    cin >> inOrder[i];
                }
                int preIndex = 0;
                root = buildTreeFromPreIn(preOrder, inOrder, 0, n - 1, preIndex);
                cout << "Tree built successfully from Pre-order and In-order traversals.\n";
                printBinaryTree(root);
                cout << "\n";
                break;
            }
            case 3: {
                int n;
                cout << "Enter number of elements in the tree: ";
                cin >> n;
                int postOrder[100], inOrder[100];
                cout << "Enter elements in Post-order:\n";
                for (int i = 0; i < n; i++) {
                    cin >> postOrder[i];
                }
                cout << "Enter elements in In-order:\n";
                for (int i = 0; i < n; i++) {
                    cin >> inOrder[i];
                }
                int postIndex = n - 1;
                root = buildTreeFromPostIn(postOrder, inOrder, 0, n - 1, postIndex);
                cout << "Tree built successfully from Post-order and In-order traversals.\n";
                printBinaryTree(root);
                cout << "\n";
                break;
            }
            case 4: {
                int preOrderArray[100];
                int index = 0;
                preOrder(root, preOrderArray, index);
                cout << "Pre-order Traversal: ";
                for (int i = 0; i < index; i++) {
                    cout << preOrderArray[i] << " ";
                }
                cout << "\n";
                break;
            }
            case 5: {
                int inOrderArray[100];
                int index = 0;
                inOrder(root, inOrderArray, index);
                cout << "In-order Traversal: ";
                for (int i = 0; i < index; i++) {
                    cout << inOrderArray[i] << " ";
                }
                cout << "\n";
                break;
            }
            case 6: {
                int postOrderArray[100];
                int index = 0;
                postOrder(root, postOrderArray, index);
                cout << "Post-order Traversal: ";
                for (int i = 0; i < index; i++) {
                    cout << postOrderArray[i] << " ";
                }
                cout << "\n";
                break;
            }
            case 7:
                printBinaryTree(root);
                break;
            case 8:
                cout << "Exiting program.\n";
                return 0;
            default:
                cout << "Invalid choice. Please try again.\n";
        }
    }
}
