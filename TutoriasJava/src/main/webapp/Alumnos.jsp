<%@ page import="java.util.List" %>
<%@ page import="Modelo.Alumnos" %>
<%@ page import="Datos.AlumnosDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de tutorados</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: white;
            color: #333;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 0 0 10px 10px;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar .menu {
            display: flex;
            gap: 20px;
        }

        .navbar .menu a {
            color: #333;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar .menu a:hover {
            background-color: #2575fc;
            color: white;
        }

        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .grid-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            width: 100%;
            box-sizing: border-box;
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 20px;
        }

        .lista-alumnos {
            border-right: 1px solid #ccc;
            max-height: 500px; /* Fixed height for scrolling */
            overflow-y: auto;
        }

        .lista-alumnos h2 {
            margin-top: 0;
        }

        .lista-alumnos input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .lista-alumnos table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .lista-alumnos th, .lista-alumnos td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        .lista-alumnos th {
            background-color: #f1f1f1;
            color: #333;
            font-weight: bold;
            position: sticky; /* Keep the header fixed during scroll */
            top: 0;
            z-index: 2;
        }

        .lista-alumnos tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .lista-alumnos tr:hover {
            background-color: #f1f1f1;
        }

        .details {
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .details h2 {
            margin-top: 0;
        }

        .btn-reporte {
            margin-top: 20px;
            padding: 12px;
            background-color: #ff9800;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
            text-align: center;
        }

        .btn-reporte:hover {
            background-color: #e68900;
        }

        .message-summary {
            display: flex;
            flex-direction: column;
        }

        .sender {
            font-size: 16px;
            font-weight: bold;
        }

        .message-details {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #555;
        }

        .subject {
            flex: 2;
        }

        .date {
            flex: 1;
            text-align: right;
        }
    </style>

    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        if ((session.getAttribute("nameTutor") == null && session.getAttribute("idTutores") == null)) {
            response.sendRedirect("index.jsp");
        }
    %>
</head>
<body>
<div class="navbar">
    <div class="logo">Tutorías UV</div>
    <div class="menu">
        <a href="menuTutor.jsp">Inicio</a>
    </div>
</div>
<div class="content">
    <div class="grid-container">
        <div class="lista-alumnos">
            <h2>Lista de Alumnos</h2>
            <input type="text" id="buscarAlumno" onkeyup="filtrarAlumnos()" placeholder="Buscar por nombre o matricula...">
            <table id="tablaAlumnos">
                <thead>
                <tr>
                    <th>Nombre</th>
                </tr>
                </thead>
                <tbody>
                <%
                    Integer idTutorLogin = (Integer) session.getAttribute("idTutorLogin");
                    if (idTutorLogin != null) {
                        AlumnosDAO alumnosDAO = new AlumnosDAO();
                        List<Alumnos> alumnos = alumnosDAO.selectAlumnosVariosPorTutor(idTutorLogin);
                        for (Alumnos alumno : alumnos) {
                %>
                <tr>
                    <td>
                        <a href="javascript:void(0);" onclick="mostrarDetalles('<%= alumno.getMatricula() %>')">
                            <div class="message-summary">
                                <span class="sender"><%= alumno.getNombre() %> <%= alumno.getSegundoNombre() %> <%= alumno.getApPaterno() %> <%= alumno.getApMaterno() %></span>
                                <div class="message-details">
                                    <span class="subject">Matricula: <%= alumno.getMatricula() %></span>
                                </div>
                            </div>
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                        out.println("No se encontró el id del tutor en la sesión.");
                    }
                %>
                </tbody>
            </table>
        </div>
        <div class="details">
            <div id="detailsImage">
                <img src="Images/UvLogo.png" alt="Selecciona una persona" width="100%" height="100%">
            </div>
            <div id="detailsText" style="display: none;">
                <h1>Datos personales</h1>

                <div id="datos-personales" class="section">
                    <p><strong>Nombre:</strong> <span id="Nombre"></span></p>
                    <p><strong>Matricula:</strong> <span id="Matricula"></span></p>
                    <p><strong>Correo:</strong> <span id="Correo"></span></p>
                    <p><strong>Numero:</strong> <span id="Telefono"></span></p>
                    <p><strong>Dirección:</strong> <span id="Direccion"></span></p>
                    <p><strong>Fecha de nacimiento:</strong> <span id="FechaNac"></span></p>
                    <p><strong>Carrera:</strong> <span id="Carrera"></span></p>
                    <p><strong>Semestre:</strong> <span id="Semestre"></span></p>
                    <p><strong>Tutor:</strong> <span id="Tutor"></span></p>
                    <form action="GeneratePDFServlet" method="get">
                        <input type="hidden" name="matricula" id="hiddenMatricula">
                        <button type="submit" class="btn-reporte">Descargar reporte de estudiante</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function mostrarDetalles(matricula) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "AlumnoDetallesServlet?matricula=" + matricula, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var alumno = JSON.parse(xhr.responseText);
                document.getElementById("Nombre").innerText = alumno.nombre + " " + alumno.segundoNombre + " " + alumno.apPaterno + " " + alumno.apMaterno;
                document.getElementById("Matricula").innerText = alumno.matricula;
                document.getElementById("hiddenMatricula").value = alumno.matricula;
                document.getElementById("Correo").innerText = alumno.correo;
                document.getElementById("Telefono").innerText = alumno.numero;
                document.getElementById("Direccion").innerText = alumno.direccion;
                document.getElementById("FechaNac").innerText = alumno.fechaNac;
                document.getElementById("Carrera").innerText = alumno.carrera;
                document.getElementById("Semestre").innerText = alumno.semestre;
                document.getElementById("Tutor").innerText = alumno.fkTutor;

                document.getElementById("detailsImage").style.display = "none";
                document.getElementById("detailsText").style.display = "block";
            }
        };
        xhr.send();
    }

    function filtrarAlumnos() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("buscarAlumno");
        filter = input.value.toLowerCase();
        table = document.getElementById("tablaAlumnos");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toLowerCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
</body>
</html>
