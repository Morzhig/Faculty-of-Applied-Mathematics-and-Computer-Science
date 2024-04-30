#include <iostream>
#include <fstream> 
#include <string>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n, q;

    in >> n;

    int* A = new int[n];

    for (int i = 0; i < n; i++)
        in >> A[i];

    in >> q;

    std::string req;
    int a = 0;
    int b = 0;
    int sum = 0;
    int count = 0;

    for (int i = 0; i < q; i++)
    {
        in >> req >> a >> b;

        if (req == "FindSum")
        {
            for (int j = a; j < b; j++)
                sum += A[j];

            std::cout << sum << std::endl;
            sum = 0;
        }

        else
            A[a] += b;
    }
}