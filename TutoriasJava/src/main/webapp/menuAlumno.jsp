<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Alumnos</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="menuAlumno.css">

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
            <a href="informacionAlumno.jsp"><%= nombreAl + " " + apellido%>
            </a>

            <a href="Mensajes.jsp" class="icon">
                <i class="fas fa-envelope"></i> Mensajería
            </a>
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
