#include <iostream>
#include <fstream>

int main()
{
    std::ifstream in("input.txt");
    std::ofstream out("output.txt");

    int n = 0;

    in >> n;

    int* Heap = new int[n + 1];

    Heap[0] = 0;

    for (int i = 1; i < n + 1; i++)
        in >> Heap[i];

    int k = 0;

    for (int i = 2; i < n + 1; i++)
    {
        if (Heap[i] < Heap[i / 2])
        {
            std::cout << "No";
            return 0;
        }
    }

    std::cout << "Yes";
}