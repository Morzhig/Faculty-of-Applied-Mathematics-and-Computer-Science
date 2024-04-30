#include <iostream>
#include <fstream>

int max(int mas[], int n)
{
    int temp = mas[0];
    int ind = 0;

    for (int i = 0; i < n; i++)
    {
        if (mas[i] > temp && mas[i] != 2147483647)
        {
            temp = mas[i];
            ind = i;
        }
    }

    return ind;
}

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n = 0;

    in >> n;

    if (n == 1)
    {
        out << 1;
        return 0;
    }

    int* mas = new int[n];

    for (int i = 0; i < n; i++)
        in >> mas[i];

    int* f = new int[n + 1];

    for (int i = 1; i < n + 1; i++)
        f[i] = 2147483647;

    f[0] = -2147483648;

    int temp = 0;

    for (int i = 0; i < n; i++)
    {
        int j = std::upper_bound(f + 1, f + n + 1, mas[i]) - f;

        if (f[j - 1] < mas[i] && mas[i] < f[j])
            f[j] = mas[i];
    }

    out << max(f, n + 1);
}