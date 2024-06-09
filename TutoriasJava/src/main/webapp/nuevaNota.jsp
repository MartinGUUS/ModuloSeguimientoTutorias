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
                margin-bottom: 50px;
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
                max-width: 700px;
                width: 100%;
                margin: auto;
                box-sizing: border-box;
            }
            .container label {
                font-weight: bold;
                display: block;
                margin-bottom: 10px;
                text-align: left;
                color: #666;
            }
            .container input[type="text"] {
                width: 100%;
                padding: 12px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .container textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .container button {
                width: 100%;
                padding: 12px;
                background-color: #6a11cb;
                border: none;
                border-radius: 5px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin-bottom: 10px;
            }
            .container button:hover {
                background-color: #2575fc;
            }
        </style>

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
            <form action="">
                <label id="titulo">Titulo:</label>
                <input type="text" name="titulo" placeholder="Observación...">

                <textarea name="nota" rows="10"></textarea>

                <button type="submit">Guardar nota</button>
            </form>
        </div>
    </body>
</html>