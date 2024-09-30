package src;

public class AFactory implements AbstractFactory{
    
    public Ordenador createPc(){
        Ordenador a = new Ordenador();
        a.setRam(rams[0]);
        a.setDisk(disks[0]);
        a.setScreen(screens[0]);
        return a;
    }
}