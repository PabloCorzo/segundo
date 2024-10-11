package adapter;

public class GuitarraElectrica extends Guitarra {

    @Override
    public void onGuitarra() {
        System.out.println("Tocando guitarra eléctrica");
    }

    @Override
    public void offGuitarra() {
        System.out.println("Dejando de tocar la guitarra eléctrica");
    }
}
