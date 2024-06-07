<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Datos.TutoresDAO" %>
<%@ page import="Modelo.Tutores" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Información del Tutor</title>
    <link rel="stylesheet" href="menuTutor.css">
    <style>
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px); /* Ajusta la altura restando la altura del navbar */
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #333;
            font-family: 'Arial', sans-serif;
        }
        .info-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            text-align: left;
        }
        .info-container h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .info-container p {
            margin: 10px 0;
            font-size: 18px;
            color: #555;
        }
        .info-container p strong {
            color: #333;
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
    </style>
</head>
<body>
<%
    Integer idTutorLogin = (Integer) session.getAttribute("idTutorLogin");
    Tutores tutor = null;
    if (idTutorLogin != null) {
        TutoresDAO tutoresDAO = new TutoresDAO();
        tutor = tutoresDAO.selectTutorById(idTutorLogin);
    }
%>
<div class="navbar">
    <div class="logo">Universidad Veracruzana Tutorías</div>
    <div class="menu">
        <a href="menuTutor.jsp">Inicio</a>
    </div>
</div>

<div class="content">
    <div class="info-container">
        <h1>Información del Tutor</h1>
        <% if (tutor != null) { %>
        <p><strong>Nombre:</strong> <%= tutor.getNombre() %></p>
        <p><strong>Segundo Nombre:</strong> <%= tutor.getSegundoNombre() %></p>
        <p><strong>Apellido Paterno:</strong> <%= tutor.getApPaterno() %></p>
        <p><strong>Apellido Materno:</strong> <%= tutor.getApMaterno() %></p>
        <p><strong>Fecha de Nacimiento:</strong> <%= tutor.getFechaNac() %></p>
        <p><strong>Número:</strong> <%= tutor.getNumero() %></p>
        <p><strong>Email:</strong> <%= tutor.getCorreo() %></p>
        <p><strong>Dirección:</strong> <%= tutor.getDireccion() %></p>
        <% } else { %>
        <p>No se encontró información del tutor.</p>
        <% } %>
    </div>
</div>
</body>
</html>