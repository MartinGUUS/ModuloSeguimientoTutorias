package Controlador;

import Datos.AlumnosDAO;
import Datos.MensajesDAO;
import Modelo.Mensajes;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "svNuevoMensajeTutor", urlPatterns = "/svNuevoMensajeTutor")
public class svNuevoMensajeTutor extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correoalumno = request.getParameter("alumno").trim();
        String asunto = request.getParameter("asunto");
        String mensaje = request.getParameter("msj");
        int tutor = (int) request.getSession().getAttribute("idTutorLogin");
        
        Date fecha = new Date();
        
        AlumnosDAO alumnosDAO = new AlumnosDAO();
        String fkAlumno = alumnosDAO.getfkAlumno(correoalumno);
        
        if (fkAlumno != null && tutor != 0) {
            Mensajes mensajeBean = new Mensajes(mensaje, asunto, tutor, fkAlumno, fecha);
            
            MensajesDAO msj = new MensajesDAO();
            msj.insertMensaje(mensajeBean);
            
            response.sendRedirect("mensajeEnviado.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}