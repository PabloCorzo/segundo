package src;

public class CFactory implements AbstractFactory{
    
    public Ordenador createPc(){
        Ordenador c = new Ordenador();
        c.setRam(rams[2]);
        c.setDisk(disks[2]);
        c.setScreen(screens[2]);
        return c;
    }
}