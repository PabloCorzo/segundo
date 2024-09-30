package src;

public class BFactory implements AbstractFactory{
    
    public Ordenador createPc(){
        Ordenador b = new Ordenador();
        b.setRam(rams[1]);
        b.setDisk(disks[1]);
        b.setScreen(screens[1]);
        return b;
    }
}