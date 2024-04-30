#include <iostream>
#include <fstream>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n;

    in >> n;

    int** p = new int* [n];
    int* mas = new int[n];

    for (int i = 0; i < n; i++)
    {
        p[i] = new int[n];

        mas[i] = 0;

        for (int j = 0; j < n; j++)
            in >> p[i][j];
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            if (p[j][i] == 1)
                mas[i] = j + 1;
        }
    }

    for (int i = 0; i < n; i++)
        std::cout << mas[i] << ' ';
}