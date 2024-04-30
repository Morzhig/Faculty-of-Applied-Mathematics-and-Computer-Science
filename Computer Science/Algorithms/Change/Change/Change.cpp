#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

using namespace std;

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	int n, m, s;

	in >> n >> m >> s;

	if (n == 0)
		out << "No";

	int* h = new int[n + m];
	vector<int> sums;
	
	for (int i = 0; i < n + m; i++)
		in >> h[i];

	sums.push_back(0);
	sums.push_back(h[0]);

	int nm = n + m;
	int count = 0;
	int tmp = 0;

	for (int i = nm - 1; i > -1; i--)
		std::cout << h[i] << ' ';

	std::cout << std::endl;

	for (int i = nm - 1; i > 0; i--)
	{
		count = sums.size();
		
		sums.resize(count + 1);

		while (count > 0)
		{
			if (sums[count - 1] + h[i] == s)
			{
				std::cout << "Yes";
			}

			if (sums[count - 1] + h[i] <= s)
				sums.push_back(sums[count - 1] + h[i]);

			count--;
		}
	}

	for (int i = 0; i < sums.size(); i++)
		std::cout << sums[i] << ' ';

	out << "No";
}