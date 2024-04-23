param n;
param m;

param A{i in 1..n, j in 1..m};
param c{i in 1..m};
param b{i in 1..n};

var x{1..m} >= 0;

maximize Cost: 
	sum{i in 1..m} c[i] * x[i];

subject to constraints {i in 1..n}:
    sum{j in 1..m} x[j] * A[i, j] <= b[i];
