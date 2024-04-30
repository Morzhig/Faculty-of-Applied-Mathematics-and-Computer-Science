#include<fstream>
#include <iostream>
int main() {
	std::ifstream in("input.txt");
	std::ofstream out("output.txt");
	int n;
	in >> n;
	int* a = new int[n];
	int* b = new int[n];
	if (n == 2) {
		out << "-1";
		return 0;
	}

	for (int i = 0; i < n; i++) {
		in >> a[i];
	}
	if (n == 1) {
		out << a[0];
		return 0;
	}
	b[0] = a[0];
	b[1] = -1;
	b[2] = a[2] + a[0];
	for (int i = 3; i < n; i++) {
		b[i] = std::max(b[i - 2], b[i - 3]) + a[i];
	}
	std::cout << b[n - 1];
	return 0;
}