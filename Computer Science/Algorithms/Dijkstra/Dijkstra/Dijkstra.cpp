#include <iostream>
#include <fstream>
#include <vector>
#include<queue>

bool* processed;
long long* dist;
long long n;

std::vector<std::vector<std::pair<long long, long long>>> g;

void distances(long long start)
{
    std::priority_queue<std::pair<long long, long long>, std::vector<std::pair<long long, long long>>, std::greater<>> q;

    q.push(std::make_pair(0, start));

    while (!q.empty())
    {
        long long v = q.top().second;
        long long dv = q.top().first;

        q.pop();

        if (processed[v])
            continue;

        processed[v] = true;
        dist[v] = dv;

        for (std::pair<long long, long long> tmp: g[v])
        {
            long long u = tmp.first;
            long long cu = tmp.second;

            if (!processed[u] && (dv + cu < dist[u]))
                q.push(std::make_pair(dv + cu, u));
        }
    }
}

long long main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    long long m;

    in >> n >> m;

    g.resize(n + 1);

    dist = new long long[n + 1];
    processed = new bool[n + 1];

    for (long long i = 0; i < n + 1; i++)
    {
        dist[i] = long long_MAX;
        processed[i] = false;
    }

    long long u, v, w;

    for (long long i = 0; i < m; i++)
    {
        in >> u >> v >> w;

        g[u].push_back(std::make_pair(v, w));
        g[v].push_back(std::make_pair(u, w));
    }

    //for (long long i = 1; i < n + 1; i++)
    //{
    //    for (std::pair<long long, long long> v: g[i])
    //        std::cout << i << ' ' << v.first << ' ' << v.second << ' ';

    //    std::cout << std::endl;
    //}

    for(long long i = 1; i < n + 1; i++)
        if(!processed[i])
            distances(i);

    out << dist[n];
}