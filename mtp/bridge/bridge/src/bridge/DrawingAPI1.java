package bridge;

/** "ConcreteImplementor"  1/2 */
class DrawingAPI1 implements DrawingAPI {
    
    @Override
    public void drawCircle(double x, double y, double radius) {
        System.out.printf("API1.circle at %f:%f radius %f\n", x, y, radius);
    }
}
