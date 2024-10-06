#include <iostream>
#include <fstream>
#include <cstring>
#include <chrono>

using namespace std;

// Define the StudentRecord structure
struct StudentRecord {
    int rollNumber;
    StudentRecord* next;
};

// Function to measure the time for various operations
void measureOperationsTime(int numNodes, const string& filename) {
    auto start = chrono::high_resolution_clock::now();

    // Measure insertion time
    StudentRecord* head = nullptr;
    for (int i = 0; i < numNodes; ++i) {
        StudentRecord* newStudent = new StudentRecord;
        newStudent->rollNumber = i;
        newStudent->next = head;
        head = newStudent;
    }

    auto end = chrono::high_resolution_clock::now();
    chrono::duration<double> insertTime = end - start;

    // Measure search time
    start = chrono::high_resolution_clock::now();

    StudentRecord* temp = head;
    while (temp != nullptr) {
        if (temp->rollNumber == numNodes / 2) { // Search for the middle element
            break;
        }
        temp = temp->next;
    }

    end = chrono::high_resolution_clock::now();
    chrono::duration<double> searchTime = end - start;

    // Measure deletion time
    start = chrono::high_resolution_clock::now();

    StudentRecord* current = head;
    StudentRecord* previous = nullptr;

    while (current != nullptr) {
        if (current->rollNumber == numNodes / 2) { // Delete the middle element
            if (previous != nullptr) {
                previous->next = current->next;
            } else {
                head = current->next;
            }
            delete current;
            break;
        }
        previous = current;
        current = current->next;
    }

    end = chrono::high_resolution_clock::now();
    chrono::duration<double> deleteTime = end - start;

    // Write data to file
    ofstream outFile(filename, ios::app);
    if (!outFile) {
        cerr << "Error opening file for writing!" << endl;
        return;
    }
    outFile << numNodes << " " << insertTime.count() << " " << searchTime.count() << " " << deleteTime.count() << "\n";
    outFile.close();
}

int main() {
    const int increment = 10000; // Number of nodes to add each time
    const int maxNodes = 100000; // Maximum number of nodes to test

    ofstream outFile("node_creation_times.dat");
    if (!outFile) {
        cerr << "Error opening file for writing!" << endl;
        return 1;
    }

    for (int i = increment; i <= maxNodes; i += increment) {
        measureOperationsTime(i, "node_creation_times.dat");
    }

    outFile.close();

    cout << "Data written to 'node_creation_times.dat'." << endl;

    // Call gnuplot to plot the graph
    system("gnuplot -e \"set terminal png; set output 'node_creation_times.png'; "
           "set title 'Number of Nodes vs. Time'; set xlabel 'Number of Nodes'; "
           "set ylabel 'Time (seconds)'; plot 'node_creation_times.dat' using 1:2 with linespoints title 'Creation Time', "
           "'node_creation_times.dat' using 1:3 with linespoints title 'Search Time', "
           "'node_creation_times.dat' using 1:4 with linespoints title 'Deletion Time'\"");

    cout << "Plot generated as 'node_creation_times.png'." << endl;

    return 0;
}
