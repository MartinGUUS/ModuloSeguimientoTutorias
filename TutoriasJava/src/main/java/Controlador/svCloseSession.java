package Controlador;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "svCloseSession", urlPatterns = "/svCloseSession")
public class svCloseSession extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("action");

        switch (accion) {
            case "cerrarSesion":
                HttpSession session = request.getSession();
                session.removeAttribute("nameTutor");
                session.removeAttribute("idTutorLogin");
                session.removeAttribute("nombreAlumno");
                session.removeAttribute("matriculaAlumno");
                response.sendRedirect("index.jsp");
                break;
            default:
                break;

        }

    }
}
