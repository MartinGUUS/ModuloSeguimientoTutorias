<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Alumnos</title>
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

        .navbar .menu a,
        .navbar .menu button {
            color: #333;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            font-family: inherit;
            margin: 0;
        }

        .navbar .menu a:hover,
        .navbar .menu button:hover {
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
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
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

        .link-button {
            background: none;
            border: none;
            color: #007bff;
            text-decoration: underline;
            cursor: pointer;
            font-size: 1rem;
            font-family: inherit;
            margin: 0;
            padding: 0;
        }

        .link-button:hover {
            color: #0056b3;
            text-decoration: underline;
        }

    </style>

    <%
        // Evita que la página se almacene en caché
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        // Redirige al usuario a la página de inicio de sesión si la sesión no está activa
        if (session.getAttribute("nombreAlumno") == null && session.getAttribute("matriculaAlumno") == null) {
            response.sendRedirect("index.jsp");
        }
    %>

</head>
<body>
<form action="svCloseSession" method="POST">
    <div class="navbar">
        <div class="logo">Universidad Veracruzana Tutorías</div>
        <div class="menu">
            <%
                String nombreAl = (String) request.getSession().getAttribute("nombreAlumno");
                String apellido = (String) request.getSession().getAttribute("apAlumno");
                String matricula = (String) request.getSession().getAttribute("matriculaAlumno");
            %>
            <a href="informacionAlumno.jsp"><%= nombreAl + " " + apellido%></a>
            <a href="Mensajes.jsp">Mensajería</a>
            <button type="submit" name="action" value="cerrarSesion">Cerrar sesión</button>
        </div>
    </div>
</form>
<div class="content">
    <div class="grid-container">
        <!-- Añadir la matrícula como parámetro en la URL -->
        <a href="GeneratePDFServlet?matricula=<%= matricula %>" class="grid-item">Reporte avance academico</a>
    </div>
</div>
</body>
</html>
