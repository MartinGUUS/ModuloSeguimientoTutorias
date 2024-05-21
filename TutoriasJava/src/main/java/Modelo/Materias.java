package Modelo;

import java.io.Serializable;

public class Materias implements Serializable {
    
    private int idMaterias;
    private String nombre;
    private int creditos;
    private int fkArea;

    public Materias() {
    }
    
    public Materias(String nombre, int creditos, int fkArea) {
        this.nombre = nombre;
        this.creditos = creditos;
        this.fkArea = fkArea;
    }

    public int getIdMaterias() {
        return idMaterias;
    }

    public void setIdMaterias(int idMaterias) {
        this.idMaterias = idMaterias;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public int getFkArea() {
        return fkArea;
    }

    public void setFkArea(int fkArea) {
        this.fkArea = fkArea;
    }
}