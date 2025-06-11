
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
    
   private static Connection conexion;
    
   private Conexion(){
   }
   
   public static Connection getConexion() throws SQLException {
       try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdesarrollojava", "root", "");                   
       }  catch (Exception e){
           System.err.println("Error" + e);
       }
       return conexion;
   } 
}
