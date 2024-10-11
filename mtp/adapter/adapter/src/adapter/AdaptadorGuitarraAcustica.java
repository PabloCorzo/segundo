package adapter;

public class AdaptadorGuitarraAcustica extends Guitarra {
    
    private GuitarraAcustica acustica = new GuitarraAcustica();

    @Override
    public void onGuitarra() {
        acustica.tocar();
    }

    @Override
    public void offGuitarra() {
        acustica.parar();
    }
    
    
}
