package Controlador;

import Datos.AlumnosDAO;
import Modelo.Alumnos;
import Modelo.Historial;
import Modelo.Materias;
import Modelo.Materias_alumnos;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Color;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/HistorialServlet")
public class HistorialServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.exportar(request, response);
    }

    public void writeHeader(PdfPTable pdfTable) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.darkGray);
        cell.setPadding(4);
        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        font.setColor(Color.white);

        cell.setPhrase(new Phrase("Materia", font));
        pdfTable.addCell(cell);

        cell.setPhrase(new Phrase("Creditos", font));
        pdfTable.addCell(cell);

        cell.setPhrase(new Phrase("Calificación", font));
        pdfTable.addCell(cell);

        cell.setPhrase(new Phrase("Inscripción", font));
        pdfTable.addCell(cell);
    }

    public void writeTableData(HttpServletRequest request, PdfPTable pTable, int areaFormacion) {
        String matricula = "A12345678";

        List<Historial> historialAlumnos = AlumnosDAO.HistorialAlumnos(matricula, areaFormacion);

        for (Historial historial : historialAlumnos) {
            Materias materia = historial.getMateria();
            Materias_alumnos materiaAlumno = historial.getMateriaAlumno();

            pTable.addCell(materia.getNombre());
            pTable.addCell(String.valueOf(materia.getCreditos()));
            pTable.addCell(String.valueOf(materiaAlumno.getCalificacion()));
            pTable.addCell(String.valueOf(materiaAlumno.getInscripcion()));
        }
    }

    public void writeStudentInfo(Document document, Alumnos alumno) throws Exception {
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setSize(12);
        font.setColor(Color.BLACK);

        document.add(new Paragraph("Matrícula: " + alumno.getMatricula(), font));
        document.add(new Paragraph("Nombre: " + alumno.getNombre() + " " + alumno.getSegundoNombre() + " " + alumno.getApPaterno() + " " + alumno.getApMaterno(), font));
        document.add(new Paragraph("Fecha de Nacimiento: " + alumno.getFechaNac(), font));
        document.add(new Paragraph("Número: " + alumno.getNumero(), font));
        document.add(new Paragraph("Correo: " + alumno.getCorreo(), font));
        document.add(new Paragraph("Dirección: " + alumno.getDireccion(), font));
        document.add(new Paragraph("Carrera: " + alumno.getCarrera(), font));
        document.add(new Paragraph("Semestre: " + alumno.getSemestre(), font));
        document.add(new Paragraph(" "));
    }

    public void exportar(HttpServletRequest request, HttpServletResponse response) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
            String nomFile = dateFormat.format(new Date());
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=HistorialAcademico_"+nomFile+".pdf");

            Document document = new Document(PageSize.A4);
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();

            Font font = FontFactory.getFont(FontFactory.HELVETICA);
            font.setSize(12);
            font.setColor(Color.BLUE);

            Paragraph para = new Paragraph("Historial Académico", font);
            para.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(para);

            // Obtener información del alumno
            String matricula = "A12345678";
            Alumnos alumno = AlumnosDAO.selectAlumnoPorMatricula(matricula);  // Asegúrate de tener este método en AlumnosDAO

            // Escribir información del alumno en el documento
            writeStudentInfo(document, alumno);

            for (int areaFormacion = 1; areaFormacion <= 4; areaFormacion++) {
                String tituloArea = "";

                switch (areaFormacion) {
                    case 1:
                        tituloArea = "AREA DE FORMACION BASICA";
                        break;
                    case 2:
                        tituloArea = "AREA DE FORMACION DISCIPLINARIA";
                        break;
                    case 3:
                        tituloArea = "AREA DE FORMACION TERMINAL";
                        break;
                    case 4:
                        tituloArea = "AREA DE FORMACION ELECCION LIBRE";
                        break;
                }

                Paragraph areaPara = new Paragraph(tituloArea, font);
                areaPara.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(areaPara);

                PdfPTable pdfTable = new PdfPTable(4);
                pdfTable.setWidthPercentage(100f);
                pdfTable.setWidths(new float[]{3.0f, 3.0f, 3.0f, 3.0f});
                pdfTable.setSpacingBefore(10);

                writeHeader(pdfTable);
                writeTableData(request, pdfTable, areaFormacion);

                document.add(pdfTable);
                document.add(new Paragraph(" "));  // Adding space between tables
            }

            document.close();

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
    }
}
