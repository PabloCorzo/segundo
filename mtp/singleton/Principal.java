package singleton;

public class Principal {

    public static void main(String[] args) {
        System.out.print("sesion 1: ");
        int session1 = code.getSession();
        System.out.print("sesion 2: ");
        int session2 = code.getSession();
    }
}