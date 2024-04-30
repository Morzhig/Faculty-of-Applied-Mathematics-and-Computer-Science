#include <iostream>
#include <fstream>
#include <queue>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n, sumt = 0, sum = 0;

    in >> n;

    int p;
    std::priority_queue<int, std::vector<int>, std::greater<int>> q;

    for (int i = 0; i < n; i++)
    {
        in >> p;
        q.push(p);
    }

    while (q.size() != 1)
    {
        int tmp = q.top();
        q.pop();
        int tmp_ = q.top();
        q.pop();
        q.push(tmp+tmp_);

        sum += tmp + tmp_;
    }

    std::cout << sum;
}