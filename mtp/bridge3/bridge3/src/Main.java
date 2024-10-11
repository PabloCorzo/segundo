public class Main {
    public static void main(String[] args) {
        // Creamos una implementación de dibujo (Rojo)
        DibujoImplementacion dibujoRojo = new DibujoRojo();

        // Creamos una implementación de dibujo (Azul)
        DibujoImplementacion dibujoAzul = new DibujoAzul();

        // Creamos una forma (Círculo) con la implementación de color rojo
        Forma circuloRojo = new Circulo(dibujoRojo);
        circuloRojo.dibujar(); // Imprime: Dibujando círculo rojo

        // Creamos una forma (Cuadrado) con la implementación de color azul
        Forma cuadradoAzul = new Cuadrado(dibujoAzul);
        cuadradoAzul.dibujar(); // Imprime: Dibujando cuadrado azul

        // Podemos cambiar la implementación fácilmente
        Forma circuloAzul = new Circulo(dibujoAzul);
        circuloAzul.dibujar(); // Imprime: Dibujando círculo azul
    }
}

// La abstracción es la parte del código que define qué hace algo, pero no cómo lo hace.
// En este ejemplo de las formas, la abstracción sería la forma misma (como un círculo o un cuadrado)
// porque lo que queremos es representar figuras geométricas sin importar cómo se dibujan exactamente.

abstract class Forma {
    protected DibujoImplementacion implementacion;

    protected Forma(DibujoImplementacion implementacion) {
        this.implementacion = implementacion;
    }

    public abstract void dibujar();
}

// IMPLEMENTACION A CONTINUACION
// La implementación es el detalle de cómo algo se hace.
// La abstracción define la estructura general y la implementación se encarga de los detalles de la operación.
// En este ejemplkillo, la implementación es cómo se dibuja la forma, ya sea en color rojo, azul o de otra manera.
interface DibujoImplementacion {
    void dibujarCirculo();
    void dibujarCuadrado();
}

class DibujoRojo implements DibujoImplementacion {
    @Override
    public void dibujarCirculo() {
        System.out.println("Dibujando círculo rojo");
    }

    @Override
    public void dibujarCuadrado() {
        System.out.println("Dibujando cuadrado rojo");
    }
}

class DibujoAzul implements DibujoImplementacion {
    @Override
    public void dibujarCirculo() {
        System.out.println("Dibujando círculo azul");
    }

    @Override
    public void dibujarCuadrado() {
        System.out.println("Dibujando cuadrado azul");
    }
}

// AQUI juntamos la Anstracción y la Implementación
// Conectamos conectar la abstracción (las formas) con la implementación (cómo se dibujan)

class Circulo extends Forma {
    public Circulo(DibujoImplementacion implementacion) {
        super(implementacion);
    }

    @Override
    public void dibujar() {
        implementacion.dibujarCirculo();
    }
}

class Cuadrado extends Forma {
    public Cuadrado(DibujoImplementacion implementacion) {
        super(implementacion);
    }

    @Override
    public void dibujar() {
        implementacion.dibujarCuadrado();
    }
}
