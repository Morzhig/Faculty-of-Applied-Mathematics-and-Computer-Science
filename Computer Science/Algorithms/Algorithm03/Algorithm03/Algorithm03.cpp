#include <iostream>
#include <fstream>
#include <climits>

using namespace std;

class TNode
{
public:
    TNode()
    {
        Key = 0;
        min = LLONG_MIN;
        max = LLONG_MAX;
        stroka = 0;
        pos = ' ';
    }

    long long min;
    long long max;
    long long Key;
    int stroka;
    char pos;
};

int main()
{
    ifstream fin("input.txt");
    ofstream fout("output.txt");

    TNode* mas;
    int count;

    fin >> count;

    mas = new TNode[count + 1];

    fin >> mas[1].Key;

    for (int i = 2; i < count + 1; i++)
    {
        fin >> mas[i].Key >> mas[i].stroka >> mas[i].pos;
    }

    for(int i = 2; i < count + 1; i++)
    {
        if (mas[i].pos == 'L')
        {
            mas[i].min = mas[mas[i].stroka].min;
            mas[i].max = mas[mas[i].stroka].Key;
        }

        if (mas[i].pos == 'R')
        {
            mas[i].min = mas[mas[i].stroka].Key;
            mas[i].max = mas[mas[i].stroka].max;
        }

        if (mas[i].Key < mas[i].min || mas[i].Key >= mas[i].max)
        {
            fout << "NO";
            return 0;
        }
    }

    fout << "YES";

    return 0;
}