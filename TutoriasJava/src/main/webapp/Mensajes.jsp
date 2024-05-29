<%-- 
                        PARA TODOS
    8. Mensajeria entre tutores y tutorados.
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
            .msj-container {
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                max-width: 700px;
                width: 100%;
                margin: auto;
                box-sizing: border-box;
            }
            .msj-container h1 {
                margin-bottom: 30px;
                font-size: 24px;
                text-align: left;
                color: #333;
            }
            .msj-container label {
                font-weight: bold;
                display: block;
                margin-bottom: 10px;
                text-align: left;
                color: #666;
            }
            .msj-container input[type="text"] {
                width: 100%;
                padding: 12px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .msj-container input[type="text"], textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .msj-container button {
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
            .msj-container button:hover {
                background-color: #2575fc;
            }

        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Lista y detalle de tutorados</div>
            <div class="menu">
                <a href="menuTutor.jsp">Inicio</a>
                <a href="index.jsp">Cerrar sesión</a>
            </div>
        </div>

        <div class="msj-container">
            <h1>MENSAJES</h1>
            <form action="">
                <label for="tutor">Para:</label>
                <input type="text" id="tutor" name="tutor" placeholder="tutor@uv.mx...">

                <label for="asunto">Asunto:</label>
                <input type="text" id="asunto" name="asunto" placeholder="Tutorias...">

                <label for="msj">Mensaje:</label>
                <textarea id="msj" name="msj" rows="10" placeholder="Escribe tu mensaje..."></textarea>

                <button type="submit">Enviar Mensaje</button>
            </form>
        </div>
    </body>
</html>