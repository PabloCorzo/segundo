package adapter;

public class TestAdapter {
    public static void main(String[] args) {
        Guitarra eGuitarra = new GuitarraElectrica();
        eGuitarra.onGuitarra();
        eGuitarra.offGuitarra();
        
        Guitarra eGuitarraAdaptada = new AdaptadorGuitarraAcustica();
        eGuitarraAdaptada.onGuitarra();
        eGuitarraAdaptada.offGuitarra();
    }
}
