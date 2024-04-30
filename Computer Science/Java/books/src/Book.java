import java.util.Comparator;

public class Book implements Comparable<Book> {
    public String Name;

    public String Author;

    public Book(String name, String author) {
        Name = name;
        Author = author;
    }

    public void print() {
        System.out.println(this.toString());
    }

    @Override
    public int compareTo(Book book) {
        return Author.compareTo(book.Author);
    }

    @Override
    public String toString() {
        return '"' + Name + '"' + " " + Author;
    }
}