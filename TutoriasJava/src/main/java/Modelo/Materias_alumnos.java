package Modelo;

import java.io.Serializable;

public class Materias_alumnos implements Serializable {

    private static int fkMaterias;
    private static String fkAlumnos;
    private static int fkEstatus;
    private static int inscripcion;
    private static int calificacion;

    public Materias_alumnos() {
    }

    public Materias_alumnos(int fkMaterias, String fkAlumnos, int fkEstatus, int inscripcion, int calificacion) {
        this.fkMaterias = fkMaterias;
        this.fkAlumnos = fkAlumnos;
        this.fkEstatus = fkEstatus;
        this.inscripcion = inscripcion;
        this.calificacion = calificacion;
    }


    public static int getFkMaterias() {
        return fkMaterias;
    }

    public static void setFkMaterias(int fkMaterias) {
        Materias_alumnos.fkMaterias = fkMaterias;
    }

    public static String getFkAlumnos() {
        return fkAlumnos;
    }

    public static void setFkAlumnos(String fkAlumnos) {
        Materias_alumnos.fkAlumnos = fkAlumnos;
    }

    public static int getFkEstatus() {
        return fkEstatus;
    }

    public static void setFkEstatus(int fkEstatus) {
        Materias_alumnos.fkEstatus = fkEstatus;
    }

    public static int getInscripcion() {
        return inscripcion;
    }

    public static void setInscripcion(int inscripcion) {
        Materias_alumnos.inscripcion = inscripcion;
    }

    public static int getCalificacion() {
        return calificacion;
    }

    public static void setCalificacion(int calificacion) {
        Materias_alumnos.calificacion = calificacion;
    }
}
