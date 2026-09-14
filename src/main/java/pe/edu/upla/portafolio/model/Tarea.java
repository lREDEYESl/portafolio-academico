package pe.edu.upla.portafolio.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Tarea {

    private Long id;
    private Long semanaId;
    private String titulo;
    private String descripcion;
    private LocalDate fechaLimite;
    private List<Archivo> archivos;

    public Tarea() {
        this.archivos = new ArrayList<>();
    }

    public Tarea(Long id, Long semanaId, String titulo, String descripcion, LocalDate fechaLimite) {
        this.id = id;
        this.semanaId = semanaId;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fechaLimite = fechaLimite;
        this.archivos = new ArrayList<>();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSemanaId() {
        return semanaId;
    }

    public void setSemanaId(Long semanaId) {
        this.semanaId = semanaId;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public LocalDate getFechaLimite() {
        return fechaLimite;
    }

    public void setFechaLimite(LocalDate fechaLimite) {
        this.fechaLimite = fechaLimite;
    }

    public List<Archivo> getArchivos() {
        return archivos;
    }

    public void setArchivos(List<Archivo> archivos) {
        this.archivos = archivos != null ? archivos : new ArrayList<>();
    }
}
