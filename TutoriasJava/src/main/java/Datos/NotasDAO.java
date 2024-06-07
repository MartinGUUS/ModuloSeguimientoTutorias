package Datos;

import Modelo.Notas;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotasDAO {

    public static List<Notas> selectNotasPorAlumno(String matricula) {
        List<Notas> notasList = new ArrayList<>();
        String sql = "SELECT * FROM notas WHERE fkAlumno = ?";
        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, matricula);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Notas nota = new Notas(
                            rs.getInt("idNotas"),
                            rs.getInt("fkTutor"),
                            rs.getString("fkAlumno"),
                            rs.getString("notas")
                    );
                    notasList.add(nota);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notasList;
    }

    public static boolean insertNota(Notas nota) {
        String sql = "INSERT INTO notas (fkTutor, fkAlumno, notas) VALUES (?, ?, ?)";
        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, nota.getFkTutor());
            ps.setString(2, nota.getFkAlumno());
            ps.setString(3, nota.getNotas());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
