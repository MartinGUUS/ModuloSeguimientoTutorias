package Modelo;

import java.io.Serializable;

public class Alumnos implements Serializable {
    
    private String matricula;
    private String carrera;
    private int semestre;
    private int fkPersona;
    private String fkTutor;
    private int fkStatus;

    public Alumnos() {
    }
    
    public Alumnos(String matricula, String carrera, int semestre, int fkPersona, String fkTutor, int fkStatus) {
        this.matricula = matricula;
        this.carrera = carrera;
        this.semestre = semestre;
        this.fkPersona = fkPersona;
        this.fkTutor = fkTutor;
        this.fkStatus = fkStatus;
    }
    
    public Alumnos(String carrera, int semestre, int fkPersona, String fkTutor, int fkStatus) {
        this.carrera = carrera;
        this.semestre = semestre;
        this.fkPersona = fkPersona;
        this.fkTutor = fkTutor;
        this.fkStatus = fkStatus;
    }
    
    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public int getFkPersona() {
        return fkPersona;
    }

    public void setFkPersona(int fkPersona) {
        this.fkPersona = fkPersona;
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