public class AMAdapter implements  AdapterInterface{
    public void asFile(FormatInterface song){
        File f = new File(song.getName(),song.getMin(),song.getSec());
        f.setOrigin("de apple music");
        f.play();
    }
}