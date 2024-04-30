#include <iostream>
#include <fstream>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n, u, v;

    in >> n;

    int* p = new int[n + 1];

    for (int i = 0; i < n + 1; i++)
        p[i] = 0;

    for (int i = 1; i < n + 1; i++)
    {
        in >> u >> v;

        p[v] = u;
    }

    for (int i = 1; i < n + 1; i++)
        std::cout << p[i] << ' ';
}
