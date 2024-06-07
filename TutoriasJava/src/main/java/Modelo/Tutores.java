package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Tutores implements Serializable {

    private static int idtutores;
    private static String nombre;
    private static String segundoNombre;
    private static String apPaterno;
    private static String apMaterno;
    private static Date fechaNac;
    private static String numero;
    private static String correo;
    private static String direccion;
    private static String contra;
    private static int fkEstatus;

    public Tutores() {
    }

    public Tutores(int idtutores, String nombre, String segundoNombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String contra, int fkEstatus) {
        this.idtutores = idtutores;
        this.nombre = nombre;
        this.segundoNombre = segundoNombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.fechaNac = fechaNac;
        this.numero = numero;
        this.correo = correo;
        this.direccion = direccion;
        this.contra = contra;
        this.fkEstatus = fkEstatus;
    }

    public Tutores(String nombre, String segundoNombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String contra, int fkEstatus) {
        this.nombre = nombre;
        this.segundoNombre = segundoNombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.fechaNac = fechaNac;
        this.numero = numero;
        this.correo = correo;
        this.direccion = direccion;
        this.contra = contra;
        this.fkEstatus = fkEstatus;
    }

    public static int getIdtutores() {
        return idtutores;
    }

    public static void setIdTutores(int idtutores) {
        Tutores.idtutores = idtutores;
    }

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        Tutores.nombre = nombre;
    }

    public static String getSegundoNombre() {
        return segundoNombre;
    }

    public static void setSegundoNombre(String segundoNombre) {
        Tutores.segundoNombre = segundoNombre;
    }

    public static String getApPaterno() {
        return apPaterno;
    }

    public static void setApPaterno(String apPaterno) {
        Tutores.apPaterno = apPaterno;
    }

    public static String getApMaterno() {
        return apMaterno;
    }

    public static void setApMaterno(String apMaterno) {
        Tutores.apMaterno = apMaterno;
    }

    public static Date getFechaNac() {
        return fechaNac;
    }

    public static void setFechaNac(Date fechaNac) {
        Tutores.fechaNac = fechaNac;
    }

    public static String getNumero() {
        return numero;
    }

    public static void setNumero(String numero) {
        Tutores.numero = numero;
    }

    public static String getCorreo() {
        return correo;
    }

    public static void setCorreo(String correo) {
        Tutores.correo = correo;
    }

    public static String getDireccion() {
        return direccion;
    }

    public static void setDireccion(String direccion) {
        Tutores.direccion = direccion;
    }

    public static String getContra() {
        return contra;
    }

    public static void setContra(String contra) {
        Tutores.contra = contra;
    }

    public static int getFkEstatus() {
        return fkEstatus;
    }

    public static void setFkEstatus(int fkEstatus) {
        Tutores.fkEstatus = fkEstatus;
    }


}
