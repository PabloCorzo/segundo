package src;

public class Pokemon {

    //attributes
    private String name;
    private Type type1;
    private Type type2;
    private int level;
    private int hp;
    private int pdmg;
    private int sdmg;
    private int pdef;
    private int sdef;
    private int speed;

    //setters, getters
    public String getName(){return name;}
    public void setName(String name) {this.name = name;}
    public Type getType1(){return type1;}
    public Type setType1(Type type){this.type1 = type;}
    public Type getType2(){return type2;}
    public Type setType2(Type type){this.type2 = type;}
    public int getLevel(){return level;}
    public void setLevel(int level) {this.level = level;}
    public int getHp(){return hp;}
    public void setHp(int hp) {this.hp = hp;}
    public int getPdmg(){return pdmg;}
    public void setPdmg(int pdmg) {this.pdmg = pdmg;}
    public int getSdmg(){return sdmg;}
    public void setSdmg(int sdmg) {this.sdmg = sdmg;}
    public int getPdef(){return pdef;}
    public void setPdef(int pdef) {this.pdef = pdef;}
    public int getSdef(){return sdef;}
    public void setSdef(int sdef) {this.sdef = sdef;}
    public int getSpeed(){return speed;}
    public void setSpeed(int speed) {this.speed = speed;}

    //all attributes constructor
    public Pokemon(String nombre, Type tipo1, Type tipo2, int nivel, int vida, int danofis, int danoesp, int deffis, int defesp, int vel){
        name = nombre;
        type1 = tipo1;
        type2 = tipo2; 
        level = nivel;
        hp = vida;
        pdmg = danofis;
        sdmg = danoesp;
        pdef = deffis;
        sdef = defesp;
        speed = vel;
    }

    public void move(Pokemon target, Move move){
        
    }

}