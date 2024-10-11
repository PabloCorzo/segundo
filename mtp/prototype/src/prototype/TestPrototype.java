package prototype;

public class TestPrototype {

    public static void main(String[] args) throws Exception {
        TvPrototype tvp = new TvPrototype();
        TV tv = (TV) tvp.prototipo("Plasma");
        TV tv2 = (TV) tvp.prototipo("Plasma");
        
        System.out.println("Televisor " + tv.getMarca() + " de " + tv.getPulgadas() + "\" por " + tv.getPrecio() + " €. -- " + tv.toString());
        System.out.println("Televisor " + tv2.getMarca() + " de " + tv2.getPulgadas() + "\" por " + tv2.getPrecio() + " €. -- " + tv2.toString());
        
        tv = (TV) tvp.prototipo("LCD");
        System.out.println("Televisor " + tv.getMarca() + " de " + tv.getPulgadas() + "\" por " + tv.getPrecio() + " €. -- " + tv.toString());
    }
    
}
