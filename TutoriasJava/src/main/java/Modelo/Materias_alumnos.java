package Modelo;

import java.io.Serializable;

public class Materias_Alumnos implements Serializable {

    private static int fkMaterias;
    private static String fkAlumnos;
    private static int fkEstatus;
    private static int inscripcion;
    private static int calificacion;

    public Materias_Alumnos() {
    }

    public Materias_Alumnos(int fkMaterias, String fkAlumnos, int fkEstatus, int inscripcion, int calificacion) {
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
        Materias_Alumnos.fkMaterias = fkMaterias;
    }

    public static String getFkAlumnos() {
        return fkAlumnos;
    }

    public static void setFkAlumnos(String fkAlumnos) {
        Materias_Alumnos.fkAlumnos = fkAlumnos;
    }

    public static int getFkEstatus() {
        return fkEstatus;
    }

    public static void setFkEstatus(int fkEstatus) {
        Materias_Alumnos.fkEstatus = fkEstatus;
    }

    public static int getInscripcion() {
        return inscripcion;
    }

    public static void setInscripcion(int inscripcion) {
        Materias_Alumnos.inscripcion = inscripcion;
    }

    public static int getCalificacion() {
        return calificacion;
    }

    public static void setCalificacion(int calificacion) {
        Materias_Alumnos.calificacion = calificacion;
    }
}
