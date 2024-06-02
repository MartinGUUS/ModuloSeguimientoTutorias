<%-- 
                            CREO QUE TAMBIEN PA TODO
    5. Analisis y estadisticas sobre el uso de la plataforma (Tutorias programadas, asistencia, participación)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mensajes</title>
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
                margin-bottom: 10px;
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
            .container {
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                width: 1000px;
                margin: auto;
                height: 400px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .stat-box {
                width: 200px;
                height: 250px;
                float: left;
                margin: 15px;
                padding: 10px;
                background-color: tomato;
                text-align: center;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                border-radius: 10px;
            }
            .stat-box h2 {
                color: #333;
            }
            .stat-box p {
                font-size: 30px;
                color: #333;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Redactar mensajes</div>
            <div class="menu">
                <%
                    String nombreAl = (String) request.getSession().getAttribute("nombreAlumno");
                %>
                <a href=""><%= nombreAl%>
                </a>
                <a href="menuTutor.jsp">Inicio</a>
            </div>
        </div>

        <div class="container">
            <h1>Estadísticas de la Aplicación Web</h1>
            <div class="stat-box">
                <h2>Tutorías Programadas</h2>
                <p>120</p>
            </div>
            <div class="stat-box">
                <h2>Porcentaje de asistencia</h2>
                <p>85%</p>
            </div>
            <div class="stat-box">
                <h2>Número de tutores</h2>
                <p>15</p>
            </div>
            <div class="stat-box">
                <h2>Numero de tutorados</h2>
                <p>350</p>
            </div>
        </div>
    </body>
</html>