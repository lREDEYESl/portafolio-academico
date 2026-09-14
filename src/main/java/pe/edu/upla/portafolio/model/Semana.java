package pe.edu.upla.portafolio.model;

public class Semana {

    private Long id;
    private Long unidadId;
    private String titulo;
    private String contenido;

    public Semana() {
    }

    public Semana(Long id, Long unidadId, String titulo, String contenido) {
        this.id = id;
        this.unidadId = unidadId;
        this.titulo = titulo;
        this.contenido = contenido;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUnidadId() {
        return unidadId;
    }

    public void setUnidadId(Long unidadId) {
        this.unidadId = unidadId;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
}
