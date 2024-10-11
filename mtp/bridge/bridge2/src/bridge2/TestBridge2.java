package bridge2;

public class TestBridge2 {

    public static void main(String[] args) {
        Rectangulo rectangulo = new Rectangulo(1, 1, 2, 2, new DibujandoPunteado());
        rectangulo.dibuja();
        
        Circulo circulo = new Circulo(2, 2, 3, new DibujandoNormal());
        circulo.dibuja();
    }
    
}
