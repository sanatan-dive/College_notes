#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// Function to check if a number is prime
bool isPrime(int num) {
    if (num <= 1) return false;
    for (int i = 2; i * i <= num; ++i) {
        if (num % i == 0) return false;
    }
    return true;
}

// Pre-existing prime numbers from 1 to 100
vector<int> primeNumbers() {
    vector<int> primes;
    for (int i = 1; i <= 100; ++i) {
        if (isPrime(i)) {
            primes.push_back(i);
        }
    }
    return primes;
}

// AVL Tree Node
struct AVLTreeNode {
    int key;
    AVLTreeNode* left;
    AVLTreeNode* right;
    int height;

    AVLTreeNode(int k) : key(k), left(nullptr), right(nullptr), height(1) {}
};

// B-tree Node
struct BTreeNode {
    vector<int> keys;
    vector<BTreeNode*> children;
    bool isLeaf;
    int numKeys;

    BTreeNode(int t, bool leaf = true) : isLeaf(leaf), numKeys(0) {
        keys.resize(2 * t - 1);
        children.resize(2 * t);
    }
};

// AVL Tree Class
class AVLTree {
private:
    AVLTreeNode* root;

    int height(AVLTreeNode* node) {
        return node ? node->height : 0;
    }

    AVLTreeNode* rightRotate(AVLTreeNode* y) {
        AVLTreeNode* x = y->left;
        AVLTreeNode* T2 = x->right;
        x->right = y;
        y->left = T2;
        y->height = max(height(y->left), height(y->right)) + 1;
        x->height = max(height(x->left), height(x->right)) + 1;
        return x;
    }

    AVLTreeNode* leftRotate(AVLTreeNode* x) {
        AVLTreeNode* y = x->right;
        AVLTreeNode* T2 = y->left;
        y->left = x;
        x->right = T2;
        x->height = max(height(x->left), height(x->right)) + 1;
        y->height = max(height(y->left), height(y->right)) + 1;
        return y;
    }

    int getBalance(AVLTreeNode* node) {
        return node ? height(node->left) - height(node->right) : 0;
    }

    AVLTreeNode* insert(AVLTreeNode* node, int key) {
        if (!node) return new AVLTreeNode(key);

        if (key < node->key) node->left = insert(node->left, key);
        else if (key > node->key) node->right = insert(node->right, key);
        else return node;

        node->height = max(height(node->left), height(node->right)) + 1;

        int balance = getBalance(node);

        if (balance > 1 && key < node->left->key) return rightRotate(node);
        if (balance < -1 && key > node->right->key) return leftRotate(node);
        if (balance > 1 && key > node->left->key) {
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
        if (balance < -1 && key < node->right->key) {
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }

        return node;
    }

    AVLTreeNode* deleteNode(AVLTreeNode* root, int key) {
        if (!root) return root;

        if (key < root->key) root->left = deleteNode(root->left, key);
        else if (key > root->key) root->right = deleteNode(root->right, key);
        else {
            if (!root->left || !root->right) {
                AVLTreeNode* temp = root->left ? root->left : root->right;
                delete root;
                return temp;
            }
            AVLTreeNode* temp = root->right;
            while (temp && temp->left) temp = temp->left;
            root->key = temp->key;
            root->right = deleteNode(root->right, temp->key);
        }

        root->height = max(height(root->left), height(root->right)) + 1;

        int balance = getBalance(root);

        if (balance > 1 && getBalance(root->left) >= 0) return rightRotate(root);
        if (balance > 1 && getBalance(root->left) < 0) {
            root->left = leftRotate(root->left);
            return rightRotate(root);
        }
        if (balance < -1 && getBalance(root->right) <= 0) return leftRotate(root);
        if (balance < -1 && getBalance(root->right) > 0) {
            root->right = rightRotate(root->right);
            return leftRotate(root);
        }

        return root;
    }

    bool search(AVLTreeNode* node, int key) {
        if (!node) return false;
        if (key == node->key) return true;
        if (key < node->key) return search(node->left, key);
        return search(node->right, key);
    }

    void printTree(AVLTreeNode* node, int space) {
        if (!node) return;
        space += 10;
        printTree(node->right, space);
        cout << endl;
        for (int i = 10; i < space; i++) cout << " ";
        cout << node->key << "\n";
        printTree(node->left, space);
    }

public:
    AVLTree() : root(nullptr) {}

    void insert(int key) {
        root = insert(root, key);
    }

    void deleteKey(int key) {
        root = deleteNode(root, key);
    }

    bool search(int key) {
        return search(root, key);
    }

    void printTree() {
        printTree(root, 0);
    }

    void insertKeys(const vector<int>& keys) {
        for (int key : keys) {
            insert(key);
        }
    }
};

// B-tree Class
class BTree {
private:
    BTreeNode* root;
    int degree;

