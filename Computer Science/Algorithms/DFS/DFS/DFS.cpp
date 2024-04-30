#include <iostream>
#include <fstream>
#include <queue>

std::ifstream in("input.txt");
std::ofstream out("output.txt");

bool* visited;
int** p;
int i = 1;

void dfs(int pred[], int v, int n)
{
    if (!visited[v])
    {
        pred[v] = i;
        i++;
    }

    visited[v] = true;

    for (int u = 0; u < n; u++)
    {
        if (p[v][u] && !visited[u])
        {
            pred[u] = v;

            dfs(pred, u, n);
        }
    }
}
int main()
{
    int n, v;

    in >> n;

    int* pred = new int[n];
    p = new int* [n];
    visited = new bool[n];

    for (int i = 0; i < n; i++)
    {
        p[i] = new int[n];
        visited[i] = false;
        pred[i] = -1;

        for (int j = 0; j < n; j++)
            in >> p[i][j];
    }

    dfs(pred, 0, n);

    for (int i = 0; i < n; i++)
    {   
        if(pred[i] == -1)
            out << i + 1;
        else
            out << pred[i] << ' ';
}