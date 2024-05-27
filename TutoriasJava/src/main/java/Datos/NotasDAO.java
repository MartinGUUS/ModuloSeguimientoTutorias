package Datos;

public class NotasDAO {


    public static final String selectNotasAlumno = "select * from notas " +
            "where fkAlumno = ?";

    public static final String insertNotas = "insert into notas (fkTutor, fkAlumno, notas)" +
            " values (?,?,?)";

    public static final String updateNotasAlumno = "update notas set " +
            "";
}
