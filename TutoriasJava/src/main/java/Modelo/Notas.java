package Modelo;

public class Notas {
    private int idNotas;
    private int fkTutor;
    private String fkAlumno;
    private String notas;

    public Notas() {}

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

    public int getIdNotas() {
        return idNotas;
    }

    public void setIdNotas(int idNotas) {
        this.idNotas = idNotas;
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

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }
}
