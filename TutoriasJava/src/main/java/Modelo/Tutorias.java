package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Tutorias implements Serializable {
    private static int idTutorias;
    private static Date fecha;
    private static String contexto;
    private static int duracion;
    private static String fkAlumno;
    private static int fkTutor;
    private static int fkEstatus;

    public Tutorias() {

    }

    public Tutorias(int idTutorias, Date fecha, String contexto, int duracion, String fkAlumno, int fkTutor, int fkEstatus) {
        this.idTutorias = idTutorias;
        this.fecha = fecha;
        this.contexto = contexto;
        this.duracion = duracion;
        this.fkAlumno = fkAlumno;
        this.fkTutor = fkTutor;
        this.fkEstatus = fkEstatus;
    }

    public Tutorias(Date fecha, String contexto, int duracion, String fkAlumno, int fkTutor, int fkEstatus) {
        this.fecha = fecha;
        this.contexto = contexto;
        this.duracion = duracion;
        this.fkAlumno = fkAlumno;
        this.fkTutor = fkTutor;
        this.fkEstatus = fkEstatus;
    }

    public static int getIdTutorias() {
        return idTutorias;
    }

    public static void setIdTutorias(int idTutorias) {
        Tutorias.idTutorias = idTutorias;
    }

    public static Date getFecha() {
        return fecha;
    }

    public static void setFecha(Date fecha) {
        Tutorias.fecha = fecha;
    }

    public static String getContexto() {
        return contexto;
    }

    public static void setContexto(String contexto) {
        Tutorias.contexto = contexto;
    }

    public static int getDuracion() {
        return duracion;
    }

    public static void setDuracion(int duracion) {
        Tutorias.duracion = duracion;
    }

    public static String getFkAlumno() {
        return fkAlumno;
    }

    public static void setFkAlumno(String fkAlumno) {
        Tutorias.fkAlumno = fkAlumno;
    }

    public static int getFkTutor() {
        return fkTutor;
    }

    public static void setFkTutor(int fkTutor) {
        Tutorias.fkTutor = fkTutor;
    }

    public static int getFkEstatus() {
        return fkEstatus;
    }

    public static void setFkEstatus(int fkEstatus) {
        Tutorias.fkEstatus = fkEstatus;
    }
}
