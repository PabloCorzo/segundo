package adapter2;

import java.util.Date;
import java.util.GregorianCalendar;

public class TestAdapter2 {

    public static void main(String[] args) {
        //Se crea una persona vieja
        PersonaVieja personaVieja = new PersonaVieja();
        personaVieja.setApellido("Pérez");
        personaVieja.setNombre("Maxi");
        GregorianCalendar g = new GregorianCalendar();
        g.set(1952, 01, 01);
        Date d = g.getTime();
        personaVieja.setFechaDeNacimiento(d);

        AdaptadorViejaANueva personaNueva = new AdaptadorViejaANueva(personaVieja);
        System.out.println("La Edad de la persona vieja es: " + personaNueva.getEdad() + " años.");
        System.out.println("El Nombre de la persona vieja es: " + personaNueva.getNombre());
        
        personaNueva.setEdad(10);
        personaNueva.setNombre("Juan López");
        System.out.println("La Edad de la persona vieja es: " + personaNueva.getEdad() + " años.");
        System.out.println("El Nombre de la persona vieja es: " + personaNueva.getNombre());
    }
}
