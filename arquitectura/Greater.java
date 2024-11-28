public class Greater {
    
    private static int[] X = {1,2,6,8,9,3,5,10};
    private static int[] Y = {10,20,35,11,99,30,5,100};
    static int xval = 5;
    static int yval = 50;
    
    public static int calculateArr(int[] arr){
        int n = 0;
        int val = xval;
        if(arr == Y) val = yval;
        for(int i : arr){
            if(isGreater(i,val)) n++;;
        }
        return n;
    }

    public static boolean isGreater(int i, int val){
        return i >= val;
    }
    public static void main(String[] args) {
        System.out.println("For X: " + calculateArr(X));
        System.out.println("For Y: " + calculateArr(Y));
    }
}
