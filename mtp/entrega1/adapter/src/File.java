public  class File implements FormatInterface{

    String name;
    int min;
    int sec;
    String origin = "localmente";

    //asumo que todos los archivos locales seran de tipo mp4
    static String extension = ".mp4";

    public File(String n, int m, int s){
        this.name = n;
        this.min = m;
        this.sec = s;
    }
    public int getMin(){return this.min;}
    public void setOrigin(String origin){this.origin = origin;}
    public int getSec(){return this.sec;}
    public String getName(){return this.name;}
    public double getLength(){return (this.min + (this.sec * 0.01));}

    public void setName(String name) {
        this.name = name;
    }
    public void setMin(int m){
        this.min = m;
    }

    public void setSec(int sec){
        if(sec/60 >= 1){
            this.min = (int) (this.min + (double) (sec / 60));
        }
        else{
            this.sec = sec;
        }
    }

    public  void play(){System.out.println("Reproduciendo " + this.getName() + extension + " " + origin);
    }

}