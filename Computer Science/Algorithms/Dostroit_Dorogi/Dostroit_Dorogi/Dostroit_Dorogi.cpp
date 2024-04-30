#include <iostream>
#include <fstream>

int* parent;
int* size;

void _init_(int n)
{
    parent = new int[n + 1];
    size = new int[n + 1];

    for (int i = 0; i < n + 1; i++)
    {
        parent[i] = i;
        size[i] = 1;
    }
}

int FindSet(int x)
{
    if (x == parent[x])
        return x;

    parent[x] = FindSet(parent[x]);
    return parent[x];
}

bool Union(int x, int y)
{
    x = FindSet(x);
    y = FindSet(y);

    if (x == y)
        return false;

    else
    {
        if (size[x] < size[y])
        {
            int temp = x;
            x = y;
            y = temp;
        }

        parent[y] = x;
        size[x] += size[y];
    }

    return true;
}

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n, m;

    in >> n >> m;

    int u, v, count = n;

    _init_(n);

    while (count != 0)
    {
        for (int i = 0; i < m; i++)
        {
            in >> u >> v;

        if (Union(u - 1, v - 1))
            count--;
    }

    std::cout << count - 1;
}