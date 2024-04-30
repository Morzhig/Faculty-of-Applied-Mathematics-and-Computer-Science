#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

int binsearch(int mas[], int key, int n)
{
    int l = 0;
    int r = n;

    while (l < r)
    {
        int m = (l + r) / 2;

        if (key == mas[m])
        {
            return 1;
        }
        else if (key < mas[m])
        {
            r = m;
        }
        else
        {
            l = m + 1;
        }
    }
    return 0;
}

int lowerBound(int mas[], int key, int n)
{
    int l = 0;
    int r = n;

    while (l < r)
    {
        int k = (l + r) / 2;

        if (key <= mas[k])
            r = k;
        else
            l = k + 1;
    }

    return l;
}

int upperBound(int mas[], int key, int n)
{
    int l = 0, r = n;

    while (l < r)
    {
        int k = (l + r) / 2;

        if (key < mas[k])
            r = k;
        else
            l = k + 1;
    }

    return l;
}

int main()
{
    ifstream in("input.txt");
    ofstream out("output.txt");

    int n, k, b = 0, l = 0, r = 0;

    in >> n;

    int* mas = new int[n];

    for (int i = 0; i < n; i++)
        in >> mas[i];

    sort(mas, mas + n);

    in >> k;

    int* zaprosi = new int[k];

    for (int j = 0; j < k; j++)
    {
        in >> zaprosi[j];
        cout << binsearch(mas, zaprosi[j], n) << ' ' << lowerBound(mas, zaprosi[j], n) << ' ' << upperBound(mas, zaprosi[j], n) << endl;
    }

    delete[]mas;
    delete[]zaprosi;

    return 0;
}