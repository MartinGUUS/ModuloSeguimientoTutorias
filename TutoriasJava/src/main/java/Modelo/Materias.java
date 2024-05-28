package Modelo;

import java.io.Serializable;

public class Materias implements Serializable {

    private static int idMaterias;
    private static String nombre;
    private static int creditos;
    private static int fkArea;

    public Materias() {
    }

    public Materias(int idMaterias, String nombre, int creditos, int fkArea) {
        this.idMaterias = idMaterias;
        this.nombre = nombre;
        this.creditos = creditos;
        this.fkArea = fkArea;
    }

    public Materias(String nombre, int creditos, int fkArea) {
        this.nombre = nombre;
        this.creditos = creditos;
        this.fkArea = fkArea;
    }

    public static int getIdMaterias() {
        return idMaterias;
    }

    public static void setIdMaterias(int idMaterias) {
        Materias.idMaterias = idMaterias;
    }

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        Materias.nombre = nombre;
    }

    public static int getCreditos() {
        return creditos;
    }

    public static void setCreditos(int creditos) {
        Materias.creditos = creditos;
    }

    public static int getFkArea() {
        return fkArea;
    }

    public static void setFkArea(int fkArea) {
        Materias.fkArea = fkArea;
    }
}
