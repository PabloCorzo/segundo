import javax.swing.*;

class helloswing  extends JFrame{
    public helloswing(){
        setTitle("Jinx Supremacy");
        setSize(300,200);
    }
    
    public static void main(String[] args) {
        JFrame frame = new helloswing();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);    
    }
}