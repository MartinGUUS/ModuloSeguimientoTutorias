<%@ page import="java.util.List" %>
<%@ page import="Modelo.Mensajes" %>
<%@ page import="Datos.MensajesDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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

        .clasealerta {
            display: none;
            background-color: green;
            color: white;
            padding: 20px;
            margin: 20px;
            border-radius: 5px;
            text-align: center;
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            width: 350px;
        }

        .clasealerta.error {
            background-color: red;
        }
    </style>
    <script>
        function showMessageDetails(de, asunto, fecha, msj) {
            document.getElementById('de').innerText = de;
            document.getElementById('asunto').innerText = asunto;
            document.getElementById('fecha').innerText = fecha;
            document.getElementById('msj').innerText = msj;
            document.getElementById('detailsImage').style.display = 'none';
            document.getElementById('detailsText').style.display = 'block';
        }

        window.onload = function () {
            const url = new URLSearchParams(window.location.search);
            const status = url.get('status');
            if (status) {
                const alerta = document.getElementById('alerta');
                if (status === 'success') {
                    alerta.textContent = 'Mensaje enviado exitosamente.';
                    alerta.classList.add('success');
                } else if (status === 'error') {
                    alerta.textContent = 'Error al enviar el mensaje.';
                    alerta.classList.add('error');
                }
                alerta.style.display = 'block';
                setTimeout(() => {
                    alerta.style.display = 'none';
                }, 3000); // 3 segundos
            }
        };
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
    <div class="logo">Bandeja de Entrada</div>
    <div class="menu">
        <a href="menuTutor.jsp">Inicio</a>
    </div>
</div>

<div class="content">
    <div id="alerta" class="clasealerta"></div>
    <div class="grid-container">
        <div class="button-container">
            <button onclick="window.location.href = 'redactarMensajeTutores.jsp'">Nuevo Mensaje</button>
        </div>
        <div class="msj-list">

            <table border=".5">
                <%
                    Object idTutorLoginObj = request.getSession().getAttribute("idTutorLogin");
                    int idTutor = 0;
                    if (idTutorLoginObj != null && idTutorLoginObj instanceof Integer) {
                        idTutor = (Integer) idTutorLoginObj;
                    } else {
                        out.println("Error: idTutorLogin no está presente o no es un número entero válido.");
                    }

                    MensajesDAO mensajesDAO = new MensajesDAO();
                    List<Mensajes> listMensajes = mensajesDAO.selectMensajesPorTutor(idTutor);

                    for (Mensajes mensaje : listMensajes) {
                        String nombreCompleto = mensaje.getNombre() + " " + mensaje.getSegundoNombre() + " " + mensaje.getApPaterno() + " " + mensaje.getApMaterno();
                %>
                <tr>
                    <td>
                        <a href="#"
                           onclick="showMessageDetails('<%= nombreCompleto %>', '<%=mensaje.getAsunto()%>', '<%=mensaje.getFecha()%>', '<%=mensaje.getMensaje()%>')">
                            <div class="message-summary">
                                <span class="sender"><%= nombreCompleto %></span>
                                <div class="message-details">
                                    <span class="subject">Asunto: <%=mensaje.getAsunto()%></span>
                                    <span class="date"><%=mensaje.getFecha()%></span>
                                </div>
                            </div>
                        </a>
                    </td>
                </tr>

                <% }%>

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