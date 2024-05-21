package Modelo;

import java.io.Serializable;

public class Materias_alumnos implements Serializable {
    
    private int fkAlumnos;
    private int fkMaterias;
    private int fkStatus;
    private int inscripcion;
    private int calificacion;

    public Materias_alumnos() {
    }
    
    public Materias_alumnos(int fkAlumnos, int fkMaterias, int fkStatus, int inscripcion, int calificacion) {
        this.fkAlumnos = fkAlumnos;
        this.fkMaterias = fkMaterias;
        this.fkStatus = fkStatus;
        this.inscripcion = inscripcion;
        this.calificacion = calificacion;
    }

    public int getFkAlumnos() {
        return fkAlumnos;
    }

    public void setFkAlumnos(int fkAlumnos) {
        this.fkAlumnos = fkAlumnos;
    }

    public int getFkMaterias() {
        return fkMaterias;
    }

    public void setFkMaterias(int fkMaterias) {
        this.fkMaterias = fkMaterias;
    }

    public int getFkStatus() {
        return fkStatus;
    }

    public void setFkStatus(int fkStatus) {
        this.fkStatus = fkStatus;
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