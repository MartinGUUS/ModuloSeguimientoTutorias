<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Tutores</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="menuTutor.css"> <!-- Vincula el archivo CSS externo -->

    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

        if ((session.getAttribute("nameTutor") == null && session.getAttribute("idTutores") == null)) {
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
                String tutorName = (String) request.getSession().getAttribute("nameTutor");
            %>
            <a href="index.jsp"><%=tutorName%>
            </a>

            <a href="Mensajes.jsp" class="icon">
                <i class="fas fa-envelope"></i> Mensajerí­a
            </a>
            <button type="submit" name="action" value="cerrarSesion">Cerrar sesión</button>
        </div>
    </div>
</form>

<div class="content">
    <div class="grid-container">
        <a href="Alumnos.jsp" class="grid-item">Alumnos</a>
        <a href="Notas.jsp" class="grid-item">Notas</a>
        <a href="Tutorias.jsp" class="grid-item">Tutorias</a>
        <a href="Estadisticas.jsp" class="grid-item">Estadisticas</a>
    </div>
</div>
</body>
</html>
