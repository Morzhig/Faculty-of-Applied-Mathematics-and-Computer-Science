#include <iostream>
#include <fstream>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n, m, u, v;

    in >> n >> m;

    int** mas = new int* [n];

    for (int i = 0; i < n; i++)
    {
        mas[i] = new int[n];

        for (int j = 0; j < n; j++)
            mas[i][j] = 0;
    }

    for (int i = 0; i < m; i++)
    {
        in >> u >> v;

        mas[u - 1][v - 1]++;
        mas[v - 1][u - 1]++;
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
            out << mas[i][j] << ' ';

        out << std::endl;
    }
}
