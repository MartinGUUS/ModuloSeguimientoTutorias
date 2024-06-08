package Modelo;

import java.io.Serializable;
import java.util.Date;

public class Mensajes implements Serializable {

    private int idMensajes;
    private String mensaje;
    private String asunto;
    private int fkTutor;
    private String fkAlumno;
    private Date fecha;
    private String nombre;
    private String segundoNombre;
    private String apPaterno;
    private String apMaterno;


    public Mensajes() {
    }

    public Mensajes(int idMensajes, String mensaje, String asunto, int fkTutor, String fkAlumno, Date fecha, String nombre, String secondName, String apPterno, String apMaterno) {
        this.idMensajes = idMensajes;
        this.mensaje = mensaje;
        this.asunto = asunto;
        this.fkTutor = fkTutor;
        this.fkAlumno = fkAlumno;
        this.fecha = fecha;
        this.nombre=nombre;
        this.segundoNombre=secondName;
        this.apPaterno=apPterno;
        this.apMaterno=apMaterno;
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSegundoNombre() {
        return segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public int getIdMensajes() {
        return idMensajes;
    }

    public void setIdMensajes(int idMensajes) {
        this.idMensajes = idMensajes;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public int getFkTutor() {
        return fkTutor;
    }

    public void setFkTutor(int fkTutor) {
        this.fkTutor = fkTutor;
    }

    public String getFkAlumno() {
        return fkAlumno;
    }

    public void setFkAlumno(String fkAlumno) {
        this.fkAlumno = fkAlumno;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
