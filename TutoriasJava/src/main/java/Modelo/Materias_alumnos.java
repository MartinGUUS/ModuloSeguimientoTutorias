package Modelo;

import java.io.Serializable;

public class Materias_alumnos implements Serializable {

    private int fkMaterias;
    private String fkAlumnos;
    private int fkEstatus;
    private int inscripcion;
    private int calificacion;

    public Materias_alumnos() {
    }

    public Materias_alumnos(int fkMaterias, String fkAlumnos, int fkEstatus, int inscripcion, int calificacion) {
        this.fkMaterias = fkMaterias;
        this.fkAlumnos = fkAlumnos;
        this.fkEstatus = fkEstatus;
        this.inscripcion = inscripcion;
        this.calificacion = calificacion;
    }
    
    public Materias_alumnos(int calificacion, int inscripcion) {
        this.calificacion = calificacion;
        this.inscripcion = inscripcion;
    }

    public int getFkMaterias() {
        return fkMaterias;
    }

    public void setFkMaterias(int fkMaterias) {
        this.fkMaterias = fkMaterias;
    }

    public String getFkAlumnos() {
        return fkAlumnos;
    }

    public void setFkAlumnos(String fkAlumnos) {
        this.fkAlumnos = fkAlumnos;
    }

    public int getFkEstatus() {
        return fkEstatus;
    }

    public void setFkEstatus(int fkEstatus) {
        this.fkEstatus = fkEstatus;
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
