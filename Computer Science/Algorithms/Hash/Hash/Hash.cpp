#include <iostream>
#include <fstream>
#include <queue>
#include <vector>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int m, c, n;

    in >> m >> c >> n;

    int key;
    int* h = new int[m];

    for (int i = 0; i < m; i++)
        h[i] = -1;

    while (in >> key)
    {
        int i = 0;
        int x = (key % m + c * i) % m;

        while (h[x] != -1)
        {
            if (h[x] == key)
                break;

            x = (key % m + c * i) % m;
            i++;
        }

        h[x] = key;
    }

    for (int i = 0; i < m; i++)
        out << h[i] << ' ';
}