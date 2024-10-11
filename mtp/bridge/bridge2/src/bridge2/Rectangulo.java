package bridge2;

public class Rectangulo extends Forma {
    private double x1, x2, y1, y2;

    public Rectangulo(double x1, double x2, double y1, double y2, Dibujo dibujo) {
        super(dibujo);
        this.x1 = x1;
        this.x2 = x2;
        this.y1 = y1;
        this.y2 = y2;
    }

    @Override
    public void dibuja() {
        dibujaRectangulo(x1, y1, x2, y2);
    }
}
