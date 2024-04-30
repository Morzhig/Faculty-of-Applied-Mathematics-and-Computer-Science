#include <iostream>
#include <algorithm>

int main()
{
	int n;

	std::cin >> n;

	int* s1 = new int[n];
	int* s2 = new int[n];

	for (int i = 0; i < n; i++)
		std::cin >> s1[i];

	for (int i = 0; i < n; i++)
		std::cin >> s2[i];

	int** mas = new int* [n + 1];

	for (int i = 0; i < n + 1; i++)
		mas[i] = new int[n + 1];

	for (int i = 0; i < n + 1; i++)
		for (int j = 0; j < n + 1; j++)
			mas[i][j] = 0;

	int* id1 = new int[n];
	int* id2 = new int[n];

	int k = 0, l = 0;

	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			k = i + 1;
			l = j + 1;

			if (s1[i] == s2[j])
				mas[k][l] = mas[k - 1][l - 1] + 1;
			else
			{
				if (mas[k - 1][l] > mas[k][l - 1])
					mas[k][l] = mas[k - 1][l];
				else
					mas[k][l] = mas[k][l - 1];
			}
		}
	}

	int temp = mas[n][n];

	std::cout << temp << std::endl;

	int c = 0;
	int i = n - 1, j = n - 1;

	while (mas[i + 1][j + 1] > 0)
	{
		if (s1[i] == s2[j])
		{
			id1[c] = i;
			id2[c] = j;

			i--;
			j--;
			c++;
		}

		else if (mas[i][j + 1] > mas[i + 1][j])
			i--;
		else
			j--;
	}

	for (int i = c - 1; i >= 0; i--)
		std::cout << id1[i] << ' ';

	std::cout << std::endl;

	for (int i = c - 1; i >= 0; i--)
		std::cout << id2[i] << ' ';

	std::cout << std::endl;
}