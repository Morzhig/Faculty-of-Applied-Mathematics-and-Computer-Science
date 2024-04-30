#include <fstream>
#include <iostream>
#include <iomanip>
#include <windows.h>
#include <conio.h>
#include <string>
#include <vector>

using namespace std;

struct employee
{
    int num; // идентификационный номер сотрудника
    char name[10]; // имя сотрудника
    double hours; // количество отработанных часов

    employee()
    {
        num = 0;
        hours = 0;
        strcpy(name, "0");
    }

    friend istream& operator>>(istream& in, employee& emp)
    {
        in >> emp.num >> emp.name >> emp.hours;
        return in;
    }

    friend ostream& operator<<(ostream& out, const employee& emp)
    {
        out << emp.num << ' ' << emp.name << ' ' << emp.hours;
        return out;
    }

};

vector<employee> binaryread(char* filename)
{
    vector<employee> res;
    employee temp;

    ifstream in(filename, ifstream::in | ios::binary);

    if (in.is_open())
    {
        while (!in.eof())
        {
            in.read((char*)&temp, sizeof(temp));

            if (in.good())
            {
                res.push_back(temp);
            }
        }

        in.close();
    }
    else
    {
        cout << filename << " can't be opened." << endl;
    }

    return res;
}