public class GoogleDrive implements FormatInterface{

    String name;
    int min;
    int sec;


    //en la nube puedo guardiar cualquier tipo de datos: si no es mp4 habra que modificar el archivo de la nube

    String extension;

    public GoogleDrive(String n, int m, int s,String extension){
        this.name = n;
        this.min = m;
        this.sec = s;
        this.extension = extension;
    }
    public int getMin(){return this.min;}
    public int getSec(){return this.sec;}
    public String getName(){return this.name;}
    public double getLength(){return (this.min + (this.sec * 0.01));}

    public String getExtension(){return  this.extension;}

    public void setName(String name) {
        this.name = name;
    }
    public void setMin(int m){this.min = m;}
    public void setExtension(String e){this.extension = e;}

    public void setSec(int sec){
        if(sec/60 >= 1){
            this.min = (int) (this.min + (double) (sec / 60));
        }
        else{
            this.sec = sec;
        }
    }

    public void play(){System.out.println("Reproduciendo " + this.getName() + " desde la nube");}
}