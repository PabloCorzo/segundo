package src;

public abstract class Move {

    //attributes
    private Type type;
    private int pp;
    private int accurracy;

    //setters,getters
    public void setType(Type type){this.type = type;}
    public Type getType(){return type;}
    public void setPp(int pp){this.pp = pp;}
    public int getPp(){return pp;}
    public void setAccurracy(int accurracy){this.accurracy = accurracy;}
    public int getAccurracy(){return accurracy;}

    //other methods
    abstract public void move();

}
