package Datos;

import Modelo.Usuarios;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDAO {

    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    private static final String insertAlumno = "INSERT INTO alumnos(semestre,fktutores,carrera,fkusuarios,fkestatus) VALUES(?,?,?,?,?);";
    private static final String insertTutor = "INSERT INTO tutores(fkusuarios,fkestatus) VALUES(?,?)";
    private static final String insertUsuario = "insert into usuarios " +
            "(nombre ,segundonombre,appaterno,apmaterno,numero,correo,direccion,clave,fkestatus,fechanac) " +
            "values (?,?,?,?,?,?,?,?,?,?,? )";

    private static final String selectLogin = "select * from usuarios " +
            "where correo = ? and password = ?";


    public static List<Usuarios> login(int mail, String pass) {
        List<Usuarios> usuarioslist = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(selectLogin);
            ps.setInt(1, mail);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idUsuarios = rs.getInt("idUsuarios");
                String nombre = rs.getString("nombre");
                String segundonombre = rs.getString("segundonombre");
                String apPaterno = rs.getString("apPaterno");
                String apMaterno = rs.getString("apMaterno");
                Date fechaNac = rs.getDate("fechaNac");
                String numero = rs.getString("numero");
                String correo = rs.getString("correo");
                String direccion = rs.getString("direccion");
                String password = rs.getString("direccion");
                Usuarios usuarios = new Usuarios(idUsuarios, nombre, segundonombre,
                        apPaterno, apMaterno, fechaNac, numero, correo, direccion, password);
                usuarioslist.add(usuarios);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return usuarioslist;
    }


    public void insertUsers(Usuarios ra) {
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement(insertUsuario);
            ps.setString(1, ra.getNombre());
            ps.setString(2, ra.getSegundonombre());
            ps.setString(3, ra.getApPaterno());
            ps.setString(4, ra.getApMaterno());
            ps.setString(5, ra.getNumero());
            ps.setString(6, ra.getCorreo());
            ps.setString(7, ra.getDireccion());
            ps.setString(8, ra.getPassword());
            ps.setInt(9, ra.getFkEstatus());
            ps.setDate(10, ra.getFechaNac());
            ps.execute();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }

}
