package Datos;

import Modelo.Alumnos;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Materias_alumnosDAO {

    private static final String MateriasTotales = "SELECT COUNT(*) FROM materias";
    private static final String AvanceTotal = "SELECT COUNT(*) FROM materias_alumnos ma JOIN materias m ON ma.fkMaterias = m.idMaterias WHERE ma.calificacion > 6 AND m.fkArea != 4 AND ma.fkalumnos=?";
    private static final String SQLSelectAlumnoById = "SELECT * FROM alumnos WHERE matricula = ?";

    public static Alumnos selectAlumnoPorMatricula(String matricula) {
        Alumnos alumno = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String SQLSelectAlumnoPorMatricula = "SELECT * FROM alumnos WHERE matricula = ?";
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectAlumnoPorMatricula);
            ps.setString(1, matricula);
            rs = ps.executeQuery();
            if (rs.next()) {
                String nombre = rs.getString("nombre");
                String segundoNombre = rs.getString("segundoNombre");
                String apPaterno = rs.getString("apPaterno");
                String apMaterno = rs.getString("apMaterno");
                Date fechaNac = rs.getDate("fechaNac");
                String numero = rs.getString("numero");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                String contra = rs.getString("contra");
                String carrera = rs.getString("carrera");
                int semestre = rs.getInt("semestre");
                int fkTutor = rs.getInt("fkTutor");
                int fkEstatus = rs.getInt("fkEstatus");
                alumno = new Alumnos(matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return alumno;
    }

    public static int contarMateriasTotales() {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(MateriasTotales);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return count;
    }

    public static int contarAvanceTotal(String matricula) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(AvanceTotal);
            ps.setString(1, matricula);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return count;
    }
}
