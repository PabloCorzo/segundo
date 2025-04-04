public class AppleMusic implements  FormatInterface{

    String name;
    int min;
    int sec;


    String author;

    public AppleMusic(String n, int m, int s,String author){
        this.name = n;
        this.min = m;
        this.sec = s;
        this.author = author;
    }
    public int getMin(){return this.min;}
    public int getSec(){return this.sec;}
    public String getName(){return this.name;}
    public double getLength(){return (this.min + (this.sec * 0.01));}
    public String getAuthor() {return this.author;}

    public void setName(String name) {
        this.name = name;
    }
    public void setMin(int m){
        this.min = m;}
    public void setAuthor(String author){this.author = author;}

    public void setSec(int sec){
        if(sec/60 >= 1){
            this.min = (int) (this.min + (double) (sec / 60));
        }
        else{
            this.sec = sec;
        }
    }

    public void play(){System.out.println("Reproduciendo " + this.getName() + " de " + this.author + " desde Apple Music");
    }
}