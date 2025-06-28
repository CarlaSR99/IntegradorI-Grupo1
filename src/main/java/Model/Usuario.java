package Model;

public class Usuario {
    private int usuario_id;
    private String email;
    private String fecha_registro;
    private String rol;
    private String fecha_eliminacion;

    public Usuario() {
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getFecha_eliminacion() {
        return fecha_eliminacion;
    }

    public void setFecha_eliminacion(String fecha_eliminacion) {
        this.fecha_eliminacion = fecha_eliminacion;
    }
    
    
}
