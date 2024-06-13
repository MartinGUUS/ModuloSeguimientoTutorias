package Controlador;

import Datos.NotasDAO;
import Modelo.Notas;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

public class AlumnoNotasServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matricula = request.getParameter("matricula");
        System.out.println("Recibida matrícula: " + matricula); // Log para depuración

        if (matricula != null) {
            List<Notas> notas = NotasDAO.selectNotasPorAlumno(matricula);
            String json;
            if (notas != null && !notas.isEmpty()) {
                json = new Gson().toJson(notas);
            } else {
                json = "[]";
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else {
            System.err.println("Parámetro 'matricula' faltante"); // Log para depuración
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameter: matricula.");
        }
    }
}

