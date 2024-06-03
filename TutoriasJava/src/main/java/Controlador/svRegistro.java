package Controlador;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "svRegistro", urlPatterns = "/svRegistro")
public class svRegistro extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String segundoNombre = request.getParameter("segnombre");
        String apPaterno = request.getParameter("paterno");
        String apMaterno = request.getParameter("materno");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String contra = request.getParameter("contra");
        String matricula = request.getParameter("matricula");
        String carrera = request.getParameter("carrera");
        String rol = request.getParameter("rol");
        String semestreParam = request.getParameter("semestre");
        int semestre = 0;
        if (!semestreParam.isEmpty()) {
            semestre = Integer.parseInt(semestreParam);
        }
        String tutorParam = request.getParameter("tutoralu");
        int tutor = 0;
        if (tutorParam != null && !tutorParam.isEmpty()) {
            tutor = Integer.parseInt(tutorParam);
        }
        String fechaNacString = request.getParameter("nacimiento");
        Date fechaNacimiento = null;
        if (fechaNacString != null && !fechaNacString.isEmpty()) {
            fechaNacimiento = Date.valueOf(fechaNacString);
        }




        switch (rol) {
            case "alumno":

                break;

            case "tutor":

                break;
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
