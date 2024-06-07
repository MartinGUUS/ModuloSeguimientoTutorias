package Datos;

import Modelo.Alumnos;
import Modelo.Tutores;

import java.sql.*;
import java.util.List;

public class Main {
    public static void main(String[] args) throws SQLException {

        TutoresDAO tutoresDAO = new TutoresDAO();
        List<Tutores> as = tutoresDAO.selectTutoresVarios();
        String tuto=" ";
        for (int i = 0; i < as.size(); i++) {
           tuto= (as.get(i).getIdtutores()+".- "+as.get(i).getNombre().toUpperCase() + " " + as.get(i).getSegundoNombre().toUpperCase() + " " + as.get(i).getApPaterno().toUpperCase() + " " + as.get(i).getApMaterno().toUpperCase());
        }

    }
}
