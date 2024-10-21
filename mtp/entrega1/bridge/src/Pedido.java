public abstract class Pedido{
    int coste;
    int codigo;
    String cliente;
    Pago metodo;
    Pedido(int coste,int codigo,String cliente, Pago metodo);
}