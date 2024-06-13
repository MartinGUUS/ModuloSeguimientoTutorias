package Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EstadisticaDAO {

    public int getTotalAlumnos() {
        String query = "SELECT COUNT(*) FROM alumnos";
        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalTutores() {
        String query = "SELECT COUNT(*) FROM tutores";
        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalTutoriasProgramadas() {
        String query = "SELECT COUNT(*) FROM tutorias";
        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<String> getAlumnosPorCarrera() {
        String query = "SELECT carrera, COUNT(*) FROM alumnos GROUP BY carrera";
        List<String> result = new ArrayList<>();
        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String carrera = rs.getString(1);
                int count = rs.getInt(2);
                result.add(carrera + ": " + count);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public double getPromedioCalificaciones() {
        String query = "SELECT AVG(calificacion) FROM materias_alumnos";
        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    public List<String> getAlumnosPorSemestre() {
        String query = "SELECT semestre, COUNT(*) FROM alumnos GROUP BY semestre order by semestre asc";
        List<String> result = new ArrayList<>();
        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int semestre = rs.getInt(1);
                int count = rs.getInt(2);
                result.add("Semestre " + semestre + ": " + count);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
