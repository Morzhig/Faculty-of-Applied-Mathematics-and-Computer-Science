import java.io.*;
import java.util.Scanner;
import java.util.StringTokenizer;

//4. В тексте слова заданной длины заменить указанной подстрокой, длина которой может не совпадать с длиной слова.
public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Enter your string: ");
        String str = in.nextLine();

        int n = 0;
        System.out.print("Words of what length should we change: ");
        n = in.nextInt();

        System.out.print("What would you like to change it for: ");
        Scanner in1 = new Scanner(System.in);
        String new_ = in1.nextLine();

        String temp = str;
        StringTokenizer st = new StringTokenizer(temp, " \t\n\r,.");

        while(st.hasMoreTokens()){
            String tmp = st.nextToken();
            if (tmp.length() == n) {
                temp = temp.replaceAll(tmp, new_);
            }
        }
        if (str.equals(temp)) {
            System.out.print("There are no such words.");
        }
        else {
            System.out.print("New string is: ");
            System.out.println(temp);
        }
    }
}