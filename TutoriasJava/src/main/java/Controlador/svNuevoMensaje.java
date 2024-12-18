package Controlador;

import Datos.TutoresDAO;
import Datos.MensajesDAO;
import Modelo.Mensajes;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class svNuevoMensaje extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correotutor = request.getParameter("tutor").trim();
        String asunto = request.getParameter("asunto");
        String mensaje = request.getParameter("msj");
        String alumno = (String) request.getSession().getAttribute("matriculaAlumno");

        Date fecha = new Date();

        TutoresDAO tutoresDAO = new TutoresDAO();
        int fkTutor = tutoresDAO.getfkTutor(correotutor);

        if (fkTutor != -1 && alumno != null) {
            Mensajes mensajeBean = new Mensajes(mensaje, asunto, fkTutor, alumno, fecha);

            MensajesDAO msj = new MensajesDAO();
            msj.insertMensajeAlumno(mensajeBean);

            response.sendRedirect("Mensajes.jsp?status=success");
        } else {
            response.sendRedirect("Mensajes.jsp?status=error");
        }
    }
}
