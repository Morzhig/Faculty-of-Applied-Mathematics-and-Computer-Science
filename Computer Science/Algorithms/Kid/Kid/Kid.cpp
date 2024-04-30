#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

class duga
{
public:

    int a, b, c;

    duga()
    {
        a = 0;
        b = 0;
        c = 0;
    }
};

int main()
{
    ifstream in("input.txt");
    ofstream out("output.txt");

    int n, l, k, q;

    in >> n >> l >> k >> q;

    int matr[100][100];
    int* c = new int[n];

    for (int i = 0; i < n; i++)
        in >> c[i];

    int num; 

    in >> num;

    duga* dugi = new duga[num];

    for (int i = 0; i < num; i++)
        in >> dugi[i].a >> dugi[i].b >> dugi[i].c;

    matr[l][k] = 1;

    if()
}