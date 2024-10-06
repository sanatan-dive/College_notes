#include <bits/stdc++.h>

using namespace std;


int add(int *a, int lindex, int E) {
    int i = 0;
    if (lindex == 0) {
        a[lindex] = E;
        return lindex + 1;
    } else {
        for (i = 0; i < lindex; i++) {
            if (E < a[i]) {
                for (int j = lindex; j > i; j--) {
                    a[j] = a[j - 1];
                }
                a[i] = E;
                return lindex + 1;
            }
        }
        a[lindex] = E;
        return lindex + 1;
    }
}


void display(int *a, int lindex) {
    for (int i = 0; i < lindex; i++) {
        cout << a[i] << " ";
    }
    cout << endl;
}


int deleteElement(int *a, int lindex, int E) {
    int i;
    if (i == lindex) {
        return lindex;
        }
        else {
    for (i = 0; i < lindex; i++) {
        if (a[i] == E) {
            break;
        }
    }
    for (int j = i; j < lindex - 1; j++) {
        a[j] = a[j + 1];
    }
    return lindex - 1;
        }
    }


int findMax(int *a, int lindex) {
    int max = a[0];
    for (int i = 0; i < lindex; i++) {
        if (a[i] > max) {
            max = a[i];
        }
    }
    return max;
}


int findMin(int *a, int lindex) {
    int min = a[0];
    for (int i = 0; i < lindex; i++) {
        if (a[i] < min) {
            min = a[i];
        }
    }
    return min;
}



void updateElement(int *a, int lindex, int oldValue, int newValue) {
    int *position = NULL;
    for (int i = 0; i < lindex; i++) {
        if (a[i] == oldValue) {
            position = &a[i];
            break;
        }
    }
    if (position == NULL) {
        cout << "Value not found!" << endl;
        return;
    }
    *position = newValue;

    sort(a, a + lindex);
}



int insert(int *a, int lindex, int E, int index) {
    if (index < 0 || index > lindex) {
        cout << "Index out of bounds!" << endl;
        return lindex;
    }
    for (int i = lindex; i > index; i--) {
        a[i] = a[i - 1];
    }
    a[index] = E;
    return lindex + 1;
}

int main() {
    int max = 100;
    int arr[max];
    int lindex = 0;

    lindex = add(arr, lindex, 9);
    lindex = add(arr, lindex, 6);
    lindex = add(arr, lindex, 3);
    lindex = add(arr, lindex, 8);

    cout << "Array after adding elements: ";
    display(arr, lindex);

    lindex = deleteElement(arr, lindex, 6);
    cout << "Array after deleting element 6: ";
    display(arr, lindex);

    int maxElement = findMax(arr, lindex);
    cout << "Maximum element: " << maxElement << endl;

    int minElement = findMin(arr, lindex);
    cout << "Minimum element: " << minElement << endl;

    updateElement(arr, lindex, 3, 5);
    cout << "Array after updating index 1 to 5: ";
    display(arr, lindex);

    lindex = insert(arr, lindex, 7, 2);
    cout << "Array after inserting 7 at index 2: ";
    display(arr, lindex);

    return 0;
}
