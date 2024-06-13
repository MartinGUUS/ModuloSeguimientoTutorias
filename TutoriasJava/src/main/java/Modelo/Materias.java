package Modelo;

import java.io.Serializable;

public class Materias implements Serializable {

    private int idMaterias;
    private String nombre;
    private int creditos;
    private int fkArea;
    private String area;
    private int inscripcion;
    private int calificacion;

    public Materias() {
    }

    public Materias(int idMaterias, String nombre, int creditos, int fkArea, String area, int inscripcion, int calificacion) {
        this.idMaterias = idMaterias;
        this.nombre = nombre;
        this.creditos = creditos;
        this.fkArea = fkArea;
        this.area = area;
        this.inscripcion = inscripcion;
        this.calificacion = calificacion;
    }

    public Materias(String nombre, int creditos, int fkArea, String area, int inscripcion, int calificacion) {
        this.nombre = nombre;
        this.creditos = creditos;
        this.fkArea = fkArea;
        this.area = area;
        this.inscripcion = inscripcion;
        this.calificacion = calificacion;
    }

    public Materias(String nombre, int creditos) {
        this.nombre = nombre;
        this.creditos = creditos;
    }

    // Getters y setters
    public int getIdMaterias() {
        return idMaterias;
    }

    public void setIdMaterias(int idMaterias) {
        this.idMaterias = idMaterias;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public int getFkArea() {
        return fkArea;
    }

    public void setFkArea(int fkArea) {
        this.fkArea = fkArea;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public int getInscripcion() {
        return inscripcion;
    }

    public void setInscripcion(int inscripcion) {
        this.inscripcion = inscripcion;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }
}
