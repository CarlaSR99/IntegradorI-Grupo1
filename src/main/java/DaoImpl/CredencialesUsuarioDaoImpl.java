
package DaoImpl;

import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author CARLA
 */

public class CredencialesUsuarioDaoImpl {
    public boolean insertarCredencial(int usuarioId, String contrasenaHash) {
        String sql = "INSERT INTO `usuario_credencial`( `usuario_id`, `contrasena_hash`) VALUES (?,?)";

        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, usuarioId);
            ps.setString(2, contrasenaHash);
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public void Elminar(int idUsuario) {

        try {
            PreparedStatement ps = Conexion.getConexion().prepareStatement(
                    "DELETE FROM usuario_credencial WHERE usuario_id = ?"
            );
            ps.setInt(1, idUsuario);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("No se pudo eliminar las credenciales");
        }

    }

    public Usuario validarLogin(String email, String contrasenaIngresada) {
        String sql = "SELECT u.usuario_id, u.email, u.rol, cu.contrasena_hash "
                + "FROM usuario u "
                + "JOIN usuario_credencial cu ON u.usuario_id = cu.usuario_id "
                + "WHERE u.email = ?";

        try (Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashEnBD = rs.getString("contrasena_hash");

                // Verifica la contraseña con BCrypt
                if (BCrypt.checkpw(contrasenaIngresada, hashEnBD)) {
                    Usuario usuario = new Usuario();
                    usuario.setUsuario_id(rs.getInt("usuario_id"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setRol(rs.getString("rol"));
                    // Llena más campos si es necesario
                    return usuario;
                } else {
                    System.out.println("Contraseña incorrecta para el correo: " + email);
                }
            } else {
                System.out.println("Usuario no encontrado con el correo: " + email);
            }

        } catch (Exception e) {
            System.out.println("Error al validar login: " + e.getMessage());
            e.printStackTrace();
        }

        return null; // Retorna null si no coincide o no existe
    }
    
}
