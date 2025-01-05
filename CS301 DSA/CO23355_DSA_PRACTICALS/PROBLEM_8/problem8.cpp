#include <iostream>
#define INF 99999
using namespace std;

int graph[7][7] = {
    {0, 1, 4, INF, INF, INF, INF},
    {1, 0, 2, 3, 10, INF, INF},
    {4, 2, 0, 6, INF, INF, 3},
    {INF, 3, 6, 0, 5, INF, 1},
    {INF, 10, INF, 5, 0, 7, 2}, 
    {INF, INF, INF, INF, 7, 0, 5}, 
    {INF, INF, 3, 1, 2, 5, 0} 
};
 
int visited[7];

// BFS Implementation
void BFS(int start) {
    int queue[100], front = 0, rear = 0;
    queue[rear++] = start;
    visited[start] = 1;
    
    cout << "BFS Traversal: ";
    while (front != rear) {
        int current = queue[front++];
        cout << char('a' + current) << " ";
        
        for (int i = 0; i < 7; i++) {
            if (graph[current][i] != INF && visited[i] == 0) {
                queue[rear++] = i;
                visited[i] = 1;
            }
        }
    }
    cout << endl;
}

// DFS Implementation
void DFS(int node) {
    visited[node] = 1;
    cout << char('a' + node) << " ";
    
    for (int i = 0; i < 7; i++) {
        if (graph[node][i] != INF && visited[i] == 0) {
            DFS(i);
        }
    }
}

// Prim's Algorithm Implementation
void PrimMST() {
    int parent[7], key[7], mstSet[7];
    
    for (int i = 0; i < 7; i++) {
        key[i] = INF;
        mstSet[i] = 0;
    }
    
    key[0] = 0;  // Start from node 'a'
    parent[0] = -1;
    
    for (int count = 0; count < 7 - 1; count++) {
        int min = INF, min_index;
        
        for (int v = 0; v < 7; v++) {
            if (mstSet[v] == 0 && key[v] < min) {
                min = key[v];
                min_index = v;
            }
        }
        
        int u = min_index;
        mstSet[u] = 1;
        
        for (int v = 0; v < 7; v++) {
            if (graph[u][v] && mstSet[v] == 0 && graph[u][v] < key[v]) {
                parent[v] = u;
                key[v] = graph[u][v];
            }
        }
    }
    
    cout << "Prim's MST:\n";
    for (int i = 1; i < 7; i++) {
        cout << char('a' + parent[i]) << " - " << char('a' + i) << "\n";
    }
}

// Find function for Kruskal's Algorithm 
int find(int parent[], int i) {
    while (parent[i] != i) {
        i = parent[i];
    }
    return i;
}

// Union function for Kruskal's Algorithm 
void Union(int parent[], int x, int y) {
    int rootX = find(parent, x);
    int rootY = find(parent, y);
    parent[rootX] = rootY;
}

// Kruskal's Algorithm Implementation
void KruskalMST() {
    int parent[7];
    for (int i = 0; i < 7; i++)
        parent[i] = i;

    cout << "Kruskal's MST:\n";

    // Sorted edges: (sorted based on weight manually for simplicity)
        int edges[21][3]; // Maximum possible edges in a complete graph with 7 nodes
    int edgeCount = 0;

    for (int i = 0; i < 7; i++) {
        for (int j = i + 1; j < 7; j++) {
            if (graph[i][j] != INF) {
                edges[edgeCount][0] = i; // u
                edges[edgeCount][1] = j; // v
                edges[edgeCount][2] = graph[i][j]; // weight
                edgeCount++;
            }
        }
    }

    // Sort edges based on weight (simple bubble sort for demonstration)
    for (int i = 0; i < edgeCount - 1; i++) {
        for (int j = 0; j < edgeCount - i - 1; j++) {
            if (edges[j][2] > edges[j + 1][2]) {
                // Swap edges[j] and edges[j + 1]
                for (int k = 0; k < 3; k++) {
                    swap(edges[j][k], edges[j + 1][k]);
                }
            }
        }
    }

    for (int i = 0; i < edgeCount; i++) {
        int u = edges[i][0];
        int v = edges[i][1];
        int u_set = find(parent, u);
        int v_set = find(parent, v);

        if (u_set != v_set) {
            cout << char('a' + u) << " - " << char('a' + v) << " (" << edges[i][2] << ")\n";
            Union(parent, u_set, v_set);
        }
    }
}

// Driver code
int main() {
    // Part (a): BFS and DFS
    cout << "(a) Graph Traversal from vertex 'a':\n";

    // BFS from vertex 'a'
    for (int i = 0; i < 7; i++) visited[i] = 0; // Reset visited array
    BFS(0); // Start BFS from vertex 'a' (index 0)

    // DFS from vertex 'a'
    for (int i = 0; i < 7; i++) visited[i] = 0; // Reset visited array
    cout << "DFS Traversal: ";
    DFS(0); // Start DFS from vertex 'a' (index 0)
    cout << endl;

    // Part (b): MST using Prim's and Kruskal's
    cout << "\n(b) Minimum Spanning Tree:\n";

    // Prim's MST
    PrimMST();

    // Kruskal's MST
    KruskalMST();

    return 0;
}