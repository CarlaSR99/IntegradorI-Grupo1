
package DaoImpl;

import Model.oferta_practica;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CARLA
 */
public class PuestoDaoImpl {
    public List<oferta_practica> listar(int id_empresa){
    
        List<oferta_practica> lista = new ArrayList<>();
        String sql = "SELECT * FROM puestos where id_empresa = ?";
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_empresa);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                oferta_practica pst = new oferta_practica();
                pst.setId_puesto(rs.getInt("id_puesto"));
                pst.setTitulo(rs.getString("titulo"));
                pst.setDescripcion(rs.getString("descripcion"));
                pst.setRequisitos(rs.getString("requisitos"));
                pst.setEstado(rs.getString("estado"));
                pst.setVacantes(rs.getInt("vacantes"));
                pst.setFecha_limite(rs.getString("fecha_limite"));
                pst.setFecha_publicacion(rs.getString("fecha_publicacion"));
                pst.setId_empresa(rs.getInt("id_empresa"));
                lista.add(pst);
            }
        } catch (SQLException e) {
        }
        return lista;   
    }
    
   
      public boolean insertar(oferta_practica oferta) {
        String sql = "INSERT INTO `oferta_practica`(`empresa_id`, `titulo`, `descripcion`, `requisitos`, `vacantes_disponibles`,"
                + "`fecha_limite`) VALUES (?,?,?,?,?,?)";
        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, oferta.getId_empresa());
            ps.setString(2, oferta.getTitulo());
            ps.setString(3, oferta.getDescripcion());
            ps.setString(4, oferta.getRequisitos());
            ps.setInt(5, oferta.getVacantes());
            ps.setString(6, oferta.getFecha_limite());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
