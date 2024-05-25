package Datos;

import org.apache.commons.dbcp2.BasicDataSource;
import javax.sql.DataSource;
import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Conexion {
    private final String user = "postgres";
    private final String pswd = "admin";
    private final String bd = "tutorias";
    private final String server = "jdbc:postgresql://localhost:5432/" + bd;
    private final String driver = "org.postgresql.Driver";


    private BasicDataSource ds;

    public DataSource getDataSource() {
        if (ds == null) {
            ds = new BasicDataSource();
            ds.setUrl(server);
            ds.setUsername(user);
            ds.setPassword(pswd);
            ds.setInitialSize(50);
            ds.setDriverClassName(driver);
        }
        return ds;
    }

    public Connection getConnection() throws SQLException {
        //  JOptionPane.showMessageDialog(null, "Hola Si funciona");
        return getDataSource().getConnection();
    }

    public void close(ResultSet rs) {
        try {
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }

    public void close(PreparedStatement ps) {
        try {
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }

    public void close(Connection conn) {
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }

}

