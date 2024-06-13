package Controlador;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Datos.TutoriasDAO;
import Modelo.Tutorias;

public class RegistrarTutoriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matricula = request.getParameter("matricula");
        String fechaStr = request.getParameter("fecha");
        String contexto = request.getParameter("contexto");
        int duracion = Integer.parseInt(request.getParameter("duracion"));

        // Recuperar el id del tutor desde la sesión
        Integer fkTutor = (Integer) request.getSession().getAttribute("idTutorLogin");
        if (fkTutor == null) {
            response.sendRedirect("index.jsp"); // Redirigir a la página de inicio de sesión si no hay sesión activa
            return;
        }

        // Convertir fecha de String a java.sql.Date
        Date fecha = Date.valueOf(fechaStr);

        // Depuración
        System.out.println("Matrícula: " + matricula);
        System.out.println("Fecha: " + fecha);
        System.out.println("Contexto: " + contexto);
        System.out.println("Duración: " + duracion);
        System.out.println("tutor: " + fkTutor);

        TutoriasDAO dao = new TutoriasDAO();
        Tutorias tutorias = new Tutorias(0, matricula, fecha, contexto, duracion, fkTutor, 1);
        boolean result = dao.insertTutoria(tutorias);

        if (result) {
            response.sendRedirect("Tutorias.jsp?status=success");
        } else {
            response.sendRedirect("Tutorias.jsp?status=error");
        }
    }
}
