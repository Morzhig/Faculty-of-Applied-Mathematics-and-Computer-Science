#include <iostream>
#include <cmath>

long long mod = 1000000007;

long long fact(long long n)
{
    long long res = 1;

    for (int i = 1; i <= n; i++)
    {
        res *= i;
        res %= mod;
    }

    return res;
}

long long bin_pow(long long a, long long n) 
{
    if (n == 1) 
    {
        return a;
    }

    if (n % 2 == 0) 
    {
        long long ans = bin_pow(a, n / 2);

        return ans * ans % mod;
    }
    else 
    {
        long long ans = bin_pow(a, n - 1);

        return ans * a % mod;
    }
}

int main()
{
    long long n, k, answ;

    std::cin >> n >> k;

    long long ch, zn, zn_;

    ch = fact(n) % mod;
    zn = fact(k) % mod;
    zn_ = fact(n - k) % mod;

    zn *= zn_;
    zn %= mod;

    answ = ch * bin_pow(zn, mod - 2) % mod;

    std::cout << answ;
}