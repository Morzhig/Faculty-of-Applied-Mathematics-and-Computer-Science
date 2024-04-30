import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;

public class main {
    public static void main(String[] args) throws IOException {
        Gson gson = new Gson();

        BufferedReader br = new BufferedReader(new FileReader("input.json"));
        FileWriter fw = new FileWriter("output.json");

        BookShelf A1 = new BookShelf(5);
        BookShelf _json = gson.fromJson(br, BookShelf.class);

        A1.input();
        System.out.println("\nКниги из обычного файла:");
        A1.print();

        A1.unite(_json);
        System.out.println("\nПолный список:");
        A1.print();
        System.out.println();

        A1.Author_sort();
        System.out.println("Список, отсортированный по авторам: ");
        A1.print();
        System.out.println();

        String key = "Михаил Булгаов";
        try {
            int n = A1.binsearch_A(key);
            System.out.println("Номер книги автора " + key + " " + A1.shelf[n - 1].Name + ": " + n + '\n');
        }
        catch(Exception ex) {
            System.out.println("Здесь нет книги автора " + key + '\n');
        }

        A1.Name_sort();
        System.out.println("Список, отсортированный по названиям: ");
        A1.print();
        System.out.println();

        String key2 = "Собачье сердце";
        try {
            int n = A1.binsearch_N(key2);
            System.out.println("Номер книги c названием " + key2 + " " + A1.shelf[n - 1].Author + ": " + n + '\n');
        }
        catch (Exception ex) {
            System.out.println("Здесь нет книги c названием " + key2.toString() + '\n');
        }

        A1.filter_('М');

        FileWriter fwtxt = new FileWriter("output.txt");
        A1.group_by_Author(fwtxt);

        fw.write(gson.toJson(A1));
        fw.close();
        fwtxt.close();
    }
}
