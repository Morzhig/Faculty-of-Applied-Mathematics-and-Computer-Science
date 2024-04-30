#include <iostream>
#include <fstream>
#include <queue>
#include <ctime>

int main()
{
    std::ios_base::sync_with_stdio(false);

    unsigned int start_time = clock();
    
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    std::queue<std::pair<int, int>> q;

    int n, x1, y1, x2, y2;

    in >> n >> x1 >> y1 >> x2 >> y2;

    int** mas = new int* [n + 2];
    int** tmp = new int* [n + 2];

    for (int i = 0; i < n + 2; i++)
    {
        mas[i] = new int[n + 2];
        tmp[i] = new int[n + 2];

        for (int j = 0; j < n + 2; j++)
        {
            mas[i][j] = INT_MAX;

            tmp[i][j] = 0;
        }
    }

    for (int i = 1; i < n + 1; i++)
        for (int j = 1; j < n + 1; j++)
            in >> mas[i][j];

    int f, s;

    q.push({ x1, y1 });

    int i = 0;

    std::pair<std::pair<int, int>, int> p;

    while (!q.empty())
    {
        f = q.front().first;
        s = q.front().second;

        tmp[f][s] = mas[f][s];

        q.pop();

        if (mas[f][s] > mas[f + 1][s] && tmp[f + 1][s] == 0)
        {
            tmp[f + 1][s] = 1;

            q.push({ f + 1, s });
        }

        if (mas[f][s] > mas[f][s + 1] && tmp[f][s + 1] == 0)
        {
            tmp[f][s + 1] = 1;

            q.push({ f, s + 1 });
        }

        if (mas[f][s] > mas[f - 1][s] && tmp[f - 1][s] == 0)
        {
            tmp[f - 1][s] = 1;

            q.push({ f - 1, s });
        }

        if (mas[f][s] > mas[f][s - 1] && tmp[f][s - 1] == 0)
        {
            tmp[f][s - 1] = 1;

            q.push({ f, s - 1 });
        }
    }

    for (int i = 1; i < n + 1; i++)
    {
        for (int j = 1; j < n; j++)
            out << tmp[i][j] << ' ';

        out << tmp[i][n] << std::endl;
    }

    unsigned int end_time = clock(); // конечное время
    unsigned int search_time = end_time - start_time; // искомое время
    std::cout << search_time;
}