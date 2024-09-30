package factory;

import factory.Ordenador;

public class Client {

    public static void main(String[] args) {
        Ordenador a = Factory.createOrdenadorA();
        Ordenador b = Factory.createOrdenadorB();
        Ordenador c = Factory.createOrdenadorC();
    }
}