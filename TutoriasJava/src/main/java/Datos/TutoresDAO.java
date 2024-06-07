package Datos;

import Modelo.Tutores;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TutoresDAO {

    private static final String SQLSelectTutores = "SELECT * FROM tutores";

    private static final String insertTutor = "INSERT INTO tutores (nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, fkEstatus) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String BuscarfkTutor = "SELECT idtutores FROM tutores WHERE correo = ?";

    public List<Tutores> selectTutoresVarios() {
        List<Tutores> tutores = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectTutores);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idTutor = rs.getInt("idtutores");
                String nombre = rs.getString("nombre");
                String segundoNombre = rs.getString("segundonombre");
                String apPaterno = rs.getString("appaterno");
                String apMaterno = rs.getString("apmaterno");
                Date fechaNac = rs.getDate("fechanac");
                String numero = rs.getString("numero");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                String contra = rs.getString("contra");
                int fkEstatus = rs.getInt("fkEstatus");

                // Crear una nueva instancia de Tutores en cada iteración
                Tutores tut = new Tutores(idTutor, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, fkEstatus);
                tutores.add(tut);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return tutores;
    }

    public void insertTutor(Tutores tutor) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
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

    public int getfkTutor(String correo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int fkTutor = -1;
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(BuscarfkTutor);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            if (rs.next()) {
                fkTutor = rs.getInt("idtutores");
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return fkTutor;
    }
}
