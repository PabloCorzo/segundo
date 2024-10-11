package bridge2;

public class DibujandoNormal extends Dibujo {

    @Override
    public void dibujaRectangulo(double x1, double y1, double x2, double y2) {
        System.out.println("Dibujando un rectangulo normal...");
    }

    @Override
    public void dibujaCirculo(double x, double y, double r) {
        System.out.println("Dibujando un circulo normal...");
    }
    
    
}
