package bridge2;

public class Circulo extends Forma {
    private double coordenadaX, coordenadaY, coordenadaR;

    public Circulo(double coordenadaX, double coordenadaY, double coordenadaR, Dibujo dibujo) {
        super(dibujo);
        this.coordenadaX = coordenadaX;
        this.coordenadaY = coordenadaY;
        this.coordenadaR = coordenadaR;
    }

    @Override
    public void dibuja() {
        dibujaCirculo(coordenadaX, coordenadaY, coordenadaR);
    }
    
}
