%% Задание 1
matrix = [1 2 3; 4 5 6; 7 8 9];
matrix

% Замена 1-го элемента на 100
matrix(1, 1) = 100;
matrix

% Замена 3-й строки на 50
matrix(3, :) = 50;
matrix

% Замена 2-го столбца на 33
matrix(:, 2) = 33;
matrix


%% Задание 2
matrix = [5 5 5; 21 0 2; 21 0 2];
matrix

% Удаление первой строки
matrix(1, :) = [];
matrix

% Удаление второго столбца
matrix(:, 2) = [];
matrix


%% Задание 3
matrix = [1 1 1; 2 2 2; 3 3 3];
matrix

% Удаление двух строк
matrix(2:3, :) = [];
matrix

% Удаление двух последних элементов
matrix(:, 2:3) = [];
matrix


%% Задание 4
matrix = eye(5);
matrix


%% Задание 5
matrix1 = [1 1 1; 2 2 2; 3 3 3];

matrix2 = [3 4; 3 5; 3 6];

result = matrix1 * matrix2;
result


%% Задание 6
matrix = [1 2 3; 0 2 0; 0 0 3];
matrix

% Возведение в квадрат
matrix_s = matrix^2;
matrix_s

% Транспонирование
matrix_T = matrix';
matrix_T


%% Задание 7
x = linspace(0, 2*pi, 100);
y = exp(-x) .* sin(10*x);

plot(x, y);

xlabel('x');
ylabel('y');


%% Задание 8
x = linspace(0, 2*pi, 100);
y1 = sin(x);
y2 = cos(x);

plot(x, y1, x, y2);

xlabel('x');
ylabel('y');

grid on;


%% Задание 9
x = 0:0.01:2*pi;
f = 8*sin(x);
z = cos(2*x);

polarplot(x, f);
hold on;
polarplot(x, z);
hold off;

grid on;

