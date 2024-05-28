package Datos;

import Modelo.Tutorias;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TutoriasDAO {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;


    private static final String SQLinsertTutoria = "INSERT INTO tutorias (fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus) " +
            "VALUES (?, ?, ?, ?, ?, ?);";

    private static final String SQLSelectTutoriasPorAlumnoYTutor = "SELECT * FROM tutorias WHERE fkAlumno = ? AND fkTutor = ?";
    private static final String SQLSelectTutoriasPorTutor = "SELECT * FROM tutorias WHERE fkTutor = ?";
    private static final String SQLupdateFechaTutoria = "UPDATE tutorias SET fecha = ? WHERE idTutorias = ?";
    private static final String SQLupdateContextoTutoria = "UPDATE tutorias SET contexto = ? WHERE idTutorias = ?";
    private static final String SQLupdateDuracionTutoria = "UPDATE tutorias SET duracion = ? WHERE idTutorias = ?";
    private static final String SQLupdateEstatusTutoria = "UPDATE tutorias SET fkEstatus = ? WHERE idTutorias = ?";


    public void updateEstatus(Tutorias tutoria) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLupdateEstatusTutoria);
            ps.setInt(1, tutoria.getFkEstatus());
            ps.setInt(2, tutoria.getIdTutorias());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }

    public void updateDuracion(Tutorias tutoria) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLupdateDuracionTutoria);
            ps.setInt(1, tutoria.getDuracion());
            ps.setInt(2, tutoria.getIdTutorias());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }

    public void updateContexto(Tutorias tutoria) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLupdateContextoTutoria);
            ps.setString(1, tutoria.getContexto());
            ps.setInt(2, tutoria.getIdTutorias());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }

    public void updateFecha(Tutorias tutoria) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLupdateFechaTutoria);
            ps.setDate(1, tutoria.getFecha());
            ps.setInt(2, tutoria.getIdTutorias());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }


    public static List<Tutorias> selectTutoriasTutor(int fkTutor) {
        List<Tutorias> tutoriasList = null;
        try {
            Tutorias tu = null;
            tutoriasList = new ArrayList<>();
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectTutoriasPorTutor);
            ps.setInt(1, fkTutor);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idTutorias = rs.getInt("idTutorias");
                Date fecha = rs.getDate("fecha");
                String contexto = rs.getString("contexto");
                int duracion = rs.getInt("duracion");
                String fkAlumno = rs.getString("fkAlumno");
                int fkTutorDB = rs.getInt("fkTutor");
                int fkEstatus = rs.getInt("fkEstatus");
                tu = new Tutorias(idTutorias, fecha, contexto, duracion, fkAlumno, fkTutor, fkEstatus);
                tutoriasList.add(tu);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return tutoriasList;
    }

    public static List<Tutorias> selectTutoriasAlumnosTutores(int fkAlumno, int fkTutor) {
        List<Tutorias> tutoriasList = null;
        try {
            Tutorias tu = null;
            tutoriasList = new ArrayList<>();
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectTutoriasPorAlumnoYTutor);
            ps.setInt(1, fkTutor);
            ps.setInt(2, fkAlumno);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idTutorias = rs.getInt("idTutorias");
                Date fecha = rs.getDate("fecha");
                String contexto = rs.getString("contexto");
                int duracion = rs.getInt("duracion");
                String fkAlumnoDB = rs.getString("fkAlumno");
                int fkTutorDB = rs.getInt("fkTutor");
                int fkEstatus = rs.getInt("fkEstatus");
                tu = new Tutorias(idTutorias, fecha, contexto, duracion, fkAlumnoDB, fkTutorDB, fkEstatus);
                tutoriasList.add(tu);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return tutoriasList;
    }


    public void insertTutoria(Tutorias tutoria) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLinsertTutoria);
            ps.setDate(1, tutoria.getFecha());
            ps.setString(2, tutoria.getContexto());
            ps.setInt(3, tutoria.getDuracion());
            ps.setString(4, tutoria.getFkAlumno());
            ps.setInt(5, tutoria.getFkTutor());
            ps.setInt(6, 1);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }


}
