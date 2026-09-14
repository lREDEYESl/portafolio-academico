package pe.edu.upla.portafolio.model;

public class Archivo {

    private Long id;
    private String entidadTipo;
    private Long entidadId;
    private String nombre;
    private String url;
    private String tareaTitulo;

    public Archivo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEntidadTipo() {
        return entidadTipo;
    }

    public void setEntidadTipo(String entidadTipo) {
        this.entidadTipo = entidadTipo;
    }

    public Long getEntidadId() {
        return entidadId;
    }

    public void setEntidadId(Long entidadId) {
        this.entidadId = entidadId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTareaTitulo() {
        return tareaTitulo;
    }

    public void setTareaTitulo(String tareaTitulo) {
        this.tareaTitulo = tareaTitulo;
    }
}
