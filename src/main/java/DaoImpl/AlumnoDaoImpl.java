
package DaoImpl;

import Model.Alumno;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AlumnoDaoImpl {
    
    public boolean insertar (Alumno alumno){
      String sql = "INSERT INTO `estudiante` (`usuario_id`, `nombre`, `apellido`, `dni`, `carrera`, `universidad`, `genero`, "
                + "`ubicacion`, `telefono`, `fecha_nacimiento`, `ciclo_actual`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
     try(Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)){
         stmt.setInt(1,alumno.getUsuario_id());
         stmt.setString(2,alumno.getNombre());
         stmt.setString(3,alumno.getApellido());
         stmt.setString(4,alumno.getDni());
         stmt.setString(5,alumno.getCarrera());
         stmt.setString(6,alumno.getUniversidad());
         stmt.setString(7,alumno.getGenero());
         stmt.setString(8,alumno.getUbicacion());
         stmt.setString(9, alumno.getTelefono());
         stmt.setString(10, alumno.getFecha_nacimiento());
         stmt.setString(11, alumno.getCiclo());
         stmt.executeUpdate();
         return true;
     } catch(Exception e){
         System.out.println("Error al crear el estudiante: " + e.getMessage());
         e.printStackTrace();
         return false;
     }        
    }
    
    public Alumno obtenerPorId(int usuarioId) {
        String sql = "SELECT e.*, u.email FROM estudiante e "
                +"JOIN usuario u ON e.usuario_id = u.usuario_id"
                +"WHERE e.usuario_id = ?";
        Alumno alumno = null;
        try (Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)){
        
            stmt.setInt(1, usuarioId);
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()){
                alumno = new Alumno();
                alumno.setNombre(rs.getString("nombre"));
                alumno.setApellido(rs.getString("apellido"));
                alumno.setDni(rs.getString("dni"));
                alumno.setCarrera(rs.getString("carrera"));
                alumno.setEmail(rs.getString("email"));
                alumno.setCiclo(rs.getString("ciclo_actual"));
                alumno.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                alumno.setGenero(rs.getString("genero"));
                alumno.setHabilidades(rs.getString("habilidades"));
                alumno.setTelefono(rs.getString("telefono"));
                alumno.setUbicacion(rs.getString("ubicacion"));
                alumno.setUniversidad(rs.getString("universidad"));
            }
        }   catch (Exception e) {
            System.out.println("Error al obtener alumno por ID" + e.getMessage());
        }
        return alumno;
    }
    
    public boolean dniExiste(String dni){
        String sql ="SELECT * FROM estudiante WHERE dni=?";
        try (Connection conn= Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setString(1, dni);
            ResultSet rs = stmt.executeQuery();
            return rs.next();            
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    } 
       
}
