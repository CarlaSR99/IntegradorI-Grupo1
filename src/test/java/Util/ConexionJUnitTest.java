
package Util;

import java.sql.Connection;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author CARLA
 */
public class ConexionJUnitTest {
    
    @Test
    public  void ConexionJUnitTest() {
         try {
            Connection conn = Conexion.getConexion();
            assertNotNull(conn, "La conexion es null");
            assertFalse(conn.isClosed(), "La conexion esta cerrada");
            System.out.println("Conexion a la base de datos exitosa");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace(); 
            fail("Error al conectar a la base de datos: " + e.getMessage());
        }
    }
    
}
