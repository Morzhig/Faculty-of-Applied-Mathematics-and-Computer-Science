import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Main {
    public static void main(String[] args) {
        Map<Object, List<String>> groups = Arrays.asList("abc", "foo", "barbaz", "qwery").stream().collect(Collectors.groupingBy(s->s.length()));

        System.out.println(groups);
    }
}