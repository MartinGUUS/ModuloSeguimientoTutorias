package Controlador;

import Datos.AlumnosDAO;
import Datos.TutoresDAO;
import Modelo.Alumnos;
import Modelo.Tutores;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class svRegistro extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre").trim();
        String segundoNombre = request.getParameter("segnombre").trim();
        String apPaterno = request.getParameter("paterno").trim();
        String apMaterno = request.getParameter("materno").trim();
        String telefono = request.getParameter("telefono").trim();
        String correo = request.getParameter("correo").trim();
        String direccion = request.getParameter("direccion").trim();
        String contra = request.getParameter("contra").trim();
        String matricula = request.getParameter("matricula").trim();
        String carrera = request.getParameter("carrera").trim();
        String rol = request.getParameter("rol").trim();
        String semestreParam = request.getParameter("semestre").trim();
        int semestre = 0;
        if (!semestreParam.isEmpty()) {
            semestre = Integer.parseInt(semestreParam);
        }
        String tutorParam = request.getParameter("tutoralu").trim();
        int tutor = 0;
        if (!tutorParam.isEmpty()) {
            tutor = Integer.parseInt(tutorParam);
        }
        String fechaNacString = request.getParameter("nacimiento").trim();
        Date fechaNacimiento = null;
        if (!fechaNacString.isEmpty()) {
            fechaNacimiento = Date.valueOf(fechaNacString);
        }

        boolean camposVaciosTutor = nombre.isEmpty() || apPaterno.isEmpty() || apMaterno.isEmpty() || telefono.isEmpty() || correo.isEmpty() || direccion.isEmpty() || contra.isEmpty() || fechaNacString.isEmpty();
        boolean camposVaciosAlumno = nombre.isEmpty() || apPaterno.isEmpty() || apMaterno.isEmpty() || telefono.isEmpty() || correo.isEmpty() || direccion.isEmpty() || contra.isEmpty() || matricula.isEmpty() || carrera.isEmpty() || semestreParam.isEmpty() || tutorParam.isEmpty() || fechaNacString.isEmpty();
        boolean correoValido = Pattern.matches("^[A-Za-z0-9+_.-]+@(.+)$", correo);
        boolean telefonoValido = telefono.matches("\\d{10}");

        StringBuilder error = new StringBuilder();

        if (!telefonoValido) {
            error.append("Teléfono no válido (debe contener solo números y tener 10 dígitos).\n");
        }
        if (!correoValido) {
            error.append("Correo no válido.\n");
        }

        switch (rol) {
            case "alumno":
                AlumnosDAO alumnoDAO = new AlumnosDAO();
                TutoresDAO tutoresDAO = new TutoresDAO();
                List<Alumnos> alumnosList = alumnoDAO.selectAlumnosVarios();
                List<Tutores> tutoresList = tutoresDAO.selectTutoresVarios();

                boolean alumnoDuplicado = false;
                boolean correoDuplicadoAlumno = false;
                boolean correoDuplicadoAlumnotu = false;

                for (Alumnos alumno : alumnosList) {
                    if (alumno.getMatricula().equals(matricula)) {
                        alumnoDuplicado = true;
                        break;
                    }
                    if (alumno.getCorreo().equalsIgnoreCase(correo)) {
                        correoDuplicadoAlumno = true;
                        break;
                    }
                }

                for (Tutores tutorx : tutoresList) {
                    if (tutorx.getCorreo().equalsIgnoreCase(correo)) {
                        correoDuplicadoAlumnotu = true;
                        break;
                    }
                }

                if (camposVaciosAlumno) {
                    error.append("Todos los campos son obligatorios para ALUMNO.\n");
                }
                if (alumnoDuplicado) {
                    error.append("La matrícula ya está registrada.\n");
                }
                if (correoDuplicadoAlumno || correoDuplicadoAlumnotu) {
                    error.append("El correo ya está registrado.\n");
                }

                if (error.length() > 0) {
                    request.getSession().setAttribute("registroError", error.toString());
                    request.getSession().setAttribute("datosFormulario", request.getParameterMap());
                    response.sendRedirect("Registro.jsp");
                } else {
                    Alumnos alumnoModelo = new Alumnos(matricula, nombre, segundoNombre, apPaterno, apMaterno, fechaNacimiento, telefono, correo, direccion, contra, carrera, semestre, tutor, 1);
                    alumnoDAO.insertAlumnos(alumnoModelo);
                    response.sendRedirect("index.jsp");
                }
                break;

            case "tutor":
                AlumnosDAO alumnosDAO = new AlumnosDAO();
                tutoresDAO = new TutoresDAO();
                alumnosList = alumnosDAO.selectAlumnosVarios();
                tutoresList = tutoresDAO.selectTutoresVarios();

                boolean correoDuplicado = false;
                boolean correoDuplicadotu = false;

                for (Tutores tutorxx : tutoresList) {
                    if (tutorxx.getCorreo().equalsIgnoreCase(correo)) {
                        correoDuplicado = true;
                        break;
                    }
                }

                for (Alumnos alumno : alumnosList) {
                    if (alumno.getCorreo().equalsIgnoreCase(correo)) {
                        correoDuplicadotu = true;
                        break;
                    }
                }

                if (camposVaciosTutor) {
                    error.append("Todos los campos son obligatorios para TUTOR.\n");
                }
                if (correoDuplicado || correoDuplicadotu) {
                    error.append("El correo ya está registrado.\n");
                }

                if (error.length() > 0) {
                    request.getSession().setAttribute("registroError", error.toString());
                    request.getSession().setAttribute("datosFormulario", request.getParameterMap());
                    response.sendRedirect("Registro.jsp");
                } else {
                    Tutores tutorModelo = new Tutores(nombre, segundoNombre, apPaterno, apMaterno, fechaNacimiento, telefono, correo, direccion, contra, 1);
                    tutoresDAO.insertTutor(tutorModelo);
                    response.sendRedirect("index.jsp");
                }
                break;

            default:
                response.getWriter().write("<script>alert('Rol no válido');</script>");
                break;
        }
    }
}
