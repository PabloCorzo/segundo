public  class File implements FormatInterface{
    //asumo que todos los archivos seran de tipo mp4
    static String extension = ".mp4"

    public File(String n, int m, int s){
        this.name = n;
        this.min = m;
        this.sec = s;
    }
    public String getName(){return this.name;}
    public double getLength(){return (this.min + (this.sec * 0.01))}

    public void setName(String name) {
        this.name = name;
    }
    public void setMin(int m){
        this.min = m;
    }

    public void setSec(int sec){
        if(sec/60 >= 1){
            this.min = this.min + Math.floor(sec/60) ;
        }
        else{
            this.sec = sec;
        }
    }

    void play(){System.out.println("Reproduciendo " + this.name() + extension);
    }

}