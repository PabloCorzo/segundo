package interpreter;
public class Client {

    public static void main(String[] args) {
        Expression exp = new AddOperation(new AddOperation(new Num(5), new Num(3)), new Num(4));
        System.out.println(exp.interpret());
    }
}