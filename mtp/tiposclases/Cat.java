package tiposclases;

import tiposclases.Mammal;

public class Cat extends Animal implements Mammal{

    public Cat(int age, boolean ismale){
        super(age, ismale);
    }

    public void walk(){
        System.out.println("The cat moves quietly");
    }

    public void endWalk(){
        System.out.println("The cat stops");
    }

    public void move(){
        this.walk();
    }

    public void stop(){
        this.endWalk();
    }

    public void speak(){
        System.out.println("Meow");
    }
}