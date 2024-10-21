public interface FormatInterface{

    void play();
    void setName(String name);
    void setMin(int min);
    void setSec(int sec);
    String getName();
    int getMin();
    int getSec();
    double getLength();
}