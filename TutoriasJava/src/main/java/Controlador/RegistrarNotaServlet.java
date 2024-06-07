package Controlador;

import Datos.NotasDAO;
import Modelo.Notas;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegistrarNotaServlet")
public class RegistrarNotaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matricula = request.getParameter("matricula");
        String notaTexto = request.getParameter("nota");

        Integer fkTutor = (Integer) request.getSession().getAttribute("idTutorLogin");
        if (fkTutor == null) {
            response.sendRedirect("index.jsp"); // Redirigir a la página de inicio de sesión si no hay sesión activa
            return;
        }

        NotasDAO dao = new NotasDAO();
        Notas nota = new Notas(0, fkTutor, matricula, notaTexto);
        boolean result = dao.insertNota(nota);

        if (result) {
            response.sendRedirect("Notas.jsp?status=success");
        } else {
            response.sendRedirect("Notas.jsp?status=error");
        }
    }
}
