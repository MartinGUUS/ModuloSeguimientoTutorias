package Datos;

import Modelo.Alumnos;
import Modelo.Tutores;

import java.sql.*;
import java.util.List;

public class Main {
    public static void main(String[] args) throws SQLException {
        TutoresDAO tutoresDAO = new TutoresDAO();
        List<Tutores> tutoresList = tutoresDAO.selectTutoresVarios();
        for (int i = 0; i < tutoresList.size(); i++) {
            System.out.println("nombre: " + tutoresList.get(i).getNombre());
        }
    }
}
