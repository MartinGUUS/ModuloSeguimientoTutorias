package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Tutorias implements Serializable {

    private int idTutorias;
    private Date fecha;
    private String contexto;
    private int duracion;
    private String fkAlumno;
    private String fkTutor;
    private int fkStatus;
    private String nombreAlumno;
    private String apellidoPaternoAlumno;
    private String apellidoMaternoAlumno;
    private String nombreTutor;
    private String apellidoPaternoTutor;
    private String apellidoMaternoTutor;


    public Tutorias(int idTutorias, Date fecha, int duracion, String temasTratados, String nombreAlumno, String apellidoPaternoAlumno, String apellidoMaternoAlumno, String nombreTutor, String apellidoPaternoTutor, String apellidoMaternoTutor) {
        this.idTutorias = idTutorias;
        this.fecha = fecha;
        this.duracion = duracion;
        this.contexto = temasTratados;
        this.nombreAlumno = nombreAlumno;
        this.apellidoPaternoAlumno = apellidoPaternoAlumno;
        this.apellidoMaternoAlumno = apellidoMaternoAlumno;
        this.nombreTutor = nombreTutor;
        this.apellidoPaternoTutor = apellidoPaternoTutor;
        this.apellidoMaternoTutor = apellidoMaternoTutor;
    }

    public Tutorias() {
    }

    public Tutorias(int idTutorias, Date fecha, String contexto, int duracion, String fkAlumno, String fkTutor, int fkStatus) {
        this.idTutorias = idTutorias;
        this.fecha = fecha;
        this.contexto = contexto;
        this.duracion = duracion;
        this.fkAlumno = fkAlumno;
        this.fkTutor = fkTutor;
        this.fkStatus = fkStatus;
    }

    public Tutorias(Date fecha, String contexto, int duracion, String fkAlumno, String fkTutor, int fkStatus) {
        this.fecha = fecha;
        this.contexto = contexto;
        this.duracion = duracion;
        this.fkAlumno = fkAlumno;
        this.fkTutor = fkTutor;
        this.fkStatus = fkStatus;
    }


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

    public String getFkTutor() {
        return fkTutor;
    }

    public void setFkTutor(String fkTutor) {
        this.fkTutor = fkTutor;
    }

    public int getFkStatus() {
        return fkStatus;
    }

    public void setFkStatus(int fkStatus) {
        this.fkStatus = fkStatus;
    }
}