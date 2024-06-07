<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Alumnos" %>
<%@ page import="Datos.AlumnosDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de alumnos y sus notas</title>
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

        .alert {
            padding: 15px;
            background-color: #f44336;
            color: white;
            margin-bottom: 15px;
        }

        .success {
            background-color: #4CAF50;
        }
    </style>
    <script>
        function mostrarDetalles(matricula) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "AlumnoNotasServlet?matricula=" + matricula, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var notas = JSON.parse(xhr.responseText);
                        var notaList = document.getElementById("nota-list");
                        notaList.innerHTML = ""; // Limpiar lista
                        if (notas.length > 0) {
                            notas.forEach(function (nota) {
                                var listItem = document.createElement("li");
                                listItem.textContent = nota.notas;
                                notaList.appendChild(listItem);
                            });
                        } else {
                            var listItem = document.createElement("li");
                            listItem.textContent = "No hay notas disponibles.";
                            notaList.appendChild(listItem);
                        }
                        var nuevaNotaBtn = document.getElementById("nuevaNotaBtn");
                        nuevaNotaBtn.href = "registrarNota.jsp?matricula=" + matricula;
                        document.getElementById("detailsImage").style.display = "none";
                        document.getElementById("detailsText").style.display = "block";
                    } else {
                        console.error("Error fetching notes: " + xhr.statusText);
                    }
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

        document.addEventListener("DOMContentLoaded", function () {
            showSection('datos-notas');
        });
    </script>

</head>
<body>
<div class="navbar">
    <div class="logo">Notas UV</div>
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
                <li><a href="javascript:void(0);" onclick="mostrarDetalles('<%= alumno.getMatricula() %>')">
                    <%= alumno.getNombre() %> <%= alumno.getSegundoNombre() %> <%= alumno.getApPaterno() %> <%= alumno.getApMaterno() %>
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
                    <h1>Notas</h1>
                </div>
                <div id="datos-notas" class="section">
                    <a id="nuevaNotaBtn" href="#">Agregar nueva nota</a>
                    <ul id="nota-list"></ul>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
