package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Alumnos implements Serializable {

    private static String matricula;
    private static String nombre;
    private static String segundoNombre;
    private static String apPaterno;
    private static String apMaterno;
    private static Date fechaNac;
    private static String numero;
    private static String correo;
    private static String direccion;
    private static String contra;
    private static String carrera;
    private static int semestre;
    private static int fkTutor;
    private static int fkEstatus;

    public Alumnos() {
    }

    public Alumnos(String matricula, String nombre, String segundoNombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String contra, String carrera, int semestre, int fkTutor, int fkEstatus) {
        this.matricula = matricula;
        this.nombre = nombre;
        this.segundoNombre = segundoNombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.fechaNac = fechaNac;
        this.numero = numero;
        this.correo = correo;
        this.direccion = direccion;
        this.contra = contra;
        this.carrera = carrera;
        this.semestre = semestre;
        this.fkTutor = fkTutor;
        this.fkEstatus = fkEstatus;
    }


    public Alumnos(String nombre, String segundoNombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String contra, String carrera, int semestre, int fkTutor, int fkEstatus) {
        this.nombre = nombre;
        this.segundoNombre = segundoNombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.fechaNac = fechaNac;
        this.numero = numero;
        this.correo = correo;
        this.direccion = direccion;
        this.contra = contra;
        this.carrera = carrera;
        this.semestre = semestre;
        this.fkTutor = fkTutor;
        this.fkEstatus = fkEstatus;
    }

    public static String getMatricula() {
        return matricula;
    }

    public static void setMatricula(String matricula) {
        Alumnos.matricula = matricula;
    }

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        Alumnos.nombre = nombre;
    }

    public static String getSegundoNombre() {
        return segundoNombre;
    }

    public static void setSegundoNombre(String segundoNombre) {
        Alumnos.segundoNombre = segundoNombre;
    }

    public static String getApPaterno() {
        return apPaterno;
    }

    public static void setApPaterno(String apPaterno) {
        Alumnos.apPaterno = apPaterno;
    }

    public static String getApMaterno() {
        return apMaterno;
    }

    public static void setApMaterno(String apMaterno) {
        Alumnos.apMaterno = apMaterno;
    }

    public static Date getFechaNac() {
        return fechaNac;
    }

    public static void setFechaNac(Date fechaNac) {
        Alumnos.fechaNac = fechaNac;
    }

    public static String getNumero() {
        return numero;
    }

    public static void setNumero(String numero) {
        Alumnos.numero = numero;
    }

    public static String getCorreo() {
        return correo;
    }

    public static void setCorreo(String correo) {
        Alumnos.correo = correo;
    }

    public static String getDireccion() {
        return direccion;
    }

    public static void setDireccion(String direccion) {
        Alumnos.direccion = direccion;
    }

    public static String getContra() {
        return contra;
    }

    public static void setContra(String contra) {
        Alumnos.contra = contra;
    }

    public static String getCarrera() {
        return carrera;
    }

    public static void setCarrera(String carrera) {
        Alumnos.carrera = carrera;
    }

    public static int getSemestre() {
        return semestre;
    }

    public static void setSemestre(int semestre) {
        Alumnos.semestre = semestre;
    }

    public static int getFkTutor() {
        return fkTutor;
    }

    public static void setFkTutor(int fkTutor) {
        Alumnos.fkTutor = fkTutor;
    }

    public static int getFkEstatus() {
        return fkEstatus;
    }

    public static void setFkEstatus(int fkEstatus) {
        Alumnos.fkEstatus = fkEstatus;
    }
}
