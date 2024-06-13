package Controlador;

import Datos.AlumnosDAO;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import Modelo.Alumnos;
import Modelo.Materias;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/GeneratePDFServlet")
public class GeneratePDFServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matricula = request.getParameter("matricula");

        // Recuperar los datos del alumno de la base de datos usando la matrícula
        AlumnosDAO alumnosDAO = new AlumnosDAO();
        Alumnos alumno = alumnosDAO.selectAlumnoById(matricula);
        List<Materias> materias = alumnosDAO.getMateriasPorAlumno(matricula);

        // Agrupar las materias por área
        Map<String, List<Materias>> materiasPorArea = materias.stream().collect(Collectors.groupingBy(Materias::getArea));

        // Obtener el total de créditos posibles por área
        Map<String, Integer> creditosTotalesPorArea = alumnosDAO.getCreditosTotalesPorArea();

        // Definir el orden deseado de las áreas
        List<String> order = Arrays.asList("Area formación basica", "Area formación disciplinaria", "Area formación terminal", "Area formación libre");

        // Configuración de la respuesta HTTP
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"Reporte_Estudiantes_" + matricula + ".pdf\"");

        // Generación del PDF
        try (OutputStream out = response.getOutputStream()) {
            Document document = new Document();
            PdfWriter.getInstance(document, out);

            document.open();

            // Crear una fuente personalizada
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLUE);

            // Añadiendo contenido al PDF
            Paragraph title = new Paragraph("REPORTE DE ESTUDIANTE", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            document.add(new Paragraph(" ")); // Añadir un espacio en blanco

            document.add(new Paragraph("Nombre: " + alumno.getNombre() + " " + alumno.getSegundoNombre() + " " + alumno.getApPaterno() + " " + alumno.getApMaterno()));
            document.add(new Paragraph("Matricula: " + alumno.getMatricula()));
            document.add(new Paragraph("Correo: " + alumno.getCorreo()));
            document.add(new Paragraph("Numero: " + alumno.getNumero()));
            document.add(new Paragraph("Direccion: " + alumno.getDireccion()));
            document.add(new Paragraph("Fecha de Nacimiento: " + alumno.getFechaNac()));
            document.add(new Paragraph("Carrera: " + alumno.getCarrera()));
            document.add(new Paragraph("Semestre: " + alumno.getSemestre()));
            document.add(new Paragraph("Tutor: " + alumno.getFkTutor()));

            document.add(new Paragraph(" ")); // Añadir un espacio en blanco

            // Calcular el promedio total de las calificaciones
            int totalCalificaciones = 0;
            int totalMaterias = 0;
            Map<String, Integer> totalCreditosPorArea = new HashMap<>();

            // Añadir las materias por área en el orden deseado
            for (String area : order) {
                if (materiasPorArea.containsKey(area)) {
                    List<Materias> materiasDeArea = materiasPorArea.get(area);

                    Paragraph areaTitle = new Paragraph(area, new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLACK));
                    document.add(areaTitle);

                    PdfPTable table = new PdfPTable(4);
                    table.setWidthPercentage(100);
                    table.setSpacingBefore(10f);
                    table.setSpacingAfter(10f);

                    PdfPCell cell1 = new PdfPCell(new Paragraph("Materia", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK)));
                    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell1.setBackgroundColor(BaseColor.GREEN);
                    table.addCell(cell1);

                    PdfPCell cell2 = new PdfPCell(new Paragraph("Créditos", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK)));
                    cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell2.setBackgroundColor(BaseColor.GREEN);
                    table.addCell(cell2);

                    PdfPCell cell3 = new PdfPCell(new Paragraph("Inscripción", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK)));
                    cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell3.setBackgroundColor(BaseColor.GREEN);
                    table.addCell(cell3);

                    PdfPCell cell4 = new PdfPCell(new Paragraph("Calificación", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK)));
                    cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell4.setBackgroundColor(BaseColor.GREEN);
                    table.addCell(cell4);

                    int totalCreditos = 0;

                    for (Materias materia : materiasDeArea) {
                        table.addCell(materia.getNombre());
                        table.addCell(String.valueOf(materia.getCreditos()));
                        table.addCell(String.valueOf(materia.getInscripcion()));
                        table.addCell(String.valueOf(materia.getCalificacion()));

                        totalCalificaciones += materia.getCalificacion();
                        totalMaterias++;
                        totalCreditos += materia.getCreditos();
                    }

                    // Guardar el total de créditos por área
                    totalCreditosPorArea.put(area, totalCreditos);

                    // Añadir la tabla al documento
                    document.add(table);
                }
            }

            // Calcular el promedio total
            float promedioTotal = (float) totalCalificaciones / totalMaterias;

            // Añadir el promedio total al final del documento
            Paragraph promedioParagraph = new Paragraph("Promedio Total: " + String.format("%.2f", promedioTotal), new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD, BaseColor.BLACK));
            promedioParagraph.setAlignment(Element.ALIGN_RIGHT);
            document.add(promedioParagraph);

            document.add(new Paragraph(" ")); // Añadir un espacio en blanco

            // Añadir la tabla de créditos totales por área al final del documento
            PdfPTable totalCreditosTable = new PdfPTable(3);
            totalCreditosTable.setWidthPercentage(50);
            totalCreditosTable.setHorizontalAlignment(Element.ALIGN_CENTER);
            totalCreditosTable.setSpacingBefore(10f);
            totalCreditosTable.setSpacingAfter(10f);

            PdfPCell headerArea = new PdfPCell(new Paragraph("Área", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK)));
            headerArea.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerArea.setBackgroundColor(BaseColor.GREEN);
            totalCreditosTable.addCell(headerArea);

            PdfPCell headerCreditosAlumno = new PdfPCell(new Paragraph("Créditos Alumno", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK)));
            headerCreditosAlumno.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCreditosAlumno.setBackgroundColor(BaseColor.GREEN);
            totalCreditosTable.addCell(headerCreditosAlumno);

            PdfPCell headerCreditosTotales = new PdfPCell(new Paragraph("Créditos Totales", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK)));
            headerCreditosTotales.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCreditosTotales.setBackgroundColor(BaseColor.GREEN);
            totalCreditosTable.addCell(headerCreditosTotales);

            for (String area : order) {
                if (totalCreditosPorArea.containsKey(area)) {
                    totalCreditosTable.addCell(area);
                    totalCreditosTable.addCell(String.valueOf(totalCreditosPorArea.get(area)));
                    totalCreditosTable.addCell(String.valueOf(creditosTotalesPorArea.get(area)));
                }
            }

            document.add(totalCreditosTable);

            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}
