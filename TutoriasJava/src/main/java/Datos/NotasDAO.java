package Datos;

import Modelo.Notas;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotasDAO {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    private static Notas nota = null;
    private static List<Notas> notaList = new ArrayList<>();

    private static final String SQLInsertNota = "INSERT INTO notas (fkTutor, fkAlumno, notas) " +
            "VALUES (?, ?, ?);";

    private static final String SQLSelectNotasPorAlumno = "SELECT * FROM notas WHERE fkAlumno = ?";


    public static List<Notas> selectNotasPorAlumno(String fkAlumno) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectNotasPorAlumno);
            ps.setString(1, fkAlumno);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idNotas = rs.getInt("idNotas");
                int fkTutor = rs.getInt("fkTutor");
                String notasTexto = rs.getString("notas");
                nota = new Notas(idNotas, fkTutor, fkAlumno, notasTexto);
                notaList.add(nota);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return notaList;
    }


    public void insertNota(Notas nota) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLInsertNota);
            ps.setInt(1, nota.getFkTutor());
            ps.setString(2, nota.getFkAlumno());
            ps.setString(3, nota.getNotas());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }


}
