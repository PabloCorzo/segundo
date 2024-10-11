package adapter2;

import java.util.Date;

public interface IPersonaVieja {
    
    public String getNombre();
    public String getApellido();
    public Date getFechaDeNacimiento();

    public void setNombre(String nombre);
    public void setApellido(String apellido);
    public void setFechaDeNacimiento(Date fechaDeNacimiento);
}
