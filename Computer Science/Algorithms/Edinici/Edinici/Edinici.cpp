#include <iostream>
#include <fstream>
#include <cmath>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("ouput.txt");

    int n = 0, k = 0, sum = 0;

    std::cin >> n >> k;

    if (n < k)
    {
        std::cout << 0;
        return 0;
    }

    int** mas = new int* [n + 1];

    for (int i = 0; i < n + 1; i++)
        mas[i] = new int[n + 1];

    for (int i = 0; i < n + 1; i++)
    {
        for (int j = 0; j < n + 1; j++)
            mas[i][j] = 0;
    }

    for (int i = 0; i < n + 1; i++)
    {
        for (int j = 0; j < n + 1; j++)
        {
            if (i > 0 && j > 0 && j < i)
                mas[i][j] = mas[i - 1][j - 1] % int((pow(10, 9) + 7)) + mas[i - 1][j] % int((pow(10, 9) + 7));

            else if (i == j)
                mas[i][j] = 1;

            else if (i > 0 && j == 0)
                mas[i][j] = 1;

        }
    }

    int answer = mas[n][k] % int((pow(10, 9) + 7));

    std::cout << answer;
}