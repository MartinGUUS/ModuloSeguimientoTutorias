package Controlador;

import Datos.AlumnosDAO;
import Datos.LoginDAO;
import Datos.TutoresDAO;
import Modelo.Alumnos;
import Modelo.Tutores;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;

public class svLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mail = request.getParameter("mail").trim();
        String contra = request.getParameter("contra").trim();
        String accion = request.getParameter("action");


        switch (accion) {
            case "login":
                System.out.println("\n\n\n");
                boolean al = false, tu = false;
                String nombrealumnos = null, nombretutores = null, matricula = null, apTutor = null, apAlumno = null;
                int idTutores = 0;
                AlumnosDAO alumnosDAO = new AlumnosDAO();
                TutoresDAO tutoresDAO = new TutoresDAO();
                List<Alumnos> alumnos = alumnosDAO.selectAlumnosVarios();
                List<Tutores> tutores = tutoresDAO.selectTutoresVarios();
                for (int i = 0; i < alumnos.size(); i++) {
                    if (alumnos.get(i).getContra().equals(contra) && alumnos.get(i).getCorreo().equals(mail)) {
                        al = true;
                        nombrealumnos = alumnos.get(i).getNombre();
                        apAlumno = alumnos.get(i).getApPaterno();
                        matricula = alumnos.get(i).getMatricula();
                        break;
                    }
                }
                for (int i = 0; i < tutores.size(); i++) {
                    if (tutores.get(i).getContra().equals(contra) && tutores.get(i).getCorreo().equals(mail)) {
                        tu = true;
                        nombretutores = tutores.get(i).getNombre();
                        apTutor = tutores.get(i).getApPaterno();
                        idTutores = tutores.get(i).getIdTutores();
                        break;
                    }
                }



                if (!tu && !al) {
                    request.setAttribute("errorMessage", "Credenciales incorrectas. Por favor, inténtalo de nuevo.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else if (tu && !al) {
                    request.getSession().setAttribute("nameTutor", nombretutores);
                    request.getSession().setAttribute("apTutor", apTutor);
                    request.getSession().setAttribute("idTutorLogin", idTutores);
                    response.sendRedirect("menuTutor.jsp");
                } else if (!tu && al) {
                    request.getSession().setAttribute("nombreAlumno", nombrealumnos);
                    request.getSession().setAttribute("apAlumno", apAlumno);
                    request.getSession().setAttribute("matriculaAlumno", matricula);
                    response.sendRedirect("menuAlumno.jsp");
                }


                break;
            case "register":
                response.sendRedirect("Registro.jsp");
                break;
            default:
                System.out.println("Acción no reconocida: " + accion);
                response.sendRedirect("error.html");
                break;
        }
    }
}
