package Datos;

import Modelo.Alumnos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlumnosDAO {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;



    private static final String SQLinsertAlumno = "INSERT INTO alumnos (matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SQLSelectVariosAlumnos = "SELECT * FROM alumnos WHERE fkTutor = ?";
    private static final String SQLSelectUnAlumnos = "SELECT * FROM alumnos WHERE fkTutor = ? AND fkAlumno = ?";


    public static List<Alumnos> selectAlumnosUno(int fkTutor, String fkAlumno) {
        List<Alumnos> alumnos = null;
        try {
            Alumnos al = null;
            alumnos = new ArrayList<>();
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectUnAlumnos);
            ps.setInt(1, fkTutor);
            ps.setString(2, fkAlumno);
            rs = ps.executeQuery();
            while (rs.next()) {
                String matricula = rs.getString("matricula");
                String nombre = rs.getString("nombre");
                String segundoNombre = rs.getString("segundoNombre");
                String apPaterno = rs.getString("apPaterno");
                String apMaterno = rs.getString("apMaterno");
                Date fechaNac = rs.getDate("fechaNac");
                String numero = rs.getString("numero");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                String contra = rs.getString("contra");
                String carrera = rs.getString("carrera");
                int semestre = rs.getInt("semestre");
                int fkTutorDB = rs.getInt("fkTutor");
                int fkEstatus = rs.getInt("fkEstatus");
                al = new Alumnos(matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutorDB, fkEstatus);
                alumnos.add(al);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return alumnos;
    }

    public static List<Alumnos> selectAlumnosVarios(int fkTutor) {
        List<Alumnos> alumnos = null;
        try {
            Alumnos al = null;
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectVariosAlumnos);
            ps.setInt(1, fkTutor);
            rs = ps.executeQuery();
            while (rs.next()) {
                String matricula = rs.getString("matricula");
                String nombre = rs.getString("nombre");
                String segundoNombre = rs.getString("segundoNombre");
                String apPaterno = rs.getString("apPaterno");
                String apMaterno = rs.getString("apMaterno");
                Date fechaNac = rs.getDate("fechaNac");
                String numero = rs.getString("numero");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                String contra = rs.getString("contra");
                String carrera = rs.getString("carrera");
                int semestre = rs.getInt("semestre");
                int fkTutorDB = rs.getInt("fkTutor");
                int fkEstatus = rs.getInt("fkEstatus");
                Alumnos alu = new Alumnos(matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutorDB, fkEstatus);
                alumnos.add(alu);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return alumnos;
    }


    public void insertAlumnos(Alumnos al) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLinsertAlumno);
            ps.setString(1, al.getMatricula());
            ps.setString(2, al.getNombre());
            ps.setString(3, al.getSegundoNombre());
            ps.setString(4, al.getApPaterno());
            ps.setString(5, al.getApMaterno());
            ps.setDate(6, al.getFechaNac());
            ps.setString(7, al.getNumero());
            ps.setString(8, al.getCorreo());
            ps.setString(9, al.getDireccion());
            ps.setString(10, al.getContra());
            ps.setString(11, al.getCarrera());
            ps.setInt(12, al.getSemestre());
            ps.setInt(13, al.getFkTutor());
            ps.setInt(14, 1);
            ps.execute();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }


}
