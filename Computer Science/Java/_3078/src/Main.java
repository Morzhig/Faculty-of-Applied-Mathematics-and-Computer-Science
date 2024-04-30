import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {
        FileReader fr = new FileReader("input.txt");
        FileWriter fw = new FileWriter("output.txt");
        Scanner fin = new Scanner(fr);

        int n, temp, count = 0, count1 = 0, cout1 = 0, cout = 0;

        n = fin.nextInt();
        temp = fin.nextInt();

        while (fin.hasNextInt()) {
            if (temp == 0 || n == 0) {
                if (cout > cout1) {
                    fw.write(Integer.toString(cout + 1));
                    fw.close();
                }
                else {
                    fw.write(Integer.toString(cout1 + 1));
                    fw.close();
                }
                return;
            }
            if (n > temp) {
                count++;
                cout = count;
                count1 = 0;
            } else if (n < temp) {
                count1++;
                cout1 = count1;
                count = 0;
            } else {
                count = 0;
                count1 = 0;
            }

            n = temp;
            temp = fin.nextInt();
        }

        if (count > count1) {
            fw.write(Integer.toString(cout + 1));
            fw.close();
        }
        else {
            fw.write(Integer.toString(cout1 + 1));
            fw.close();
        }

        fr.close();
    }
}