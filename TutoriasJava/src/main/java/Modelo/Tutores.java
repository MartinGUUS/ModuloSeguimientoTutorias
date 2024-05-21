package Modelo;

import java.io.Serializable;

public class Tutores implements Serializable {

    private String matricula;
    private int fkPersona;
    private int fkStatus;
    
    public Tutores() {
    }
    
    public Tutores(String matricula, int fkPersona, int fkStatus) {
        this.matricula = matricula;
        this.fkPersona = fkPersona;
        this.fkStatus = fkStatus;
    }
    
    public Tutores(int fkPersona, int fkStatus) {
        this.fkPersona = fkPersona;
        this.fkStatus = fkStatus;
    }
    
    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public int getFkPersona() {
        return fkPersona;
    }

    public void setFkPersona(int fkPersona) {
        this.fkPersona = fkPersona;
    }

    public int getFkStatus() {
        return fkStatus;
    }

    public void setFkStatus(int fkStatus) {
        this.fkStatus = fkStatus;
    }
}