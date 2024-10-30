//package bases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ejemplo0 {

    public static void main(String[] args) {
        // TODO code application logic here
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String mysqlURL = "jdbc:mysql://localhost:3306/sakila";
            Connection conexion = DriverManager.getConnection(mysqlURL, "root", "CallOfDuty10");

            Statement myStatement = conexion.createStatement();
            ResultSet result = myStatement.executeQuery("SELECT * FROM actor");

            int id;
            String nombre;
            while(result.next()){
                id = result.getInt("actor_id");
                nombre = result.getString("first_name");
                System.out.println("Cliente " + id + " -- Nombre: " + nombre);
            }

            conexion.close();

        } catch (ClassNotFoundException ex) {
            System.out.println("Error cargando driver: " + ex);
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex);
        }


    }

}