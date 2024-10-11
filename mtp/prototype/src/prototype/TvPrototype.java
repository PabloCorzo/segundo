package prototype;

import java.util.HashMap;

public class TvPrototype {
    private HashMap<String, TV> prototipos = new HashMap<>();
    
    public TvPrototype() {
        //NOTA: En una aplicación real, esta información se leería de una BD o un fichero de
        //      configuración donde estuviesen almacenados todos los prototipos con su información
        Plasma plasma = new Plasma("Sony", 21, "Plateado", 399.99, 90, 0.05);
        LCD lcd = new LCD("Panasonic", 42, "Plateado", 599.99, 290);
        
        //Se añaden los prototipos a la colección
        prototipos.put("Plasma", plasma);
        prototipos.put("LCD", lcd);
    }
    
    public Object prototipo(String tipo) throws CloneNotSupportedException {
        return prototipos.get(tipo).clone();
    }
}
