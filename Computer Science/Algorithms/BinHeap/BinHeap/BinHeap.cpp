#include <iostream>
#include <fstream>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    unsigned long long n, ans = 0;

    in >> n;

    while (n)
    {
        if (n % 2 == 1)
            out << ans << std::endl;

        n /= 2;
        ans++;
    }
}