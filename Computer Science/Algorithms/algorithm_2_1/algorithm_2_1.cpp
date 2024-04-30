#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    ifstream fin("input.txt");
    ofstream fout("output.txt");
    int n;
    int i;
    fin >> n;
    long long* mas = new long long[n];
    for (i = 0; i < n; i++)
    {
        fin >> mas[i];
    }
    int k;
    long long x;
    fin >> k;
    i /= 2;
    while (k != 0)
    {
        fin >> x;
        bool flag = false;
        int left = 0;
        int right = n; 
        int mid;
        while (left <= right && flag != true) 
        {
            mid = (left + right) / 2; 
            if (mas[mid] == x)
            {
                flag = true;
            }
            if (mas[mid] > x)
            {
                right = mid - 1;
            }
            else
            {
                left = mid + 1;
            }
        }
        k--;
        cout << mid << " " << left << " " << right << endl;
        while ()
        {

        }
        
        if (flag == true) 
        {
            fout << 1 << " ";
        }
        else
        {
            fout << 0 << " ";
        }
        fout << left << " " << right << endl;
    }
}
