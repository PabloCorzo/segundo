package src;

import java.util.ArrayList;
import java.util.HashMap;

public class Type{

    //HAY QUE CREAR UN TIPO QUE SEA VACIO Y TENGA TODOS LOS TIPOS EN X1
    //attributes
    private HashMap<Type,Double> off;
    private HashMap<Type,Double> def;

    //setters, getters
    public void setOff(HashMap<Type,Double> off){this.off = off;}
    public HashMap<Type,Double> getOff(){return off;}
    public void setDef(HashMap<Type,Double> def){this.def = def;}
    public HashMap<Type,Double> getDef(){return def;}

    //all attributes constructor
    public Type(HashMap<Type,Double> off, HashMap<Type,Double> def){
        this.off = off;
        this.def = def;
    }

    //Mixes both types of a pokemon to get one single Map of Offensive/Defensive interactions with other types
    public HashMap<Type,Double> typeMixer(Type type1, Type type2, int mode){
        //Both maps will have all keys(all 18 types)

        //To create the mix for either offensive or defensive typing, 1 will do offense and 2 def
        HashMap<Type,Double> first;
        HashMap<Type,Double> second;
        HashMap<Type,Double> mix;

        if(mode != 1 && mode != 2) throw new IllegalArgumentException();
        else if(mode == 1){
            first = type1.getOff();
            second = type2.getOff();
        }else{
            first = type1.getDef();
            second = type2.getDef();
        }

        //to get the mix of the interaction with a single type, we multiply both values for the same type in each of the maps
        for(Type type : first.keySet()){
            mix.put(type,first.get(type)*second.get(type));
        }

        return mix;
    }

}