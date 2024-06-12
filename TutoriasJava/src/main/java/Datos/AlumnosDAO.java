package Datos;

import Modelo.Alumnos;
import Modelo.Historial;
import Modelo.Materias;
import Modelo.Materias_alumnos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlumnosDAO {

    private static final String SQLSelectAlumnoById = "SELECT * FROM alumnos WHERE matricula = ?";

    private static final String SQLinsertAlumno = "INSERT INTO alumnos (matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SQLSelectVariosAlumnos = "SELECT * FROM alumnos WHERE fkTutor = ?";
    private static final String SQLSelectAlumnos = "SELECT * FROM alumnos ";
    private static final String SQLSelectUnAlumnos = "SELECT * FROM alumnos WHERE fkTutor = ? AND fkAlumno = ?";
    private static final String BuscarfkAlumno = "SELECT matricula FROM alumnos WHERE correo = ?";
    private static final String BuscarCorreoAlumno = "SELECT correo FROM alumnos WHERE fkTutor = ?";
    private static final String HistorialAlumnos = "SELECT m.nombre, m.creditos, ma.calificacion, ma.inscripcion FROM  alumnos a JOIN materias_alumnos ma ON a.matricula = ma.fkAlumnos JOIN  materias m ON ma.fkMaterias = m.idMaterias JOIN areas ar ON m.fkArea = ar.idAreas WHERE a.matricula = ? AND ar.idAreas = ?";
    private static final String MateriasAprobadas = "SELECT COUNT(*) FROM materias_alumnos ma JOIN materias m ON ma.fkMaterias = m.idMaterias WHERE ma.calificacion > 6 AND fkArea = ? AND ma.fkalumnos=?";
    private static final String MateriasTotalesPorArea = "SELECT COUNT(*) FROM materias WHERE fkArea = ?";

    public Alumnos selectTutorById(String matriculaa) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Alumnos alumno = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectAlumnoById);
            ps.setString(1, matriculaa);
            rs = ps.executeQuery();

            if (rs.next()) {
                String matricula = rs.getString("matricula");
                String nombre = rs.getString("nombre");
                String segundoNombre = rs.getString("segundonombre");
                String apPaterno = rs.getString("appaterno");
                String apMaterno = rs.getString("apmaterno");
                Date fechaNac = rs.getDate("fechanac");
                String numero = rs.getString("numero");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                String contra = rs.getString("contra");
                String carrera = rs.getString("carrera");
                int semestre = rs.getInt("semestre");
                int fkTutor = rs.getInt("fkTutor");
                int fkEstatus = rs.getInt("fkEstatus");

                alumno = new Alumnos(matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return alumno;
    }

    public static List<Alumnos> selectAlumnosUno(int fkTutor, String fkAlumno) {
        List<Alumnos> alumnos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
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

    public static List<Alumnos> selectAlumnosVariosPorTutor(int fkTutor) {
        List<Alumnos> alumnos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
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

    public static Alumnos selectAlumnoPorMatricula(String matricula) {
        Alumnos alumno = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String SQLSelectAlumnoPorMatricula = "SELECT * FROM alumnos WHERE matricula = ?";
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectAlumnoPorMatricula);
            ps.setString(1, matricula);
            rs = ps.executeQuery();
            if (rs.next()) {
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
                int fkTutor = rs.getInt("fkTutor");
                int fkEstatus = rs.getInt("fkEstatus");
                alumno = new Alumnos(matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNac, numero, correo, direccion, contra, carrera, semestre, fkTutor, fkEstatus);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return alumno;
    }

    public static List<Alumnos> selectAlumnosVarios() {
        List<Alumnos> alumnos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Alumnos al = null;
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectAlumnos);
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
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
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

    public String getfkAlumno(String correo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String fkAlumno = null;
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(BuscarfkAlumno);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            if (rs.next()) {
                fkAlumno = rs.getString("matricula");
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return fkAlumno;
    }

    public List<String> BuscarCorreoAlumno(int fkTutor) {
        List<String> correos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(SQLSelectVariosAlumnos);
            ps.setInt(1, fkTutor);
            rs = ps.executeQuery();
            while (rs.next()) {
                String correo = rs.getString("correo");
                correos.add(correo);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return correos;
    }

    public static List<Historial> HistorialAlumnos(String matricula, int idArea) {
        List<Historial> historial = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(HistorialAlumnos);
            ps.setString(1, matricula);
            ps.setInt(2, idArea);
            rs = ps.executeQuery();
            while (rs.next()) {
                String nombreMateria = rs.getString("nombre");
                int creditos = rs.getInt("creditos");
                int calificacion = rs.getInt("calificacion");
                int inscripcion = rs.getInt("inscripcion");

                Materias mat = new Materias(nombreMateria, creditos);
                Materias_alumnos matal = new Materias_alumnos(calificacion, inscripcion);
                Historial his = new Historial(mat, matal);

                historial.add(his);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return historial;
    }

    public static int contarMateriasAprobadas(int area, String matricula) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(MateriasAprobadas);
            ps.setInt(1, area);
            ps.setString(2, matricula);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return count;
    }

    public static int contarMateriasTotalesPorArea(int area) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(MateriasTotalesPorArea);
            ps.setInt(1, area);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return count;
    }
}
