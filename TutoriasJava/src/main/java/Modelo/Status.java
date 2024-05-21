package Modelo;

import java.io.Serializable;

public class Status implements Serializable {
    
    private int idStatus;
    private String nombreStatus;
    private String descripcion;

    public Status() {
    }
    
    public Status(String nombreStatus, String descripcion) {
        this.nombreStatus = nombreStatus;
        this.descripcion = descripcion;
    }

    public int getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    public String getNombreStatus() {
        return nombreStatus;
    }

    public void setNombreStatus(String nombreStatus) {
        this.nombreStatus = nombreStatus;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
