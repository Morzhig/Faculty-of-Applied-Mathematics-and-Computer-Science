#include <iostream>
#include <vector>
#include <algorithm>

int main()
{
    std::vector<int> v1(10);

    for (int i = 0; i < 10; i++)
        v1[i] = i;

    sort(v1.begin(), v1.end());

    for (int i = 0; i < 10; i++)
        std::cout << v1[i] << ' ';
    
    std::cout << std::endl;

    std::cout << v1[v1.size() / 2];
}