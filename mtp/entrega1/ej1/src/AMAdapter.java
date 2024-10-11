public class AMAdapter implements  AdapterInterface{
    public File asFile(AppleMusic song){
        File f = new File(song.name,song.min,song.sec);
        return f;
    }
}