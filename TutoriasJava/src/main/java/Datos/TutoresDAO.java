package Datos;

import Modelo.Tutores;

import java.sql.*;


public class TutoresDAO {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    private static final String insertTutor = "INSERT INTO tutores (nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, fkEstatus) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    public void insertTutor(Tutores tutor) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(insertTutor);
            ps.setString(1, tutor.getNombre());
            ps.setString(2, tutor.getSegundoNombre());
            ps.setString(3, tutor.getApPaterno());
            ps.setString(4, tutor.getApMaterno());
            ps.setDate(5, tutor.getFechaNac());
            ps.setString(6, tutor.getNumero());
            ps.setString(7, tutor.getCorreo());
            ps.setString(8, tutor.getDireccion());
            ps.setString(9, tutor.getContra());
            ps.setInt(10, 1);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }


}
