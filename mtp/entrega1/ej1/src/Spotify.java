public class Spotify implements   FormatInterface{

    String author;

    public Spotify(String n, int m, int s,String author){
        this.name = n;
        this.min = m;
        this.sec = s;
        this.author = author;
    }
    public String getName(){return this.name;}
    public double getLength(){return (this.min + (this.sec * 0.01))}
    public String getAuthor() {this.return author;}

    public void setName(String name) {
        this.name = name;
    }
    public void setMin(int m){
        this.min = m;}
    public void setAuthor(String author){this.author = author;}

    public void setSec(int sec){
        if(sec/60 >= 1){
            this.min = this.min + Math.floor(sec/60) ;
        }
        else{
            this.sec = sec;
        }
    }

    void play(){System.out.println("Reproduciendo " + this.name() + " de " + this.author " desde Spotify.");
    }

}