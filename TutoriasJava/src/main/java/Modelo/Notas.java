package Modelo;

import java.io.Serializable;

public class Notas implements Serializable {

    private static int idNotas;
    private static int fkTutor;
    private static String fkAlumno;
    private static String notas;

    public Notas() {
    }

    public Notas(int idNotas, int fkTutor, String fkAlumno, String notas) {
        this.idNotas = idNotas;
        this.fkTutor = fkTutor;
        this.fkAlumno = fkAlumno;
        this.notas = notas;
    }

    public Notas(int fkTutor, String fkAlumno, String notas) {
        this.fkTutor = fkTutor;
        this.fkAlumno = fkAlumno;
        this.notas = notas;
    }

    public static int getIdNotas() {
        return idNotas;
    }

    public static void setIdNotas(int idNotas) {
        Notas.idNotas = idNotas;
    }

    public static int getFkTutor() {
        return fkTutor;
    }

    public static void setFkTutor(int fkTutor) {
        Notas.fkTutor = fkTutor;
    }

    public static String getFkAlumno() {
        return fkAlumno;
    }

    public static void setFkAlumno(String fkAlumno) {
        Notas.fkAlumno = fkAlumno;
    }

    public static String getNotas() {
        return notas;
    }

    public static void setNotas(String notas) {
        Notas.notas = notas;
    }
}
