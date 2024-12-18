<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Información del alumno</title>
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
                background-color: #333;
                width: 260px;
                height: 385px;
            }
            .navbardetalle a {
                display: block;
                font-size: 25px;
                font-weight: bold;
                color: #f2f2f2;
                text-align: center;
                padding: 30px 16px;
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
            }
            .details {
                background-color: #f9f9f9;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                height: 345px;
                overflow-y: scroll;
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
            .btn-historial2 {
                width: 81px;
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
            .btn-historial2:hover {
                background-color: #2575fc;
            }
        </style>
        <script>
            function showSection(sectionId, nombre, matricula, correo, telefono, direccion, fechaNac, carrera, semestre, tutor) {
                var sections = document.getElementsByClassName('section');
                for (var i = 0; i < sections.length; i++) {
                    sections[i].style.display = 'none';
                }
                document.getElementById(sectionId).style.display = 'block';
                document.getElementById('detailsImage').style.display = 'none';
                document.getElementById('detailsText').style.display = 'block';
                document.getElementById('Nombre').textContent = nombre;
                document.getElementById('Correo').textContent = correo;
                document.getElementById('Telefono').textContent = telefono;
                document.getElementById('Matricula').textContent = matricula;
                document.getElementById('FechaNac').textContent = fechaNac;
                document.getElementById('Direccion').textContent = direccion;
                document.getElementById('Carrera').textContent = carrera;
                document.getElementById('Semestre').textContent = semestre;
                document.getElementById('Tutor').textContent = tutor;
            }
        </script>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Información del alumno</div>
            <div class="menu">
                <a href="menuAlumno.jsp">Inicio</a>
                <a href="Mensajes.jsp" class="icon">
                    <i class="fas fa-envelope"></i> Mensajería
                </a>
                <a href="index.jsp">Cerrar sesión</a>
            </div>
        </div>

        <div class="content">
            <div class="grid-container">
                <div class="navbardetalle">
                    <a href="#" onclick="showSection('datos-personales', 'Alberto Caballero Perez', 'S20004605', 'caballero@gmail.com', '229-1234', 'Coyol', '2001-11-03', 'Ingeniería Informática', '8vo', 'Diana')">Datos personales</a>
                    <a href="#" onclick="showSection('historial')">Historial Académico</a>
                    <a href="#" onclick="showSection('reporte')">Reporte de Avance</a>
                </div>
                <div class="details">
                    <div id="detailsImage">
                        <img src="Images/UvLogo.png" alt="Imagen de espera" width="100%" height="320px">
                    </div>
                    <div id="detailsText" style="display: none;">
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
                        </div>
                        <div id="historial" class="section">
                            <form action="HistorialServlet">
                                <button type="submit" value="ExportarPDF" class="btn-historial">Descargar reporte PDF</button>
                            </form>
                        </div>
                        <div id="reporte" class="section">
                            <a href="Reporte.jsp" class="btn-historial2">Ver Avance</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
