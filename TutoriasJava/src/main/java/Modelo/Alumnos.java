package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Alumnos implements Serializable {

    private String matricula;
    private String nombre;
    private String segundoNombre;
    private String apPaterno;
    private String apMaterno;
    private Date fechaNac;
    private String numero;
    private String correo;
    private String direccion;
    private String contra;
    private String carrera;
    private int semestre;
    private int fkTutor;
    private int fkEstatus;

    public Alumnos() {
    }
    public Alumnos(String matricula, String nombre, String segundoNombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String contra, String carrera, int semestre, int fkTutor, int fkEstatus) {
        this.matricula = matricula != null ? matricula : "";
        this.nombre = nombre != null ? nombre : "";
        this.segundoNombre = segundoNombre != null ? segundoNombre : "";
        this.apPaterno = apPaterno != null ? apPaterno : "";
        this.apMaterno = apMaterno != null ? apMaterno : "";
        this.fechaNac = fechaNac;
        this.numero = numero != null ? numero : "";
        this.correo = correo != null ? correo : "";
        this.direccion = direccion != null ? direccion : "";
        this.contra = contra != null ? contra : "";
        this.carrera = carrera != null ? carrera : "";
        this.semestre = semestre;
        this.fkTutor = fkTutor;
        this.fkEstatus = fkEstatus;
    }



    // Getters y Setters (No estáticos)

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
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

    public Date getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
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
