public class Target {
    public static void main(String[] args) {
        Spotify s = new Spotify("Sultans of swing",5,48,"Dire Straits");
        AppleMusic am = new AppleMusic("Corcovado",2,25, "Antonio Carlos Jobim");
        GoogleDrive gd = new GoogleDrive("Manha de Carnaval",2,26,".mkv");
        File f = new File("Samba De Uma Nota So",3,0);
        GDAdapter gda = new GDAdapter();
        SAdapter sa = new SAdapter();
        AMAdapter ama = new AMAdapter();
        f.play();
        gda.asFile(gd);
        sa.asFile(s);
        ama.asFile(am);
    }
}