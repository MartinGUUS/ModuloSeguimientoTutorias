<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Nota</title>
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
        .navbar .icon {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .tuto-cont {
            background: white;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 700px;
            height: 500px;
            margin: auto;
            box-sizing: border-box;
        }
        .tuto-cont h1 {
            margin-bottom: 15px;
            font-size: 24px;
            text-align: left;
            color: #333;
        }
        .tuto-cont label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            text-align: left;
            color: #666;
        }
        .tuto-cont input[type="text"], .tuto-cont textarea {
            width: 100%;
            padding: 7px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .tuto-cont textarea {
            height: 150px; /* Ajusta la altura según tus necesidades */
        }
        .tuto-cont button {
            background: #2575fc;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .tuto-cont button:hover {
            background-color: #6a11cb;
        }
        .tuto-cont .btn-cancelar {
            background: #ff4b5c;
        }
        .tuto-cont .btn-cancelar:hover {
            background: #ff1e3c;
        }
    </style>
    <script>
        function irAtras() {
            window.location.href = 'Notas.jsp';
        }
        function limpiarCampos() {
            document.getElementById('nota').value = '';
        }
        function regresarYLimpiar() {
            limpiarCampos();
            irAtras();
        }
    </script>

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
    <div class="logo">
        Sistema de Notas
    </div>
    <div class="menu">
        <a href="menuTutor.jsp">Inicio</a>
    </div>
</div>
<div class="tuto-cont">
    <h1>Registrar Nota</h1>
    <%
        String matricula = request.getParameter("matricula");
    %>
    <form action="RegistrarNotaServlet" method="POST">
        <input type="hidden" id="matricula" name="matricula" value="<%= matricula %>">
        <label for="nota">Nota</label>
        <textarea id="nota" name="nota" required></textarea>
        <button type="submit">Registrar</button>
        <button type="button" class="btn-cancelar" onclick="regresarYLimpiar()">Cancelar</button>
    </form>
</div>
</body>
</html>
