#include <iostream>
#include <fstream>
#include <algorithm>

int func(int mas[], int n)
{
    int** m = new int* [n];

    for (int i = 0; i < n; i++)
        m[i] = new int[n];

    for (int i = 0; i < n; i++)
        m[i][i] = 0;

    for (int l = 1; l < n; l++)
    {
        for (int i = 0; i < n - l; i++)
        {
            int j = i + l;

            m[i][j] = INT_MAX;

            for (int k = i; k < j; k++)
            {
                int cost = m[i][k] + m[k + 1][j] + mas[i] * mas[k + 1] * mas[j + 1];

                if (cost < m[i][j])
                    m[i][j] = cost;
            }
        }
    }

    return m[0][n - 1];
}

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int s;

    in >> s;

    int* A = new int[s + 1];

    in >> A[0];

    int tmp;

    for (int i = 1; i < s + 1; i++)
        in >> A[i] >> tmp;

    in >> A[s];

    out << func(A, s);
}