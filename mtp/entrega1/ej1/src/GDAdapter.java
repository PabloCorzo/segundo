public class GDAdapter implements AdapterInterface{
    public File asFile(GoogleDrive song){
        File f = new File(song.name,song.min,song.sec);
        return f;
    }
}