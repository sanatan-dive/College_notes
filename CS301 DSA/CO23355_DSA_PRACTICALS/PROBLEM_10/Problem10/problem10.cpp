#include <iostream>
#include <fstream> // For file handling
#include <cstdlib> // For rand() and srand()
#include <ctime>   // For time()
using namespace std;

// Function to display the hash table
void displayHashTable(int hashTable[], int M) {
    cout << "Hash Table:" << endl;
    for (int i = 0; i < M; i++) {
        if (hashTable[i] == -1)
            cout << "Index " << i << ": Empty" << endl;
        else
            cout << "Index " << i << ": Key " << hashTable[i] << endl;
    }
}

// Function to insert a key using linear probing
void insertKey(int hashTable[], int M, int key) {
    int index = key % M; // Calculate hash
    int startIndex = index; // To detect cycles in full tables

    while (hashTable[index] != -1) { // Resolve collision using linear probing
        index = (index + 1) % M;
        if (index == startIndex) {
            cout << "Hash Table is full. Cannot insert key " << key << endl;
            return;
        }
    }
    hashTable[index] = key; // Store key
    cout << "Key " << key << " inserted at index " << index << endl;
}

// Function to generate random 4-digit keys and save to file
void generateRandomKeysToFile(const string& filename, int numKeys) {
    ofstream file(filename); // Open the file for writing
    if (!file) {
        cout << "Error: Could not open file for writing." << endl;
        return;
    }

    srand(time(0)); // Seed random number generator
    for (int i = 0; i < numKeys; i++) {
        int key = rand() % 9000 + 1000; // Generate a random 4-digit number
        file << key << endl; // Write the key to the file
    }

    cout << numKeys << " random keys generated and saved to " << filename << endl;
}

// Main function
int main() {
    int M; // Size of hash table
    cout << "Enter the size of the hash table (M): ";
    cin >> M;
    
    // Ensure that M is within reasonable bounds (2-digit)
    if (M <= 0 || M > 100) {
        cout << "Hash table size M must be between 1 and 100." << endl;
        return 1;
    }

    int hashTable[M]; // Declare the hash table as an array
    for (int i = 0; i < M; i++) {
        hashTable[i] = -1; // Initialize the hash table with -1 (empty slots)
    }

    // Prompt user for input method in a do-while loop
    char inputChoice;
    do {
        cout << "\nChoose input method:\n";
        cout << "1. Read keys from file (EMP.dat)\n";
        cout << "2. Enter keys manually\n";
        cout << "3. Generate random keys and save to EMP.dat\n";
        cout << "4. Exit\n";
        cout << "Enter your choice (1/2/3/4): ";
        cin >> inputChoice;

        if (inputChoice == '1') {
            // File input
            ifstream file("EMP.dat"); // Open the file EMP.dat
            if (!file.is_open()) {
                cout << "Error: Could not open EMP.dat. Please check the file path." << endl;
                return 1; // Exit if the file cannot be opened
            } else {
                cout << "File opened successfully." << endl;
            }

            cout << "Reading keys from EMP.dat..." << endl;
            int key;
            while (file >> key) { // Read each key from the file
                cout << "Read key: " << key << endl; // Debugging line
                if (key >= 1000 && key <= 9999) { // Check if the key is 4-digit
                    insertKey(hashTable, M, key); // Insert each valid key into the hash table
                } else {
                    cout << "Skipping invalid key: " << key << " (not a 4-digit number)" << endl;
                }
            }
            file.close(); // Close the file after reading

        } else if (inputChoice == '2') {
            // Manual input
            char choice;
            do {
                int key;
                cout << "Enter a 4-digit key to insert: ";
                cin >> key;
                if (key >= 1000 && key <= 9999) { // Check if the key is 4-digit
                    insertKey(hashTable, M, key); // Insert the key
                } else {
                    cout << "Invalid key! Please enter a 4-digit number only." << endl;
                }
                cout << "Do you want to add another key? (y/n): ";
                cin >> choice;
            } while (choice == 'y' || choice == 'Y');

        } else if (inputChoice == '3') {
            // Generate random keys and save to file
            int numKeys;
            cout << "Enter the number of random keys to generate: ";
            cin >> numKeys;

            generateRandomKeysToFile("EMP.dat", numKeys); // Generate and save random keys

        } else if (inputChoice == '4') {
            cout << "Exiting program..." << endl;
            break; // Exit the loop and end the program

        } else {
            cout << "Invalid choice! Please select a valid option." << endl;
        }

    } while (true); // Continue until the user chooses to exit

    // Display the hash table
    displayHashTable(hashTable, M);

    return 0;
}
