public class GoogleDrive implements FormatInterface{

    //en la nube puedo guardiar cualquier tipo de datos: si no es mp4 habra que modificar el archivo de la nube

    String extension;

    public Spotify(String n, int m, int s,String extension){
        this.name = n;
        this.min = m;
        this.sec = s;
        this.extension = extension;
    }
    public String getName(){return this.name;}
    public double getLength(){return (this.min + (this.sec * 0.01))}

    public void setName(String name) {
        this.name = name;
    }
    public void setMin(int m){
        this.min = m;}
    //toMp4 simula un cambio de tipo de archivo que se hace exportando el archivo en cuestion
    public void toMp4(this.extension = "mp4")

    public void setSec(int sec){
        if(sec/60 >= 1){
            this.min = this.min + Math.floor(sec/60) ;
        }
        else{
            this.sec = sec;
        }
    }

    void play(){System.out.println("Reproduciendo " + this.name() + " desde la nube"}
}