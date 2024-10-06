#include <iostream>
#include <fstream>
#include <algorithm>
#include <string>

using namespace std;

const int MAX_SIZE = 1000;

// Template Function Prototypes
template <typename T>
void loadDataFromFile(const string& filename, T data[], int& size);

template <typename T>
void displayData(const T data[], int size);

template <typename T>
int linearSearch(const T data[], int size, const T& key);

template <typename T>
void insertionSort(T data[], int size);

template <typename T>
void selectionSort(T data[], int size);

template <typename T>
void bubbleSort(T data[], int size);

template <typename T>
void quickSort(T data[], int low, int high);

template <typename T>
int partition(T data[], int low, int high);

// Custom swap function
template <typename T>
void sana_swap(T& a, T& b);

// Menu function to handle data types
void menu();

int main() {
    menu();
    return 0;
}

// Function to load data from file
template <typename T>
void loadDataFromFile(const string& filename, T data[], int& size) {
    ifstream file(filename);
    size = 0;
    while (file >> data[size]) {
        size++;
    }
}

// Function to display data
template <typename T>
void displayData(const T data[], int size) {
    for (int i = 0; i < size; i++) {
        cout << data[i] << " ";
    }
    cout << endl;
}

// Linear Search
template <typename T>
int linearSearch(const T data[], int size, const T& key) {
    for (int i = 0; i < size; i++) {
        if (data[i] == key) {
            return i;
        }
    }
    return -1;
}

// Insertion Sort
template <typename T>
void insertionSort(T data[], int size) {
    for (int i = 1; i < size; i++) {
        T key = data[i];
        int j = i - 1;
        while (j >= 0 && data[j] > key) {
            data[j + 1] = data[j];
            j--;
        }
        data[j + 1] = key;
        cout<<"current array after sort \n";
           displayData(data,size);
           cout<<endl;
    }
}

// Selection Sort
template <typename T>
void selectionSort(T data[], int size) {
    for (int i = 0; i < size - 1; i++) {
        int minIndex = i;
        for (int j = i + 1; j < size; j++) {
            if (data[j] < data[minIndex]) {
                minIndex = j;
            }
        }
        sana_swap(data[i], data[minIndex]);
        cout<<"current array after sort \n";
           displayData(data,size);
           cout<<endl;
    }
}

// Bubble Sort
template <typename T>
void bubbleSort(T data[], int size) {
    bool swapped;
    for (int i = 0; i < size - 1; i++) {
        swapped = false;
        for (int j = 0; j < size - i - 1; j++) {
            if (data[j] > data[j + 1]) {
                sana_swap(data[j], data[j + 1]);
                swapped = true;
                
            }
        }
        // cout<<"current array after sort \n";
        //    displayData(data,size);
        //    cout<<endl;
        if (!swapped) break;
    }
}

// Quick Sort
template <typename T>
void quickSort(T data[], int low, int high) {
    int size = high;
    if (low < high) {
        int pi = partition(data, low, high);
        quickSort(data, low, pi - 1);
        quickSort(data, pi + 1, high);
    }
    cout<<"current array after sort \n";
           displayData(data,size);
           cout<<endl;
}

// Partition for Quick Sort
template <typename T>
int partition(T data[], int low, int high) {
    T pivot = data[high];
    int i = low - 1;
    for (int j = low; j < high; j++) {
        if (data[j] < pivot) {
            i++;
            sana_swap(data[i], data[j]);
        }
    }
    sana_swap(data[i + 1], data[high]);
    return i + 1;
}

// Custom swap function
template <typename T>
void sana_swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// Menu function
void menu() {
    int choice, size = 0;
    int intData[MAX_SIZE];
    string stringData[MAX_SIZE];
    char charData[MAX_SIZE];
    
    string filename;
    cout << "Enter filename: ";
    cin >> filename;

    // Data type selection
    cout << "Choose the data type:\n1. Integer\n2. String\n3. Character\n";
    int dataType;
    cin >> dataType;

    if (dataType == 1) {
        loadDataFromFile(filename, intData, size);
    } else if (dataType == 2) {
        loadDataFromFile(filename, stringData, size);
    } else if (dataType == 3) {
        loadDataFromFile(filename, charData, size);
    } else {
        cout << "Invalid choice, exiting.\n";
        return;
    }

    while (true) {
        cout << "\nChoose an algorithm:\n";
        cout << "1. Linear Search\n";
        cout << "2. Insertion Sort\n";
        cout << "3. Selection Sort\n";
        cout << "4. Bubble Sort\n";
        cout << "5. Quick Sort\n";
        cout << "6. Display Data\n";
        cout << "7. Exit\n";
        cin >> choice;

        if (dataType == 1) {
            switch (choice) {
                case 1: {
                    int key;
                    cout << "Enter key to search: ";
                    cin >> key;
                    cout << "Key found at index: " << linearSearch(intData, size, key) << "\n";
                    break;
                }
                case 2:
                    insertionSort(intData, size);
                    cout << "Data sorted using Insertion Sort.\n";
                    break;
                case 3:
                    selectionSort(intData, size);
                    cout << "Data sorted using Selection Sort.\n";
                    break;
                case 4:
                    bubbleSort(intData, size);
                    cout << "Data sorted using Bubble Sort.\n";
                    break;
                case 5:
                    quickSort(intData, 0, size - 1);
                    cout << "Data sorted using Quick Sort.\n";
                    break;
                case 6:
                    displayData(intData, size);
                    break;
                case 7:
                    return;
                default:
                    cout << "Invalid choice.\n";
            }
        } else if (dataType == 2) {
            switch (choice) {
                case 1: {
                    string key;
                    cout << "Enter key to search: ";
                    cin >> key;
                    cout << "Key found at index: " << linearSearch(stringData, size, key) << "\n";
                    break;
                }
                case 2:
                    insertionSort(stringData, size);
                    cout << "Data sorted using Insertion Sort.\n";
                    break;
                case 3:
                    selectionSort(stringData, size);
                    cout << "Data sorted using Selection Sort.\n";
                    break;
                case 4:
                    bubbleSort(stringData, size);
                    cout << "Data sorted using Bubble Sort.\n";
                    break;
                case 5:
                    quickSort(stringData, 0, size - 1);
                    cout << "Data sorted using Quick Sort.\n";
                    break;
                case 6:
                    displayData(stringData, size);
                    break;
                case 7:
                    return;
                default:
                    cout << "Invalid choice.\n";
            }
        } else if (dataType == 3) {
            switch (choice) {
                case 1: {
                    char key;
                    cout << "Enter key to search: ";
                    cin >> key;
                    cout << "Key found at index: " << linearSearch(charData, size, key) << "\n";
                    break;
                }
                case 2:
                    insertionSort(charData, size);
                    cout << "Data sorted using Insertion Sort.\n";
                    break;
                case 3:
                    selectionSort(charData, size);
                    cout << "Data sorted using Selection Sort.\n";
                    break;
                case 4:
                    bubbleSort(charData, size);
                    cout << "Data sorted using Bubble Sort.\n";
                    break;
                case 5:
                    quickSort(charData, 0, size - 1);
                    cout << "Data sorted using Quick Sort.\n";
                    break;
                case 6:
                    displayData(charData, size);
                    break;
                case 7:
                    return;
                default:
                    cout << "Invalid choice.\n";
            }
        }
    }
}
