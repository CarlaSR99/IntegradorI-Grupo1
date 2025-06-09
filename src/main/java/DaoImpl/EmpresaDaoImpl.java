package DaoImpl;

import Modelo.Empresa;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CARLA
 */
public class EmpresaDaoImpl {

    public boolean insertar(Empresa empresa) {
        String sql = "INSERT INTO `empresa`(`usuario_id`, `nombre_marca`, `razon_social_anterior`, `ruc`, `direccion`, `sector`, `descripcion`) "
                + "VALUES (?,?,?,?,?,?,?)";
        try (Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, empresa.getUsuario_id());
            stmt.setString(2, empresa.getNombre_emp());
            stmt.setString(3, empresa.getRazon_social());
            stmt.setString(4, empresa.getRuc_emp());
            stmt.setString(5, empresa.getDireccion());
            stmt.setString(6, empresa.getSector());
            stmt.setString(7, empresa.getDescripcion_emp());
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al agregar empresa");
            return false;
        }

    }

    public Empresa obtenerPorUsuarioId(int usuarioId) {
        String sql = "SELECT e.*, u.email FROM empresa e "
                + "JOIN usuario u ON e.usuario_id = u.usuario_id "
                + "WHERE e.usuario_id = ?";
        try (Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, usuarioId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Empresa empresa = new Empresa();
                empresa.setNombre_emp(rs.getString("nombre_marca"));
                empresa.setRuc_emp(rs.getString("ruc"));
                empresa.setRazon_social(rs.getString("razon_social_anterior"));
                empresa.setSector(rs.getString("sector"));
                empresa.setDireccion(rs.getString("direccion"));
                empresa.setDescripcion_emp(rs.getString("descripcion"));
                empresa.setEmail(rs.getString("email"));
                empresa.setVision(rs.getString("vision"));
                empresa.setMision(rs.getString("mision"));

                return empresa;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean rucExiste(String ruc) {
        String sql = "SELECT * FROM empresa WHERE ruc = ?";
        try (Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, ruc);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean nombreEmpresaExiste(String nombre) {
        String sql = "SELECT * FROM empresa WHERE nombre_marca = ?";
        try (Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nombre);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public List<Empresa> listarEmpresas() {
        String sql = "SELECT * FROM empresa";
        try (Connection conn = Conexion.getConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            List<Empresa> empresas = new ArrayList<>();
            while (rs.next()) {
                Empresa empresa = new Empresa();
                empresa.setUsuario_id(rs.getInt("usuario_id"));
                empresa.setNombre_emp(rs.getString("nombre_marca"));
                empresa.setRazon_social(rs.getString("razon_social_anterior"));
                empresa.setRuc_emp(rs.getString("ruc"));
                empresa.setDireccion(rs.getString("direccion"));
                empresa.setSector(rs.getString("sector"));
                empresa.setDescripcion_emp(rs.getString("descripcion"));
                empresas.add(empresa);
            }
            return empresas;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;        
    }
    
}
