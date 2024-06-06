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
        <title>Bandeja de Entrada</title>
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
                grid-template-columns: 1fr 2fr;
                gap: 20px;
                height: 450px;
            }
            .button-container {
                grid-column: 1 / span 2;
                display: flex;
                justify-content: end;
            }
            .button-container button {
                padding: 5px 5px;
                background-color: #6a11cb;
                border: none;
                border-radius: 10px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .button-container button:hover {
                background-color: #2575fc;
            }
            .msj-list, .details {
                flex: 1;
                padding: 10px;
            }
            .msj-list {
                height: 100%;
                width: 300px;
                overflow-y: scroll;
                border-right: 1px solid #ccc;
            }
            .msj-list a {
                display: block;
                color: #2575fc;
                text-decoration: none;
                font-weight: bold;
                padding: 10px;
                border-bottom: 1px solid #ccc;
                transition: background-color 0.3s;
            }

            .msj-list a:hover {
                background-color: #f0f0f0;
            }

            .message-summary {
                display: flex;
                flex-direction: column;
            }

            .sender {
                font-size: 16px;
                font-weight: bold;
            }

            .message-details {
                display: flex;
                justify-content: space-between;
                font-size: 12px;
                color: #555;
            }

            .subject {
                flex: 2;
            }

            .date {
                flex: 1;
                text-align: right;
            }

            .msj-list table {
                width: 100%;
            }
            .details {
                background-color: #f9f9f9;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                overflow-y: auto;
                height: 280px;
            }
            .details h2 {
                margin-top: 0;
            }
        </style>
        <script>
            function showMessageDetails(de, asunto, fecharf, msj) {
                document.getElementById('de').innerText = de;
                document.getElementById('asunto').innerText = asunto;
                document.getElementById('fecha').innerText = fecha;
                document.getElementById('msj').innerText = msj;
                document.getElementById('detailsImage').style.display = 'none';
                document.getElementById('detailsText').style.display = 'block';
            }
        </script>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Bandeja de Entrada</div>
            <div class="menu">
                <%
                    String nombreAl = (String) request.getSession().getAttribute("nombreAlumno");
                %>
                <a href=""><%= nombreAl%>
                </a>
                <a href="menu.jsp">Inicio</a>
            </div>
        </div>

        <div class="content">
            <div class="grid-container">
                <div class="button-container">
                    <button onclick="window.location.href = 'redactarMensaje.jsp'">Nuevo Mensaje</button>
                </div>
                <div class="msj-list">
                    <table border=".5">
                        <tr>
                            <td>
                                <a href="#" onclick="showMessageDetails('Alberto Caballero', 'Reunión de equipo', '2024-05-01', 'jfvhbsjcdhfh...')">
                                    <div class="message-summary">
                                        <span class="sender">Alberto Caballero</span>
                                        <div class="message-details">
                                            <span class="subject">Reunión de equipo</span>
                                            <span class="date">2024-05-01</span>
                                        </div>
                                    </div>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#" onclick="showMessageDetails('Martin Gustavo', 'Actualización del proyecto', '2024-05-02', 'schcnjksdchy...')">
                                    <div class="message-summary">
                                        <span class="sender">Martin Gustavo</span>
                                        <div class="message-details">
                                            <span class="subject">Actualización del proyecto</span>
                                            <span class="date">2024-05-02</span>
                                        </div>
                                    </div>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#" onclick="showMessageDetails('Tutor', 'Tutoria', '2024-05-03', 'kskjjdjdjdhh...')">
                                    <div class="message-summary">
                                        <span class="sender">Tutor</span>
                                        <div class="message-details">
                                            <span class="subject">Tutoria</span>
                                            <span class="date">2024-05-03</span>
                                        </div>
                                    </div>
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="details">
                    <div id="detailsImage">
                        <img src="Images/UvLogo.png" alt="Selecciona un mensaje" width="100%" height="100%">
                    </div>
                    <div id="detailsText" style="display: none;">
                        <p><strong>De:</strong> <span id="de"></span></p>
                        <p><strong>Asunto:</strong> <span id="asunto"></span></p>
                        <p><strong>Fecha:</strong> <span id="fecha"></span></p>
                        <p><span id="msj"></span></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>