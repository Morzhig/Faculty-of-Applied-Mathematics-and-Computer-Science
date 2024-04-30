#define _CRT_SECURE_NO_WARNINGS
#include "Header.h"

int main(int argc, char* argv[])
{
    char filename[100];
    strcpy(filename, argv[1]);

    char report_filename[100];
    strcpy(report_filename, argv[2]);

    int salary = strtod(argv[3], nullptr);

    vector<employee> employees = binaryread(filename);
    ofstream out(report_filename);

    for (int i = 0; i < employees.size(); i++)
        out << employees[i].num << ' ' << employees[i].name << ' ' << employees[i].hours << ' ' << salary;
}