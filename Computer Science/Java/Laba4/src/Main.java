import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

enum State{Start, Str_Const, Str_Const2, Com_Beg, Com_Read, Com_Mul, Com_End, Symb_Const, Ctrl_SymbS, Ctrl_SymbC, Symb_End}

public class Main {
    static List<String> parse(String s) {
        State state = State.Start;
        List<String> result = new ArrayList<>();

        StringBuilder fieldValue = new StringBuilder();

        for (char c : s.toCharArray()) {
            switch (state) {
                case Start:
                    if (c == '"') {
                        fieldValue.append(c);
                        state = State.Str_Const;
                    }

                    else if (c == '/') {
                        state = State.Com_Beg;
                    }

                    else if (c == '\'') {
                        fieldValue.append(c);
                        state = State.Symb_Const;
                    }

                    else {
                        fieldValue.append(c);
                        state = State.Start;
                    }

                    break;
                case Str_Const:
                    if (c == '"') {
                        fieldValue.append(c);
                        state = State.Str_Const2;
                    }

                    else if (c == '\\') {
                        fieldValue.append(c);
                        state = state.Ctrl_SymbS;
                    }

                    else {
                        fieldValue.append(c);
                        state = State.Str_Const;
                    }

                    break;
                case Str_Const2:
                    if (c == '"') {
                        fieldValue.append(c);
                        state = State.Str_Const;
                    }
                    else if (c == '/') {
                        state = State.Com_Beg;
                    }
                    else if (c == '\'') {
                        fieldValue.append(c);
                        state = State.Symb_Const;
                    }
                        else {
                        fieldValue.append(c);
                        state = State.Start;
                    }

                    break;

                case Ctrl_SymbS:
                    fieldValue.append(c);
                    state = State.Str_Const;

                    break;

                case Symb_Const:
                    if (c == '\\') {
                        fieldValue.append(c);
                        state = State.Ctrl_SymbC;
                    }

                    else {
                        fieldValue.append(c);
                        state = State.Symb_End;
                    }

                    break;

                case Ctrl_SymbC:
                    fieldValue.append(c);
                    state = State.Symb_Const;

                    break;

                case Symb_End:
                    if (c == '/')
                        state = State.Com_Beg;
                    else if (c == '"') {
                        fieldValue.append(c);
                        state = State.Str_Const;
                    }
                    else {
                        fieldValue.append(c);
                        state = State.Start;
                    }

                    break;

                case Com_Beg:
                    if (c == '/')
                        state = State.Com_Read;

                    else if (c == '*')
                        state = State.Com_Mul;

                    else {
                        fieldValue.append(c);
                        state = State.Start;
                    }

                    break;

                case Com_Read:
                    if (c == '\n') {
                        fieldValue.append(c);
                        state = State.Start;
                    } else {
                        state = State.Com_Read;
                    }

                    break;

                case Com_Mul:
                    if (c == '*')
                        state = State.Com_End;

                    else {
                        state = State.Com_Mul;
                    }

                    break;

                case Com_End:
                    if (c == '/')
                        state = State.Start;

                    else {
                        state = State.Com_Mul;
                    }

                    break;
            }
        }
        result.add(fieldValue.toString());
        return result;
    }

    public static void main(String[] args) throws IOException {
        FileWriter fw = new FileWriter("output.txt");
        FileReader fr = new FileReader("input.txt");
        Scanner fin = new Scanner(fr);

        StringBuilder str = new StringBuilder();
        String temp;

        while(fin.hasNextLine())
        {
            temp = fin.nextLine();
            str.append(temp);
            str.append("\n");
        }

        String tmp = str.toString();

        fw.write(parse(tmp).toString());

        fr.close();
        fw.close();
    }
}


