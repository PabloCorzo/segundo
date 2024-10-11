public class SAdapter implements AdapterInterface{
    public File asFile(Spotify song){
        File f = new File(song.name,song.min,song.sec);
        return f;
    }
}