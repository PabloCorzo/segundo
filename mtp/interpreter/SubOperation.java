package interpreter;
public class SubOperation implements Expression{
    Expression op1;
    Expression op2;
    public SubOperation(Expression op1, Expression op2){
        this.op1 = op1;
        this.op2 = op2;
    }
    public int interpret(){return op1.interpret() - op2.interpret();}
}