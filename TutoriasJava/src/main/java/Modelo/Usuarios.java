package Modelo;

import java.io.Serializable;
import java.sql.Date;

public class Usuarios implements Serializable {

    private int idPersona;
    private String nombre;
    private String segundonombre;
    private String apPaterno;
    private String apMaterno;
    private Date fechaNac;
    private String numero;
    private String correo;
    private String direccion;
    private String password;

    public Usuarios() {
    }
    
    public Usuarios(int idPersona, String nombre, String segundonombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String password) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.segundonombre = segundonombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.fechaNac = fechaNac;
        this.numero = numero;
        this.correo = correo;
        this.direccion = direccion;
        this.password = password;
    }
    
    public Usuarios(String nombre, String segundonombre, String apPaterno, String apMaterno, Date fechaNac, String numero, String correo, String direccion, String password) {
        this.nombre = nombre;
        this.segundonombre = segundonombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.fechaNac = fechaNac;
        this.numero = numero;
        this.correo = correo;
        this.direccion = direccion;
        this.password = password;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSegundonombre() {
        return segundonombre;
    }

    public void setSegundonombre(String segundonombre) {
        this.segundonombre = segundonombre;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}