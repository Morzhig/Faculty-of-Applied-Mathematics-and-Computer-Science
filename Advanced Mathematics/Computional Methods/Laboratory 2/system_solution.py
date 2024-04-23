import numpy as np

def single_division_scheme(a, B, n):
    A = np.copy(a)
    b = np.copy(B)
    
    for i in range(n):
        if A[i, i] == 0:
            print('Деление на ноль невозможно')
            break

        for k in range(i + 1, n):
            q = A[k, i] / A[i, i]

            for j in range(n):
                A[k, j] -= q * A[i, j]
            b[k] -= q * b[i]        
    
    x1 = np.zeros((n, 1), dtype='float')
    x1[n - 1] = b[n - 1, 0] / A[n - 1, n - 1]

    for i in range(n - 2, -1, -1):
        sum = 0

        for j in range(i + 1, n):
            sum += A[i, j] * x1[j]

        x1[i] = (b[i, 0] - sum) / A[i, i]

    x1 = np.reshape(x1, (n, 1))
    
    return x1