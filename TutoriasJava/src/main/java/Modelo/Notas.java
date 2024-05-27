package Modelo;

import java.io.Serializable;

public class Notas implements Serializable {
    
    private String fkTutor;
    private String fkAlumno;
    private String notas;
    
    public Notas() {
    }
    
    public Notas(String fkTutor, String fkAlumno, String notas) {
        this.fkTutor = fkTutor;
        this.fkAlumno = fkAlumno;
        this.notas = notas;
    }

    public String getFkTutor() {
        return fkTutor;
    }

    public void setFkTutor(String fkTutor) {
        this.fkTutor = fkTutor;
    }

    public String getFkAlumno() {
        return fkAlumno;
    }

    public void setFkAlumno(String fkAlumno) {
        this.fkAlumno = fkAlumno;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }
}