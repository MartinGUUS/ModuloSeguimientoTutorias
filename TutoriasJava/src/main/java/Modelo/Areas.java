package Modelo;

import java.io.Serializable;

public class Areas implements Serializable {

    private int idAreas;
    private String nombre;

    public Areas() {
    }
    
    public Areas(String nombre) {
        this.nombre = nombre;
    }
    
    public int getIdAreas() {
        return idAreas;
    }

    public void setIdAreas(int idAreas) {
        this.idAreas = idAreas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}