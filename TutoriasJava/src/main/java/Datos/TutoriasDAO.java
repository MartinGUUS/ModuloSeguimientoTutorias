package Datos;

import Modelo.Tutorias;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TutoriasDAO {
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    private static final String selectPrincipal = "SELECT " +
            "    t.idTutorias AS idTutorias, " +
            "    t.fecha AS Fecha, " +
            "    t.duracion AS Duracion, " +
            "    t.contexto AS Temas_Tratados, " +
            "    a.nombre AS Nombre_Alumno, " +
            "    a.apPaterno AS Apellido_Paterno_Alumno, " +
            "    a.apMaterno AS Apellido_Materno_Alumno, " +
            "    u.nombre AS Nombre_Tutor, " +
            "    u.apPaterno AS Apellido_Paterno_Tutor, " +
            "    u.apMaterno AS Apellido_Materno_Tutor " +
            "FROM " +
            "    tutorias t " +
            "JOIN " +
            "    alumnos a ON t.fkAlumno = a.idPersona " +
            "JOIN " +
            "    tutores tu ON t.fkTutor = tu.idTutores " +
            "JOIN " +
            "    usuarios u ON tu.fkPersona = u.idPersona " +
            "WHERE tu.idTutores = ? AND a.matricula = ?";



    public static List<Tutorias> listarTutoriasPorTutorAlumno(int idTutor, String matricula) {
        List<Tutorias> tutoriasList = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(selectPrincipal);
            ps.setInt(1, idTutor);
            ps.setString(2, matricula);
            rs = ps.executeQuery();

            while (rs.next()) {
                int idTutorias = rs.getInt("idTutorias");
                Date fecha = rs.getDate("Fecha");
                int duracion = rs.getInt("Duracion");
                String temasTratados = rs.getString("Temas_Tratados");
                String nombreAlumno = rs.getString("Nombre_Alumno");
                String apellidoPaternoAlumno = rs.getString("Apellido_Paterno_Alumno");
                String apellidoMaternoAlumno = rs.getString("Apellido_Materno_Alumno");
                String nombreTutor = rs.getString("Nombre_Tutor");
                String apellidoPaternoTutor = rs.getString("Apellido_Paterno_Tutor");
                String apellidoMaternoTutor = rs.getString("Apellido_Materno_Tutor");

                Tutorias tutoria = new Tutorias(idTutorias, fecha, duracion, temasTratados, nombreAlumno, apellidoPaternoAlumno, apellidoMaternoAlumno, nombreTutor, apellidoPaternoTutor, apellidoMaternoTutor);
                tutoriasList.add(tutoria);
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
}
