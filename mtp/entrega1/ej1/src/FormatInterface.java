public interface FormatInterface{

    String name;
    int min;
    int sec;

    void play();
    void setName(String name);
    void setMin(int min);
    void setSec(int sec);
    String getName();
    double getLength();
}