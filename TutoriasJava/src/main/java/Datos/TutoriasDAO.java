package Datos;

import Modelo.Tutorias;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TutoriasDAO {

    public static List<Tutorias> selectTutoriasPorAlumno(String matricula) {
        List<Tutorias> tutorias = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String SQLSelectTutoriasPorAlumno = "SELECT * FROM tutorias WHERE fkAlumno = ?";
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectTutoriasPorAlumno);
            ps.setString(1, matricula);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idTutoria = rs.getInt("idTutorias");
                Date fecha = rs.getDate("fecha");
                String contexto = rs.getString("contexto");
                int duracion = rs.getInt("duracion");
                int fkTutor = rs.getInt("fkTutor");
                int fkEstatus = rs.getInt("fkEstatus");
                Tutorias tutoria = new Tutorias(idTutoria, matricula, fecha, contexto, duracion, fkTutor, fkEstatus);
                tutorias.add(tutoria);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return tutorias;
    }

    public static boolean insertTutoria(Tutorias tutoria) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String SQLInsertTutoria = "INSERT INTO tutorias (fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus) VALUES (?, ?, ?, ?, ?, ?)";
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLInsertTutoria);
            ps.setDate(1, tutoria.getFecha());
            ps.setString(2, tutoria.getContexto());
            ps.setInt(3, tutoria.getDuracion());
            ps.setString(4, tutoria.getFkAlumno());
            ps.setInt(5, tutoria.getFkTutor());
            ps.setInt(6, tutoria.getFkEstatus());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return false;
    }
}