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

@WebServlet(name = "svLogin", urlPatterns = "/svLogin")
public class svLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mail = request.getParameter("mail");
        String contra = request.getParameter("contra");
        String accion = request.getParameter("action");
        System.out.println("accion = " + accion);
        System.out.println("mail = " + mail);
        System.out.println("contra = " + contra);


        switch (accion) {
            case "login":
                System.out.println("\n\n\n");
                boolean al = false, tu = false;
                String nombrealumnos = null, nombretutores = null, matricula = null;
                int idTutores = 0;
                AlumnosDAO alumnosDAO = new AlumnosDAO();
                TutoresDAO tutoresDAO = new TutoresDAO();
                List<Alumnos> alumnos = alumnosDAO.selectAlumnosVarios();
                List<Tutores> tutores = tutoresDAO.selectTutoresVarios();
                for (int i = 0; i < alumnos.size(); i++) {
                    if (alumnos.get(i).getContra().equals(contra) && alumnos.get(i).getCorreo().equals(mail)) {
                        al = true;
                        nombrealumnos = alumnos.get(i).getNombre();
                        matricula = alumnos.get(i).getMatricula();
                        System.out.println("Se encontro alumno?  " + al);
                    }
                }
                for (int i = 0; i < tutores.size(); i++) {
                    if (tutores.get(i).getContra().equals(contra) && tutores.get(i).getCorreo().equals(mail)) {
                        tu = true;
                        nombretutores = tutores.get(i).getNombre();
                        idTutores = tutores.get(i).getIdTutores();
                        System.out.println("Se encontro tutor?  " + al);

                    }
                }

                if (!tu && !al) {
                    System.out.println("no se encontro usuario");
                    response.sendRedirect("index.jsp");
                } else if (tu && !al) {
                    System.out.println("vamos para tutores menu");
                    request.getSession().setAttribute("nameTutor", nombretutores);
                    response.sendRedirect("menuTutor.jsp");
                } else if (!tu && al) {
                    System.out.println("vamos para Alumnos menu");
                    request.getSession().setAttribute("nombreAlumno", nombrealumnos);
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
