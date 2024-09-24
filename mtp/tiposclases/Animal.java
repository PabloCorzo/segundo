package tiposclases;

abstract class Animal {

    int age;
    String sex;

    public Animal(int age, boolean ismale){
        this.age = age;
        if(ismale) this.sex = "Male";
        else this.sex = "Female";
    }

    void ageUp(){
        this.age++;
    }

    abstract void speak();
    abstract void move();
    abstract void stop();
}