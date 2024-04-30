#include <iostream>
#include <fstream>

int* parent;
int* size;

void _init_(int n)
{
    parent = new int[n];
    size = new int[n];

    for (int i = 0; i < n; i++)
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

    if (size[x] < size[y])
    {
        int temp = x;
        x = y;
        y = temp;
    }

    else
    {
        parent[y] = x;
        size[x];
    }

    return true;
}

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n, q;

    in >> n >> q;

    int u, v, count = n;

    _init_(n);

    for (int i = 0; i < q; i++)
    {
        in >> u >> v;

        if (Union(u - 1, v - 1))
            count--;

        std::cout << count << std::endl;
    }
}