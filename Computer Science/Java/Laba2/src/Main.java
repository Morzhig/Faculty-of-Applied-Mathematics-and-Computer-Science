import java.io.*;
import java.util.Arrays;
import java.util.Scanner;
import java.util.*;

public class Main {

    //4. Среди строк заданной матрицы, содержащих только нечетные элементы
    // найти строку с максимальной суммой модулей элементов.
    static void zadanie4(int[][] matrix, int n) throws Exception {
        FileWriter fw = new FileWriter("zadanie4.txt");
        int[] sum = new int[n+1];
        int count = 0;

        for (int i = 1; i < n+1; i++) {
            for (int j = 1; j < n+1; j++) {
                if (matrix[i][j] % 2 == 0) {
                    j = n + 1;
                    sum[i] = 0;
                    count++;
                } else {
                    sum[i] += Math.abs(matrix[i][j]);
                    count = 0;
                }
            }
        }

        if (count != 0) {
            fw.write("There are no lines with only odd numbers.");
        } else {
            int maxI = 0;
            int max = sum[0];

            for (int i = 1; i < n + 1; i++) {
                if (sum[i] > max) {
                    max = sum[i];
                    maxI = i;
                }
            }

            fw.write("The line with the largest sum is: ");
            fw.write(Integer.toString(maxI));
        }

        fw.close();
    }

    //15. Найти максимальное из чисел, встречающихся в заданной матрице ровно два раза.
    static void zadanie15(int[][] matrix, int n) throws Exception {
        FileWriter fw = new FileWriter("zadanie15.txt");

        HashMap<Integer, Integer> counter = new HashMap<>();

        int max = 0, count = 0;

        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < n + 1; j++) {
                if (counter.containsKey(matrix[i][j])) {
                    count++;
                    counter.put(matrix[i][j], count);
                }
            }
        }

        System.out.println(counter);

        if (count == 0)
            fw.write("There were no needed numbers.");
        else
            fw.write("The biggest number which meets 2 times is: " + max);

        fw.close();
    }

    //26. Определить, становится ли симметричной (относительно главной диагонали)
    // заданная матрица после замены на число 0 каждого локального максимума.
    static void zadanie26(int[][] matrix, int n) throws Exception {
        FileWriter fw = new FileWriter("zadanie26.txt");

        boolean[][] temp = new boolean[n + 2][n + 2];

        for (int i = 0; i < n + 2; i++) {
            for (int j = 0; j < n + 2; j++) {
                temp[i][j] = false;
            }
        }

        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < n + 1; j++) {
                if (matrix[i][j] > matrix[i + 1][j] && matrix[i][j] > matrix[i - 1][j] &&
                        matrix[i][j] > matrix[i][j + 1] && matrix[i][j] > matrix[i][j - 1]) {
                    temp[i][j] = true;
                    j += 1;
                }
            }
        }

        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < n + 1; j++) {
                if (temp[i][j])
                    matrix[i][j] = 0;
            }
        }

        int flag = 0;
        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < n + 1; j++) {
                if (matrix[i][j] != matrix[j][i]) {
                    flag++;
                    i = n+1;
                    j = n+1;
                }
            }
        }

        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < n + 1; j++)
                fw.write(Integer.toString(matrix[i][j]) + " ");
            fw.write("\r\n");
        }

        if (flag != 0)
            fw.write("It's not symmetrical.");
        else
            fw.write("It's symmetrical.");

        fw.close();
    }

    public static void main(String[] args) throws Exception {
        FileReader fr = new FileReader("input.txt");
        Scanner fin = new Scanner(fr);

        int n = fin.nextInt();

        int[][] matrix = new int[n + 2][n + 2];

        for (int i = 0; i < n + 2; i++) {
            for (int j = 0; j < n + 2; j++) {
                matrix[i][j] = -2147483648;
            }
        }

        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < n + 1; j++)
                matrix[i][j] = fin.nextInt();
        }

        zadanie4(matrix, n);

        zadanie15(matrix, n);

        zadanie26(matrix, n);

        fr.close();
    }
}