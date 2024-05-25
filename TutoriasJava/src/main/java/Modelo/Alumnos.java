package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Alumnos extends Usuarios implements Serializable  {
    
    private String matricula;
    private String carrera;
    private int semestre;
    private int fkPersona;
    private int fkTutor;
    private int fkStatus;


    public Alumnos(String nombre, String segundonombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String password, String matricula, String carrera, int semestre, int fkPersona, int fkTutor, int fkStatus) {
        super(nombre, segundonombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, password);
        this.matricula = matricula;
        this.carrera = carrera;
        this.semestre = semestre;
        this.fkPersona = fkPersona;
        this.fkTutor = fkTutor;
        this.fkStatus = fkStatus;
    }

    public Alumnos(int idUsuarios, String nombre, String segundonombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String password, String matricula, String carrera, int semestre, int fkPersona, int fkTutor, int fkStatus) {
        super(idUsuarios, nombre, segundonombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, password);
        this.matricula = matricula;
        this.carrera = carrera;
        this.semestre = semestre;
        this.fkPersona = fkPersona;
        this.fkTutor = fkTutor;
        this.fkStatus = fkStatus;
    }

    public Alumnos(String matricula, String carrera, int semestre, int fkPersona, int fkTutor, int fkStatus) {
        this.matricula = matricula;
        this.carrera = carrera;
        this.semestre = semestre;
        this.fkPersona = fkPersona;
        this.fkTutor = fkTutor;
        this.fkStatus = fkStatus;
    }
}