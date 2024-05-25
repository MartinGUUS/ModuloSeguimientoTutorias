package Datos;

import Modelo.Alumnos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlumnosDAO {

    private static final String selectPrincipal = "SELECT * FROM alumnos";

    public static List<Alumnos> listarAlumnos() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Alumnos ra = null;
        List<Alumnos> razas = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(selectPrincipal);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idUsuarios = rs.getInt("idUsuarios");
                String nombre = rs.getString("nombre");
                String segundonombre = rs.getString("segundoNombre");
                String apPaterno = rs.getString("apPaterno");
                String apMaterno = rs.getString("apMaterno");
                Date fechaNac = rs.getDate("fechaNac");
                String numero = rs.getString("numero");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                String password = rs.getString("password");
                String matricula = rs.getString("matricula");
                String carrera = rs.getString("carrera");
                int semestre = rs.getInt("semestre");
                int fkPersona = rs.getInt("fkPersona");
                int fkTutor = rs.getInt("fkTutor");
                int fkStatus = rs.getInt("fkStatus");
                ra = new Alumnos(idUsuarios, nombre, segundonombre, apPaterno,
                        apMaterno, fechaNac, numero, correo, direccion, password,
                        matricula, carrera, semestre, fkPersona, fkTutor, fkStatus);
                razas.add(ra);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return razas;
    }
}
