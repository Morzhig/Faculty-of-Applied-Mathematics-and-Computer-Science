import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.Arrays;
import java.util.stream.Collectors;

public class BookShelf {
    public Book[] shelf;
    public int size;
    public int count;

    Comparator<Book> comparator = new Comparator<Book>() {
        @Override
        public int compare(Book o1, Book o2) {
            return o1.Name.compareTo(o2.Name);
        }
    };

    public BookShelf() {
        size = 0;
        count = 0;
        shelf = new Book[size];
    }

    public BookShelf(int size_) {
        size = size_;
        count = 0;
        shelf = new Book[size];
    }

    public void input() throws FileNotFoundException {
        Scanner in = new Scanner(new FileReader("input.txt"));

        String Name;
        String Author;

        while (in.hasNextLine()) {
            Name = in.nextLine();
            Author = in.nextLine();

            Book book = new Book(Name, Author);

            add(book);
        }
    }

    public void add(Book book) {
        try {
            shelf[count] = book;
            count++;
        } catch (ArrayIndexOutOfBoundsException ex) {
            System.out.println("\nToo many books. No other books will be added");
        }
    }

    public void unite(BookShelf bs) {
        try {
            for (int i = 0; i < bs.count; i++) {
                shelf[count] = bs.shelf[i];
                count++;
            }
        } catch (ArrayIndexOutOfBoundsException ex) {
            System.out.println("\nToo many books. No other books will be added.");
        }
    }

    public Book pop() {
        Book temp = shelf[size - 1];
        size--;
        return temp;
    }

    public void Name_sort() { Arrays.sort(shelf, comparator); }

    public void Author_sort() { Arrays.sort(shelf); }

    public int binsearch_A(String key) throws Exception {
        int k = Arrays.binarySearch(shelf, new Book("", key)) + 1;

        if (k > 0)
            return k;
        else
            throw new Exception();
    }

    public int binsearch_N(String key) throws Exception {
        int k = Arrays.binarySearch(shelf, new Book(key, ""), comparator) + 1;

        if (k > 0)
            return k;
        else
            throw new Exception();
    }

    public void print() {
        for (int i = 0; i < count; i++)
            System.out.println(shelf[i]);
    }

    public void group_by_Name() {
        Map<Object, List<Book>> group = Arrays.asList(shelf)
                .stream()
                .collect(Collectors.groupingBy(s -> s.Name));

        System.out.println("Books grouped by names: " + ' ' + group);
    }

    public void group_by_Author(FileWriter fw) throws IOException {
        Map<Object, List<Book>> group = Arrays.asList(shelf)
                .stream()
                .collect(Collectors.groupingBy(s -> s.Author));

        fw.write("Books grouped by authors:\n" + group);
    }

    public void filter_(char A) {
        System.out.println("Книги автором, имена которых начинаются на букву " + A + ":");

        List<Book> filter_ = Arrays.asList(shelf);
        filter_.stream().filter(s -> s.Author.charAt(0) == A).forEach(Book::print);
    }
}
