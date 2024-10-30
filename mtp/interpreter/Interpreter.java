class Interpreter {

    
    interface Expression {
        public double interpret();
    }

    class Number implements Expression{
        double num;

        public Number(int num){this.num = num;}

        public double interpret(){return this.num;}
    }

    class Operation implements Expression{
        double op1;
        double op2;
        String sign;

        public Operation(double op1, double op2, String sign){
            this.sign = sign;
            this.op1 = op1;
            this.op2 = op2;
        }

        public double interpret(){
            if(sign.equals("+")) return op1+op2;
            if(sign.equals("-")) return op1-op2;
            if(sign.equals("*")) return op1*op2;
            if(sign.equals("/")) return op1/op2;
            if(sign.equals("^")) return Math.pow(op1, op2);
        }
    }
}