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

        .navbar .menu .icon {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .navbardetalle {
            overflow: hidden;
            background-color: #333;
            margin-bottom: 5px;
        }

        .navbardetalle a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbardetalle a:hover {
            background-color: #ddd;
            color: black;
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

        .grid-container .lista-alumnos, .detalle-alumnos {
            flex: 1;
            padding: 10px;
        }

        .lista-alumnos {
            border-right: 1px solid #ccc;
        }

        .lista-alumnos ul {
            list-style: none;
            padding: 0;
        }

        .lista-alumnos li {
            margin-bottom: 10px;
        }

        .lista-alumnos a {
            color: #2575fc;
            text-decoration: none;
            font-weight: bold;
        }

        .lista-alumnos a:hover {
            text-decoration: underline;
        }

        .grid-item {
            background-color: #f1f1f1;
            padding: 20px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: transform 0.3s, background-color 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: #333;
            font-size: 16px;
        }

        .grid-item:hover {
            transform: scale(1.05);
            background-color: #e0e0e0;
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

        table {
            width: 100%;
            margin-top: 10px;
        }

        .asuntotuto {
            font-size: 20px;
            flex-direction: column;
        }

        .fechatuto {
            font-size: 15px;
            color: #555;
            text-align: right;
        }

        .RegistraOtra {
            margin-top: 10px;
            grid-column: span 2;
            text-align: center;
        }

        .btn-historial {
            width: 70%;
            margin-top: 20px;
            padding: 12px;
            background-color: #6a11cb;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 10px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-historial:hover {
            background-color: #2575fc;
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
    </style>

    <%
        // Evita que la página se almacene en caché
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        // Redirige al usuario a la página de inicio de sesión si la sesión no está activa
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
            <ul>
                <%
                    Integer idTutorLogin = (Integer) session.getAttribute("idTutorLogin");
                    if (idTutorLogin != null) {
                        AlumnosDAO alumnosDAO = new AlumnosDAO();
                        List<Alumnos> alumnos = alumnosDAO.selectAlumnosVariosPorTutor(idTutorLogin);
                        for (Alumnos alumno : alumnos) {
                %>
                <li><a href="javascript:void(0);"
                       onclick="mostrarDetalles('<%= alumno.getMatricula() %>')"><%= alumno.getNombre() %> <%= alumno.getSegundoNombre() %> <%= alumno.getApPaterno() %> <%= alumno.getApMaterno() %>
                </a></li>
                <%
                        }
                    } else {
                        out.println("No se encontró el id del tutor en la sesión.");
                    }
                %>
            </ul>
        </div>
        <div class="details">
            <div id="detailsImage">
                <img src="Images/UvLogo.png" alt="Selecciona una persona" width="100%" height="100%">
            </div>
            <div id="detailsText" style="display: none;">
                <div class="navbardetalle">
                    <a href="#" onclick="showSection('datos-personales')">Datos personales</a>
                </div>
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

                function showSection(sectionId) {
                    var sections = document.getElementsByClassName("section");
                    for (var i = 0; i < sections.length; i++) {
                        sections[i].style.display = "none";
                    }
                    document.getElementById(sectionId).style.display = "block";
                }

                showSection('datos-personales');
            </script>
        </div>
    </div>
</div>
</body>
</html>
