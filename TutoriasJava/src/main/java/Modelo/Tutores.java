package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Tutores implements Serializable {

    private int idTutores;
    private String nombre;
    private String segundoNombre;
    private String apPaterno;
    private String apMaterno;
    private Date fechaNac;
    private String numero;
    private String correo;
    private String direccion;
    private String contra;
    private int fkEstatus;

    public Tutores() {
    }

    public Tutores(int idtutores, String nombre, String segundoNombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String contra, int fkEstatus) {
        this.idTutores = idtutores;
        this.nombre = nombre != null ? nombre : "";
        this.segundoNombre = segundoNombre != null ? segundoNombre : "";
        this.apPaterno = apPaterno != null ? apPaterno : "";
        this.apMaterno = apMaterno != null ? apMaterno : "";
        this.fechaNac = fechaNac;
        this.numero = numero != null ? numero : "";
        this.correo = correo != null ? correo : "";
        this.direccion = direccion != null ? direccion : "";
        this.contra = contra != null ? contra : "";
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


    public int getIdTutores() {
        return idTutores;
    }

    public void setIdTutores(int idTutores) {
        this.idTutores = idTutores;
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

    public int getFkEstatus() {
        return fkEstatus;
    }

    public void setFkEstatus(int fkEstatus) {
        this.fkEstatus = fkEstatus;
    }
}
