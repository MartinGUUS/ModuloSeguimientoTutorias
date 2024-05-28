package Modelo;

import java.io.Serializable;

public class Estatus implements Serializable {

    private static int idEstatus;
    private static String nombre;
    private static String descripcion;

    public Estatus() {
    }

    public Estatus(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public static int getIdEstatus() {
        return idEstatus;
    }

    public static void setIdEstatus(int idEstatus) {
        Estatus.idEstatus = idEstatus;
    }

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        Estatus.nombre = nombre;
    }

    public static String getDescripcion() {
        return descripcion;
    }

    public static void setDescripcion(String descripcion) {
        Estatus.descripcion = descripcion;
    }
}
