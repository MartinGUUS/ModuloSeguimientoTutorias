<%-- 
                    CREO QUE SOLO TUTORES (A MENOS QUE LOS ALUMNOS HAGAN COMENTARIOS SOBRE LA TUTORIAS)
    2. Notas, comentarios y observaciones respecto al progreso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bandeja de Entrada</title>
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
                max-width: 900px;
                width: 100%;
                box-sizing: border-box;
                display: grid;
                grid-template-columns: 1fr 2fr;
                gap: 20px;
                height: 500px;
            }
            .button-container {
                grid-column: 1 / span 2;
                display: flex;
                justify-content: end;
            }
            .button-container button {
                background-color: #6a11cb;
                border: none;
                border-radius: 10px;
                color: white;
                font-size: 15px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .button-container button:hover {
                background-color: #2575fc;
            }
            .grid-container .lista {
                width: 100%;
                height: auto;
                overflow-y: scroll;
                background-color: #f4f4f4;
            }
            .contenido {
                flex: 1;
                padding: 0px 15px;
            }
            .nota {
                padding: 10px;
                margin-bottom: 10px;
                cursor: pointer;
                background-color: #fff;
                border: 1px solid #ddd;
            }
            .nota:hover {
                background-color: #f0f0f0;
            }
            .nota.active {
                background-color: #e0e0e0;
            }
            .content textarea {
                width: 100%;
                border-radius: 8px;
                overflow-y: auto;
                height: 280px;
                border: 1px solid #ddd;
            }
        </style>
        <script>
            function showNoteContent(nota, nombrenota) {
                var notas = document.getElementsByClassName("nota");
                for (var i = 0; i < notas.length; i++) {
                    notas[i].classList.remove("active");
                }
                event.currentTarget.classList.add("active");
                document.getElementById("txanota").value = nota;
                document.getElementById("nombrenota").innerText = nombrenota;
            }
        </script>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Bandeja de Entrada</div>
            <div class="menu">
                <%
                    String nombreAl = (String) request.getSession().getAttribute("nombreAlumno");
                %>
                <a href=""><%= nombreAl%>
                </a>
                <a href="menu.jsp">Inicio</a>
            </div>
        </div>

        <div class="content">
            <div class="grid-container">
                <div class="button-container">
                    <button onclick="window.location.href = 'nuevaNota.jsp'">Nueva nota</button>
                </div>
                <div class="lista">
                    <h2>Lista de Notas</h2>
                    <div class="nota" onclick="showNoteContent('Contenido de la nota 1', 'Nota 1')">Nota 1</div>
                    <div class="nota" onclick="showNoteContent('Contenido de la nota 2', 'Nota 2')">Nota 2</div>
                    <div class="nota" onclick="showNoteContent('Contenido de la nota 3', 'Nota 3')">Nota 3</div>
                </div>
                <div class="contenido">
                    <h2 id="nombrenota">Notas</h2>
                    <textarea id="txanota" readonly></textarea>
                </div>
            </div>
        </div>
    </body>
</html>