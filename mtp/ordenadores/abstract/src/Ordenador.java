package src;

public class Ordenador {

    //presentados en arrays para permitir modularizacion mediante indices
    public static String[] rams = {"DDR4 8GB","DDR4 16GB","DDR6 16GB"};
    public static String[] disks = {"Seagate 256GB","Samsung 512GB","Sandisk 1TB"};
    public static String[] screens = {"Asus 23 inch","LG 24 inch","Samsung 27 inch"};

    private String ram;
    private String disk;
    private String screen;

    public String getRam(){return this.ram;}
    public String getDisk(){return this.disk;}
    public String getScreen(){return this.screen;}

    public void setRam(String ram){this.ram = ram;}
    public void setDisk(String disk){this.disk = disk;}
    public void setScreen(String screen){this.screen = screen;}
}