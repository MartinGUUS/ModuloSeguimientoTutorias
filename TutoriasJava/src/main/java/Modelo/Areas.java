package Modelo;

import java.io.Serializable;

public class Areas implements Serializable {

    private static int idAreas;
    private static String nombre;

    public Areas() {
    }

    public Areas(String nombre) {
        this.nombre = nombre;
    }

    public static int getIdAreas() {
        return idAreas;
    }

    public static void setIdAreas(int idAreas) {
        Areas.idAreas = idAreas;
    }

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        Areas.nombre = nombre;
    }
}
