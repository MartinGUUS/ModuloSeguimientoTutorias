package Modelo;

import java.io.Serializable;
import java.util.Date;

public class Mensajes implements Serializable {

    private static int idMensajes;
    private static String mensaje;
    private static String asunto;
    private static int fkTutor;
    private static String fkAlumno;
    private static Date fecha;

    public Mensajes() {
    }

    public Mensajes(int idMensajes, String mensaje, String asunto, int fkTutor, String fkAlumno, Date fecha) {
        this.idMensajes = idMensajes;
        this.mensaje = mensaje;
        this.asunto = asunto;
        this.fkTutor = fkTutor;
        this.fkAlumno = fkAlumno;
        this.fecha = fecha;
    }

    public Mensajes(String mensaje, String asunto, int fkTutor, String fkAlumno, Date fecha) {
        this.mensaje = mensaje;
        this.asunto = asunto;
        this.fkTutor = fkTutor;
        this.fkAlumno = fkAlumno;
        this.fecha = fecha;
    }

    public static int getIdMensajes() {
        return idMensajes;
    }

    public static void setIdMensajes(int idMensajes) {
        Mensajes.idMensajes = idMensajes;
    }

    public static String getMensaje() {
        return mensaje;
    }

    public static void setMensaje(String mensaje) {
        Mensajes.mensaje = mensaje;
    }

    public static int getFkTutor() {
        return fkTutor;
    }

    public static void setFkTutor(int fkTutor) {
        Mensajes.fkTutor = fkTutor;
    }

    public static String getFkAlumno() {
        return fkAlumno;
    }

    public static void setFkAlumno(String fkAlumno) {
        Mensajes.fkAlumno = fkAlumno;
    }

    public static String getAsunto() {
        return asunto;
    }

    public static void setAsunto(String asunto) {
        Mensajes.asunto = asunto;
    }

    public static Date getFecha() {
        return fecha;
    }

    public static void setFecha(Date fecha) {
        Mensajes.fecha = fecha;
    }
}
