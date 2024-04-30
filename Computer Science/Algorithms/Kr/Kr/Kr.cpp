#include <iostream>
#include <fstream>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n, m;
    int temp = 0;
    int tmp1 = 0;
    int tmp2 = 0;
    int ans = 0;

    in >> n >> m;

    int** mas = new int* [n + 1];

    for (int i = 0; i < n + 1; i++)
    {
        mas[i] = new int[m + 1];

        for (int j = 0; j < m + 1; j++)
            mas[i][j] = 0;
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
            in >> mas[i][j];
    }

    if (m == 1)
    {
        for (int i = 0; i < n; i++)
        {
            temp += mas[i][0];
        }

        out << temp;

        return 0;
    }

    for (int i = 1; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            if (j == 0)
            {
                tmp1 = std::min(mas[i - 1][j + 1], mas[i - 1][j]);
                mas[i][j] += tmp1;
            }

            else if (j < m)
            {
                tmp2 = std::min(mas[i - 1][j], mas[i - 1][j - 1]);
                mas[i][j] += tmp2;
            }

            else
                mas[i][j] += std::min(std::min(mas[i - 1][j], mas[i - 1][j - 1]), mas[i - 1][j + 1]);
        }
    }

    ans = mas[n - 1][0];

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            std::cout << mas[i][j] << ' ';
        }
        std::cout << std::endl;
    }

    for (int j = 0; j < m; j++)
    {
        if (ans > mas[n - 1][j])
            ans = mas[n - 1][j];
    }

    std::cout << ans;
}
