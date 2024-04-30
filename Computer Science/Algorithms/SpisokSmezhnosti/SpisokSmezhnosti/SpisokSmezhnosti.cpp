#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

int main()
{
    std::ifstream in("input.txt");  
    std::ofstream out("output.txt");

    int n, m, u , v;

    in >> n >> m;

    std::vector<std::vector<int>> sp(n+1);

    for (int i = 0; i < m; i++)
    {
        in >> u >> v;

        sp[u - 1].push_back(v);
        sp[v - 1].push_back(u);
    }

    for (int i = 0; i < n; i++)
    {
        out << sp[i].size() << ' ';
        
        for (int j = 0; j < sp[i].size(); j++)
            out << sp[i][j] << ' ';

        out << std::endl;
    }
}