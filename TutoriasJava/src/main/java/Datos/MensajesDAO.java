package Datos;

import Modelo.Mensajes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MensajesDAO {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;


    private static final String SQLinsertMensaje = "INSERT INTO mensajes (mensaje, asunto, fkTutor, fkAlumno)" +
            " VALUES (?, ?, ?, ?)";
    private static final String SQLselectMensajesPorAlumno = "SELECT * FROM mensajes WHERE fkAlumno = ?";
    private static final String SQLselectMensajesPorTutor = "SELECT * FROM mensajes WHERE fkTutor = ?";


    public static List<Mensajes> selectMensajesPorTutor(int fkTutor) {
        List<Mensajes> mensajesList = null;
        try {
            Mensajes me = null;
            mensajesList = new ArrayList<>();
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLselectMensajesPorTutor);
            ps.setInt(1, fkTutor);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idMensajes = rs.getInt("idMensajes");
                String mensaje = rs.getString("mensaje");
                String asunto = rs.getString("asunto");
                int fkTutordb = rs.getInt("fkTutor");
                String fkAlumno = rs.getString("fkAlumno");
                me = new Mensajes(idMensajes, mensaje, asunto, fkTutordb, fkAlumno);
                mensajesList.add(me);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return mensajesList;
    }


    public static List<Mensajes> selectMensajesPorAlumno(String fkAlumno) {
        List<Mensajes> mensajesList = null;
        try {
            Mensajes me = null;
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLselectMensajesPorAlumno);
            ps.setString(1, fkAlumno);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idMensajes = rs.getInt("idMensajes");
                String mensaje = rs.getString("mensaje");
                String asunto = rs.getString("asunto");
                int fkTutor = rs.getInt("fkTutor");
                String fkAlumnodb = rs.getString("fkAlumno");
                me = new Mensajes(idMensajes, mensaje, asunto, fkTutor, fkAlumnodb);
                mensajesList.add(me);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return mensajesList;
    }

    public void insertMensaje(Mensajes men) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLinsertMensaje);
            ps.setString(1, men.getMensaje());
            ps.setString(2, men.getAsunto());
            ps.setInt(3, men.getFkTutor());
            ps.setString(4, men.getFkAlumno());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }

}
