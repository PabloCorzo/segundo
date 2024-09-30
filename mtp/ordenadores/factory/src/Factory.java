package factory;

import factory.Ordenador;

public class Factory {
    static String[] rams = {"DDR4 8GB","DDR4 16GB","DDR6 16GB"};
    static String[] disks = {"Seagate 256GB","Samsung 512GB","Sandisk 1TB"};
    static String[] screens = {"Asus 23 inch","LG 24 inch","Samsung 27 inch"};

    public static Ordenador createOrdenadorA(){
        Ordenador o = new Ordenador();
        o.setRam("DDR4 8GB");
        o.setDisk("Seagate 256GB");
        o.setScreen("Asus 23 inch");
        return o;
    }
    public static Ordenador createOrdenadorB(){
        Ordenador o = new Ordenador();
        o.setRam("DDR4 16GB");
        o.setDisk("Samsung 512GB");
        o.setScreen("LG 24 inch");
        return o;
    }
    public static Ordenador createOrdenadorC(){
        Ordenador o = new Ordenador();
        o.setRam("DDR6 16GB");
        o.setDisk("Sandisk 1TB");
        o.setScreen("Samsung 27 inch");
        return o;
    }
}