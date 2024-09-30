package src;

public interface AbstractFactory {

    //presentados en arrays para permitir modularizacion mediante indices
    public static String[] rams = {"DDR4 8GB","DDR4 16GB","DDR6 16GB"};
    public static String[] disks = {"Seagate 256GB","Samsung 512GB","Sandisk 1TB"};
    public static String[] screens = {"Asus 23 inch","LG 24 inch","Samsung 27 inch"};
    Ordenador createPc();
}