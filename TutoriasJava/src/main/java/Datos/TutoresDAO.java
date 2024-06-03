package Datos;

import Modelo.Alumnos;
import Modelo.Tutores;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class TutoresDAO {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    private static final String SQLSelectTutores = "SELECT * FROM tutores ";

    private static final String insertTutor = "INSERT INTO tutores (nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, fkEstatus) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    public List<Tutores> selectTutoresVarios() {
        List<Tutores> tutores = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Tutores tu = null;
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectTutores);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idTutor = rs.getInt("idTutores");
                String nombre = rs.getString("nombre");
                String segundoNombre = rs.getString("segundoNombre");
                String apPaterno = rs.getString("apPaterno");
                String apMaterno = rs.getString("apMaterno");
                Date fechaNac = rs.getDate("fechaNac");
                String numero = rs.getString("numero");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                String contra = rs.getString("contra");

                int fkEstatus = rs.getInt("fkEstatus");
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
