import java.io.InvalidClassException;

public class GDAdapter implements AdapterInterface{
    //toMp4 simula un cambio de tipo de archivo que se hace exportando el archivo en cuestion
    public static void toMp4(GoogleDrive song){
        song.setExtension("mp4");
        System.out.println("Exportado a formato mp4");
    }
    public void asGFile(GoogleDrive song){
        //solo hace falta convertir a mp4 la extension, no hay que crear un archivo local
        if(!song.getExtension().equals("mp4")) toMp4(song);
        song.play();
    }

    public void asFile(FormatInterface fi){
        String e = "Invalid Class";
        GoogleDrive gd = new GoogleDrive("a",0,0,"asd;lkj");
        if(gd.getClass().equals(fi.getClass())) asGFile((GoogleDrive) fi);
        else System.out.println("Clase invalida");
    }
}