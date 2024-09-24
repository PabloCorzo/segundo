package singleton;

public class code {

    int id;

    static code session; 

    //create unique session
    //return session id
    private static int generateSession(){
        if(session == null){
            //puede ser valor aleatorio
            int id = 12345;
            session = new code(id);
            return session.id;
        }
        else{
            //error
            return -1;
        }
    }

    private code(int id){
        this.id = id;
    }
    
    public static int getSession(){
       int id = generateSession();
       //if returned error code
       if(id == -1) System.out.println("Sesion ya iniciada en otro dispositivo");
       else{System.out.println("Sesion iniciada correctamente.");}
        return id;
    }

    private static void login(int id){

    }

    private void logout(){
    // session.DELETE();
    }

}