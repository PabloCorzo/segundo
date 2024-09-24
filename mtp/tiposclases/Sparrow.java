package tiposclases;

import tiposclases.Bird;

public class Sparrow extends Animal implements Bird{

    public Sparrow(int age, boolean ismale){
        super(age,ismale);
    }

    public void fly(){
        System.out.println("The sparrow starts flapping its winds");
    }

    public void land(){
        System.out.println("The sparrow lands softly");
    }

    public void move(){
        this.fly();
    }

    public void stop(){
        this.land();
    }

    public void speak(){
        System.out.println("chirp");
    }
}