<%-- 
                            ESTO CREO QUE SI ES PA TODOS
    3. Historial de tutorias realizadas (Fecha, duracion y temas tratados)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Registro de tutoria</title>
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
            .tuto-cont input[type="text"] {
                width: 400px;
                padding: 7px;
                margin-bottom: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .tuto-cont input[type="number"] {
                width: 45px;
                height: 20px;
                margin-bottom: 5px;
            }
            .tuto-cont input[type="date"] {
                width: 100px;
                height: 20px;
                margin-bottom: 5px;
            }
            .tuto-cont textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .button-container {
                display: flex;
                justify-content: center;
            }
            .tuto-cont button {
                width: 250px;
                padding: 5px;
                background-color: #6a11cb;
                border: none;
                border-radius: 5px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .tuto-cont button:hover {
                background-color: #2575fc;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Redactar mensajes</div>
            <div class="menu">
                <a href="menuTutor.jsp">Inicio</a>
                <a href="index.jsp">Cerrar sesión</a>
            </div>
        </div>

        <div class="tuto-cont">
            <h1>Registro de tutorías</h1>
            <form action="action">
                <label id="fecha">Fecha:</label>
                <input type="date" name="fecha">
                <label id="asunto">Asunto:</label>
                <input type="text" name="asunto">
                <label id="duracion">Duración en minutos:</label>
                <input type="number" name="duracion">
                <label id="ldescripcion">Describe la tutoria:</label>
                <textarea id="descripcion" name="descripcion" rows="10" cols="10"></textarea>
                <div class="button-container">
                <button type="submit">Registrar tutoria</button>
                </div>
            </form>
        </div>
    </body>
</html>