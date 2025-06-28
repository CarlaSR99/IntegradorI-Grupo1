
package DaoImpl;

import Model.Usuario;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CARLA
 */

public class UsuarioDaoImpl {
   
    public int Agrear(Usuario obj) {
        try {
            PreparedStatement preparo = Conexion.getConexion().prepareStatement("INSERT INTO `usuario`(`email`, `rol`) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
            preparo.setString(1, obj.getEmail());
            preparo.setString(2, obj.getRol());

            preparo.executeUpdate();

            ResultSet rs = preparo.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void Eliminar(int id) {
        try {
            PreparedStatement ps = Conexion.getConexion().prepareStatement(
                    "DELETE FROM usuario WHERE usuario_id = ?"
            );
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public boolean existeEmail(String email) {
        String sql = "SELECT COUNT(*) FROM usuario WHERE email = ?";
        try (Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            System.out.println("Error al verificar el email: " + e.getMessage());
        }
        return false;
    }
    
    public ArrayList<String> arregloRol(int idUsuario){
    
        ArrayList<String> listaRol = new ArrayList<>();
        
        String sql = "SELECT rol FROM empresa WHERE usuario_id = ?";
        
        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)){
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String rol = rs.getString("rol");
                listaRol.add(rol);
           }           
        } catch (Exception e) {
            System.out.println("Error al obtener los roles: " + e.getMessage());
        } 
        return listaRol;
    }

    public void InsertarLogin(int idUsuario){
        try {
            PreparedStatement ps = Conexion.getConexion().prepareStatement(
                    "INSERT INTO `inicios_sesion`(`id_usuario`) VALUES (?)"
            );
            ps.setInt(1, idUsuario);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al insertar en la tabla login: " + ex.getMessage());
        }
    }
    
}
