package Modelo;

import java.io.Serializable;

public class Mensajes implements Serializable {

    private static int idMensajes;
    private static String mensaje;
    private static int fkTutor;
    private static String fkAlumno;

    public Mensajes() {
    }

    public Mensajes(int idMensajes, String mensaje, int fkTutor, String fkAlumno) {
        this.idMensajes = idMensajes;
        this.mensaje = mensaje;
        this.fkTutor = fkTutor;
        this.fkAlumno = fkAlumno;
    }

    public Mensajes(String mensaje, int fkTutor, String fkAlumno) {
        this.mensaje = mensaje;
        this.fkTutor = fkTutor;
        this.fkAlumno = fkAlumno;
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
}
