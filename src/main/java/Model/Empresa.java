package Model;

public class Empresa extends Usuario{
    private int id_empresa;
    private String nombre_emp;
    private String ruc_emp;
    private String descripcion_emp;
    private String razon_social;
    private String sector;
    private String direccion;
    private String mision;
    private String vision;

    public Empresa() {
    }

    public int getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(int id_empresa) {
        this.id_empresa = id_empresa;
    }

    public String getNombre_emp() {
        return nombre_emp;
    }

    public void setNombre_emp(String nombre_emp) {
        this.nombre_emp = nombre_emp;
    }

    public String getRuc_emp() {
        return ruc_emp;
    }

    public void setRuc_emp(String ruc_emp) {
        this.ruc_emp = ruc_emp;
    }

    public String getDescripcion_emp() {
        return descripcion_emp;
    }

    public void setDescripcion_emp(String descripcion_emp) {
        this.descripcion_emp = descripcion_emp;
    }

    public String getRazon_social() {
        return razon_social;
    }

    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getMision() {
        return mision;
    }

    public void setMision(String mision) {
        this.mision = mision;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }
    
    
}
