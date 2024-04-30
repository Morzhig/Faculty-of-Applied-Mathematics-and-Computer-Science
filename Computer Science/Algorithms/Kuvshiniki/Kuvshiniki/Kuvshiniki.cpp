#include <iostream>
#include <fstream>

using namespace std;

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	int n;

	in >> n;

	if (n == 2)
	{
		out << "-1";
		return 0;
	}

	int* mas1 = new int[n];
	int* mas2 = new int[n];

	for (int i = 0; i < n; i++)
		in >> mas1[i];

	if (n == 1) 
	{
		out << mas1[0];
		return 0;
	}

	mas2[0] = mas1[0];
	mas2[1] = -1;
	mas2[2] = mas1[0] + mas1[2];

	for (int i = 3; i < n; i++) 
	{
		mas2[i] = max(mas2[i - 3], mas2[i - 2]) + mas1[i];
	}

	out << mas2[n - 1];

	return 0;
}
