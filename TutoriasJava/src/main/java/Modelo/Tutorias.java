package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Tutorias implements Serializable {
    private int idTutorias;
    private Date fecha;
    private String contexto;
    private int duracion;
    private String fkAlumno;
    private int fkTutor;
    private int fkEstatus;


    public Tutorias() {}

    public Tutorias(int idTutorias, String fkAlumno, Date fecha, String contexto, int duracion, int fkTutor, int fkEstatus) {
        this.idTutorias = idTutorias;
        this.fecha = fecha;
        this.contexto = contexto;
        this.duracion = duracion;
        this.fkAlumno = fkAlumno;
        this.fkTutor = fkTutor;
        this.fkEstatus = fkEstatus;
    }

    public Tutorias(String fkAlumno, Date fecha, String contexto, int duracion, int fkTutor) {
        this.fecha = fecha;
        this.contexto = contexto;
        this.duracion = duracion;
        this.fkAlumno = fkAlumno;
        this.fkTutor = fkTutor;
    }

    // Getters y Setters para todos los campos



    public int getIdTutorias() {
        return idTutorias;
    }

    public void setIdTutorias(int idTutorias) {
        this.idTutorias = idTutorias;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getContexto() {
        return contexto;
    }

    public void setContexto(String contexto) {
        this.contexto = contexto;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public String getFkAlumno() {
        return fkAlumno;
    }

    public void setFkAlumno(String fkAlumno) {
        this.fkAlumno = fkAlumno;
    }

    public int getFkTutor() {
        return fkTutor;
    }

    public void setFkTutor(int fkTutor) {
        this.fkTutor = fkTutor;
    }

    public int getFkEstatus() {
        return fkEstatus;
    }

    public void setFkEstatus(int fkEstatus) {
        this.fkEstatus = fkEstatus;
    }
}
