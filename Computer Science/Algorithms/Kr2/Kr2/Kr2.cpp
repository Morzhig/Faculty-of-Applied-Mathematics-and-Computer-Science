#include <iostream>
#include <fstream>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n;
    int temp = 0;
    int ans = 0;

    in >> n;

    int* A = new int[n];
    int* A_ = new int[n];

    for (int i = 0; i < n; i++)
    {
        in >> A[i];
        A_[i] = 0;
    }

    if (n == 1)
    {
        out << 1;
        return 0;
    }

    if (n == 2)
    {
        if (A[1] % A[0] == 0)
            out << 2;
        else
            out << 1;
        return 0;
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < i; j++)
        {
            if (A[j] != 0)
            {
                if (A[i] % A[j] == 0)
                {
                    if (A_[j] > temp)
                        temp = A_[j];
                }
            }
        }
        A_[i] = temp + 1;

        if (ans < A_[i])
            ans = A_[i];
    }

    out << ans;
}
