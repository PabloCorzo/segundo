package adapter2;

import java.util.GregorianCalendar;

public class AdaptadorViejaANueva implements IPersonaNueva {
    private PersonaVieja vieja;

    public AdaptadorViejaANueva(PersonaVieja vieja) {
        this.vieja = vieja;
    }

    @Override
    public int getEdad() {
        GregorianCalendar c = new GregorianCalendar();
        GregorianCalendar c2 = new GregorianCalendar();
        c2.setTime(vieja.getFechaDeNacimiento());
        return c.get(1) - c2.get(1);
    }

    @Override
    public void setEdad(int edad) {
        GregorianCalendar c = new GregorianCalendar();
        int agnoActual = c.get(1);
        c.set(1, agnoActual - edad);
        vieja.setFechaDeNacimiento(c.getTime());
    }
    
    @Override
    public String getNombre() {
        return vieja.getNombre() + " " + vieja.getApellido();
    }

    @Override
    public void setNombre(String nombreCompleto) {
        String[] partes = nombreCompleto.split(" ");
        vieja.setNombre(partes[0]);
        vieja.setApellido(partes[1]);
    }
}
