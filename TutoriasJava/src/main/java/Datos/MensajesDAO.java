package Datos;

import Modelo.Mensajes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MensajesDAO {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    private static final String SQLinsertMensajeTutor = "INSERT INTO mensajes (mensaje, asunto, fkTutor, fkAlumno, fecha, fkEstatus)"
            + " VALUES (?, ?, ?, ?, ?, 1)";

    private static final String SQLinsertMensajeAlumno = "INSERT INTO mensajes (mensaje, asunto, fkTutor, fkAlumno, fecha)"
            + " VALUES (?, ?, ?, ?, ?)";
    private static final String SQLselectMensajesPorTutor = "SELECT \n" +
            "    m.idMensajes,\n" +
            "    m.mensaje,\n" +
            "    m.asunto,\n" +
            "    m.fecha,\n" +
            "    m.fkTutor,\n" +
            "    m.fkAlumno,\n" +
            "    a.nombre,\n" +
            "    a.segundoNombre,\n" +
            "    a.apPaterno,\n" +
            "    a.apMaterno\n" +
            "FROM \n" +
            "    mensajes m\n" +
            "JOIN \n" +
            "    alumnos a ON m.fkAlumno = a.matricula\n" +
            "WHERE \n" +
            "    m.fkTutor = ? \n" +
            "    AND m.fkEstatus IS NULL\n" +
            "ORDER BY \n" +
            "    m.idMensajes DESC";



    private static final String SQLselectMensajesPorAlumno = "SELECT \n" +
            "    m.idMensajes,\n" +
            "    m.mensaje,\n" +
            "    m.asunto,\n" +
            "    m.fecha,\n" +
            "    m.fkTutor,\n" +
            "    m.fkAlumno,\n" +
            "    t.nombre,\n" +
            "    t.segundoNombre,\n" +
            "    t.apPaterno,\n" +
            "    t.apMaterno\n" +
            "FROM \n" +
            "    mensajes m\n" +
            "JOIN \n" +
            "    tutores t ON m.fkTutor = t.idTutores\n" +
            "WHERE \n" +
            "    m.fkAlumno = ? \n" +
            "    AND m.fkEstatus = 1 \n" +
            "ORDER BY \n" +
            "    m.idMensajes DESC";


    public List<Mensajes> selectMensajesPorTutor(int fkTutor) {
        List<Mensajes> mensajesList = new ArrayList<>();
        try {
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
                Date fecha = rs.getDate("fecha");
                String nombre = rs.getString("nombre");
                String segundoNombre = rs.getString("segundoNombre");
                String apPaterno = rs.getString("apPaterno");
                String apMaterno = rs.getString("apMaterno");

                Mensajes me = new Mensajes(idMensajes, mensaje, asunto, fkTutordb, fkAlumno, fecha, nombre, segundoNombre, apPaterno, apMaterno);
                mensajesList.add(me);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return mensajesList;
    }

    public static List<Mensajes> selectMensajesPorAlumno(String fkAlumno) {
        List<Mensajes> mensajesList = new ArrayList<>();
        try {
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
                Date fecha = rs.getDate("fecha");
                String nombre = rs.getString("nombre");
                String segundoNombre = rs.getString("segundoNombre");
                String apPaterno = rs.getString("apPaterno");
                String apMaterno = rs.getString("apMaterno");

                Mensajes me = new Mensajes(idMensajes, mensaje, asunto, fkTutor, fkAlumnodb, fecha, nombre, segundoNombre, apPaterno, apMaterno);
                mensajesList.add(me);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return mensajesList;
    }


    public void insertMensaje(Mensajes men) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLinsertMensajeTutor);
            ps.setString(1, men.getMensaje());
            ps.setString(2, men.getAsunto());
            ps.setInt(3, men.getFkTutor());
            ps.setString(4, men.getFkAlumno());
            ps.setDate(5, new java.sql.Date(men.getFecha().getTime()));
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
    }


    public void insertMensajeAlumno(Mensajes men) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLinsertMensajeAlumno);
            ps.setString(1, men.getMensaje());
            ps.setString(2, men.getAsunto());
            ps.setInt(3, men.getFkTutor());
            ps.setString(4, men.getFkAlumno());
            ps.setDate(5, new java.sql.Date(men.getFecha().getTime()));
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
    }
}
