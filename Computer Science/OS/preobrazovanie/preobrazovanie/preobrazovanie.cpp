#include <iostream>
#include <fstream>
#include <string>

int main()
{
    std::ifstream in("in.txt");
    std::ofstream out("out.txt");

    int x, y, z;

    in >> x >> y >> z;

    std::string A;
    std::string B;

    in >> A >> B;

    int n = A.size();
    int m = B.size();

    int** mas = new int*[n + 1];

    for (int i = 0; i < n + 1; i++)
    {
        mas[i] = new int[m + 1];
        for (int j = 0; j < m + 1; j++)
        {
            mas[i][j] = 0;
        }
    }

    for (int i = 1; i < n + 1; i++)
    {
        mas[i][0] = i * x;

        for (int j = 1; j < m + 1; j++)
            mas[0][j] = j * y;
    }

    for (int i = 1; i < n + 1; i++)
    {
        for (int j = 1; j < m + 1; j++)
        {
            if (A[i-1] == B[j-1])
                mas[i][j] = std::min(std::min(mas[i - 1][j] + x, mas[i][j - 1] + y), mas[i - 1][j - 1]);
            else
                mas[i][j] = std::min(std::min(mas[i - 1][j] + x, mas[i][j - 1] + y), mas[i - 1][j - 1] + z);
        }
    }

    for (int i = 0; i < n + 1; i++)
    {
        for (int j = 0; j < m + 1; j++)
            std::cout << mas[i][j] << ' ';
        std::cout << std::endl;
    }

}
