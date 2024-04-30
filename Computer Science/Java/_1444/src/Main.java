import java.io.*;
import java.util.Scanner;
public class Main {
    public static void main(String[] args) throws Exception {
        FileWriter fw = new FileWriter("output.txt");
        FileReader fr = new FileReader("input.txt");
        Scanner scan = new Scanner(fr);

        int x, y;
        int n = scan.nextInt();
        int m = scan.nextInt();
        int mines = scan.nextInt();
        int[][] matrix = new int[n + 2][m + 2];

        for (int i = 0; i < n + 2; i++) {
            for (int j = 0; j < m + 2; j++) {
                matrix[i][j] = 0;
            }
        }

        while (mines != 0) {
            x = scan.nextInt();
            y = scan.nextInt();
            matrix[x][y] = -1;
            mines--;
        }

        int element = 0;

        for (int i = 1; i < n + 1; i++)
            for (int j = 1; j < m + 1; j++) {
                if (matrix[i][j] == -1) {
                    element = 0;
                } else {
                    if (matrix[i - 1][j - 1] == -1) {
                        element++;
                    }
                    if (matrix[i - 1][j] == -1) {
                        element++;
                    }
                    if (matrix[i - 1][j + 1] == -1) {
                        element++;
                    }
                    if (matrix[i][j - 1] == -1) {
                        element++;
                    }
                    if (matrix[i][j + 1] == -1) {
                        element++;
                    }
                    if (matrix[i + 1][j - 1] == -1) {
                        element++;
                    }
                    if (matrix[i + 1][j] == -1) {
                        element++;
                    }
                    if (matrix[i + 1][j + 1] == -1) {
                        element++;
                    }

                    matrix[i][j] = element;
                    element = 0;
                }
            }

        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < m + 1; j++) {
                if (matrix[i][j] != -1) {
                    fw.write(Integer.toString(matrix[i][j]));
                    fw.write(" ");
                } else {
                    fw.write("*");
                    fw.write(" ");
                }
            }
            fw.write("\n");
        }
        fr.close();
        fw.close();
    }
}