    void insertNonFull(BTreeNode* node, int key) {
        int i = node->numKeys - 1;
        if (node->isLeaf) {
            while (i >= 0 && node->keys[i] > key) {
                node->keys[i + 1] = node->keys[i];
                i--;
            }
            node->keys[i + 1] = key;
            node->numKeys++;
        } else {
            while (i >= 0 && node->keys[i] > key) {
                i--;
            }
            i++;
            if (node->children[i]->numKeys == 2 * degree - 1) {
                splitChild(node, i);
                if (key > node->keys[i]) {
                    i++;
                }
            }
            insertNonFull(node->children[i], key);
        }
    }

    void splitChild(BTreeNode* parent, int i) {
        BTreeNode* fullChild = parent->children[i];
        BTreeNode* newNode = new BTreeNode(degree, fullChild->isLeaf);

        newNode->numKeys = degree - 1;
        for (int j = 0; j < degree - 1; j++) {
            newNode->keys[j] = fullChild->keys[j + degree];
        }
        if (!fullChild->isLeaf) {
            for (int j = 0; j < degree; j++) {
                newNode->children[j] = fullChild->children[j + degree];
            }
        }
        fullChild->numKeys = degree - 1;

        for (int j = parent->numKeys; j > i; j--) {
            parent->children[j + 1] = parent->children[j];
        }
        parent->children[i + 1] = newNode;

        for (int j = parent->numKeys - 1; j >= i; j--) {
            parent->keys[j + 1] = parent->keys[j];
        }
        parent->keys[i] = fullChild->keys[degree - 1];
        parent->numKeys++;
    }

    bool searchInTree(BTreeNode* node, int key) {
        int i = 0;
        while (i < node->numKeys && key > node->keys[i]) {
            i++;
        }
        if (i < node->numKeys && key == node->keys[i]) {
            return true;
        }
        if (node->isLeaf) return false;
        return searchInTree(node->children[i], key);
    }

    void printTree(BTreeNode* node, int space) {
        if (!node) return;
        space += 10;
        for (int i = node->numKeys - 1; i >= 0; i--) {
            printTree(node->children[i + 1], space);
            cout << endl;
            for (int j = 10; j < space; j++) cout << " ";
            cout << node->keys[i] << "\n";
        }
        printTree(node->children[0], space);
    }

public:
    BTree(int degree) : root(nullptr), degree(degree) {}

    void insert(int key) {
        if (!root) {
            root = new BTreeNode(degree, true);
            root->keys[0] = key;
            root->numKeys = 1;
        } else {
            if (root->numKeys == 2 * degree - 1) {
                BTreeNode* newRoot = new BTreeNode(degree, false);
                newRoot->children[0] = root;
                splitChild(newRoot, 0);
                int i = 0;
                if (newRoot->keys[0] < key) {
                    i++;
                }
                insertNonFull(newRoot->children[i], key);
                root = newRoot;
            } else {
                insertNonFull(root, key);
            }
        }
    }

    bool search(int key) {
        return searchInTree(root, key);
    }

    void printTree() {
        printTree(root, 0);
    }

    void insertKeys(const vector<int>& keys) {
        for (int key : keys) {
            insert(key);
        }
    }
};

// Main function
int main() {
    AVLTree avl;
    BTree btree(3);

    vector<int> primes = primeNumbers();

    avl.insertKeys(primes);
    btree.insertKeys(primes);

    int choice, key;
    while (true) {
        cout << "\nMenu:\n1. Insert in AVL Tree\n2. Insert in B-Tree\n3. Delete from AVL Tree\n4. Search in AVL Tree\n5. Search in B-Tree\n6. Print AVL Tree\n7. Print B-Tree\n8. Exit\nEnter choice: ";
        cin >> choice;

        switch (choice) {
            case 1:
                cout << "Enter key to insert in AVL Tree: ";
                cin >> key;
                avl.insert(key);
                break;

            case 2:
                cout << "Enter key to insert in B-Tree: ";
                cin >> key;
                btree.insert(key);
                break;

            case 3:
                cout << "Enter key to delete from AVL Tree: ";
                cin >> key;
                avl.deleteKey(key);
                break;

            case 4:
                cout << "Enter key to search in AVL Tree: ";
                cin >> key;
                if (avl.search(key)) cout << "Key found in AVL Tree.\n";
                else cout << "Key not found in AVL Tree.\n";
                break;

            case 5:
                cout << "Enter key to search in B-Tree: ";
                cin >> key;
                if (btree.search(key)) cout << "Key found in B-Tree.\n";
                else cout << "Key not found in B-Tree.\n";
                break;

            case 6:
                cout << "AVL Tree:\n";
                avl.printTree();
                break;

            case 7:
                cout << "B-Tree:\n";
                btree.printTree();
                break;

            case 8:
                exit(0);

            default:
                cout << "Invalid choice. Please try again.\n";
        }
    }

    return 0;
}