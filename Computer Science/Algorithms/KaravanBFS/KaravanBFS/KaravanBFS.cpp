#include <iostream>
#include <fstream>
#include <queue>

std::ifstream in("input.txt");
std::ofstream out("output.txt");

bool* visited;
int** p;
int* res;
int i = 0;

std::queue<int> q;

void bfs(int pred[], int start, int n)
{
    visited[start] = true;
    q.push(start);

    while (!q.empty())
    {
        int v = q.front();

        pred[v] = i + 1;

        q.pop();

        for (int u = 0; u < n; u++)
        {
            if (p[v][u] == 1 && !visited[u])
            {
                visited[u] = true;

                q.push(u);
            }
        }
    }
}

int main()
{
    int n, v;

    in >> n;

    int x1, y1, x2, y2;

    in >> x1 >> y1 >> x2 >> y2;

    p = new int* [n];
    visited = new bool[n];
    int* pred = new int[n];

    for (int i = 0; i < n; i++)
    {
        p[i] = new int[n];
        visited[i] = false;
        pred[i] = -1;

        for (int j = 0; j < n; j++)
            in >> p[i][j];
    }

    for (int i = 0; i < n; i++)
    {
        if (pred[i] == -1)
            bfs(pred, i, n);
    }

    for (int i = 0; i < n; i++)
    {
        if (pred[i] == -1)
            out << i + 1;
        else
            out << pred[i] << ' ';
    }
}