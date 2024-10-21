

public class SAdapter implements AdapterInterface{
    public void asFile(FormatInterface song){
        File f = new File(song.getName(),song.getMin(),song.getSec());
        f.setOrigin("de Spotify");
        f.play();
    }
}