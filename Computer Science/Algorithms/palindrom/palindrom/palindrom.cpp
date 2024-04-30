#include <iostream>
#include <fstream>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    char temp;

    int n = 0;

    char* str = new char[7000];

    while (in >> temp)
    {
        str[n] = temp;
        n++;
    }

    int** mas = new int* [n + 1];

    if (n == 1)
    {
        out << n << std::endl;
        out << str[0];
        return 0;
    }

    if (n == 2)
    {
        if (str[1] == str[0])
            out << n << std::endl << str[0] << str[1];
        else
            out << 1 << std::endl << str[0];
        return 0;
    }

    for (int i = 0; i < n + 1; i++)
    {
        mas[i] = new int[n + 1];

        for (int j = 0; j < n + 1; j++)
            mas[i][j] = 0;

        mas[i][i] = 1;
    }

    mas[0][0] = 0;

    for (int j = 2; j < n + 1; j++)
    {
        for (int i = j - 1; i > 0; i--)
        {
            if (str[i - 1] == str[j - 1])
            {
                mas[i][j] = mas[i + 1][j - 1] + 2;
            }
            else
            {
                mas[i][j] = std::max(mas[i + 1][j], mas[i][j - 1]);
            }
        }
    }

    //for (int i = 1; i < n + 1; i++)
    //{
    //    for (int j = 1; j < n + 1; j++)
    //        std::cout << mas[i][j] << ' ';
    //    std::cout << std::endl;
    //}

    int ans = mas[1][n];

    char* pal = new char[n + 1];

    int i = 1, j = n, c = 0;

    for (int i = 0; i < n + 1; i++)
        pal[i] = 0;

    out << ans << std::endl;

    if (ans == 1)
    {
        out << str[0];
        return 0;
    }

    while (j >= i)
    {
        while (mas[i + 1][j] == mas[i][j] && i < n)
            i++;

        while (mas[i][j - 1] == mas[i][j] && j > 0)
            j--;

        pal[c] = str[j - 1];
        i++;
        j--;
        c++;
    }

    if (ans % 2 == 1)
    {
        for (int i = 0; i < c; i++)
            out << pal[i];
        for (int i = c - 2; i >= 0; i--)
            out << pal[i];
    }
    else
    {
        for (int i = 0; i < c; i++)
            out << pal[i];
        for (int i = c - 1; i >= 0; i--)
            out << pal[i];
    }
}