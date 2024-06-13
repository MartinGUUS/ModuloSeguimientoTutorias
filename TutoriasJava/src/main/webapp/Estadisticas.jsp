<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.EstadisticaDAO" %>
<%@page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas</title>
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
            height: auto;
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
        .stat-list {
            margin: 15px;
        }
        .stat-list h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .stat-list ul {
            list-style: none;
            padding: 0;
        }
        .stat-list li {
            background: #f4f4f4;
            margin-bottom: 5px;
            padding: 10px;
            border-radius: 5px;
        }
    </style>


    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        if ((session.getAttribute("nameTutor") == null && session.getAttribute("idTutores") == null)) {
            response.sendRedirect("index.jsp");
        }
    %>

</head>
<body>
<div class="navbar">
    <div class="logo">Universidad Veracruzana Tutorías</div>

    <div class="menu">
        <a href="menuTutor.jsp">Inicio</a>
    </div>
</div>

<%
    EstadisticaDAO estadisticaDAO = new EstadisticaDAO();
    int totalAlumnos = estadisticaDAO.getTotalAlumnos();
    int totalTutores = estadisticaDAO.getTotalTutores();
    int totalTutoriasProgramadas = estadisticaDAO.getTotalTutoriasProgramadas();
    List<String> alumnosPorCarrera = estadisticaDAO.getAlumnosPorCarrera();
    double promedioCalificaciones = estadisticaDAO.getPromedioCalificaciones();
    DecimalFormat df = new DecimalFormat("#.##");
    String promedioCalificacionesForma = df.format(promedioCalificaciones);
    List<String> alumnosPorSemestre = estadisticaDAO.getAlumnosPorSemestre();
%>

<div class="container">
    <h1>Estadísticas de la Aplicación Web</h1>
    <div class="stat-box">
        <h2>Tutorías Programadas</h2>
        <p><%= totalTutoriasProgramadas %></p>
    </div>

    <div class="stat-box">
        <h2>Número de tutores</h2>
        <p><%= totalTutores %></p>
    </div>
    <div class="stat-box">
        <h2>Número de tutorados</h2>
        <p><%= totalAlumnos %></p>
    </div>
    <div class="stat-box">
        <h2>Promedio de Calificaciones</h2>
        <p><%= promedioCalificacionesForma %></p>
    </div>

    <div class="stat-list">
        <h2>Alumnos por Carrera</h2>
        <ul>
            <% for (String carrera : alumnosPorCarrera) { %>
            <li><%= carrera %></li>
            <% } %>
        </ul>
    </div>



    <div class="stat-list">
        <h2>Alumnos por Semestre</h2>
        <ul>
            <% for (String semestre : alumnosPorSemestre) { %>
            <li><%= semestre %></li>
            <% } %>
        </ul>
    </div>
</div>
</body>
</html>
