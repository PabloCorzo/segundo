package tiposclases;

public class Main {

    public static void main(String[] args) {
        Animal gato = new Cat(2,true);
        gato.move();
        gato.stop();
        gato.speak();
        Animal gorrion = new Sparrow(1,false);
        gorrion.move();
        gorrion.stop();
        gorrion.speak();
    }
}