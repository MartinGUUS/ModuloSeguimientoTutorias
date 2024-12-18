<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Tutorias</title>

    <script>
        function borrarCampos() {
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
        }

        function mostrarAlert(message) {
            alert(message);
            borrarCampos();
        }

        window.onload = function() {
            borrarCampos();
        };
    </script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            box-sizing: border-box;
        }

        .login-container h1 {
            margin-bottom: 30px;
            font-size: 24px;
            text-align: center;
            color: #333;
        }

        .login-container label {
            display: block;
            margin-bottom: 10px;
            text-align: left;
            color: #666;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .login-container button {
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

        .login-container button:hover {
            background-color: #2575fc;
        }

    </style>



</head>
<body>
<div class="login-container">
    <h1>Tutorias UV</h1>
    <form action="svLogin" method="POST">
        <label for="username">Correo</label>
        <input type="text" id="username" name="mail" >

        <label for="password">Clave</label>
        <input type="password" id="password" name="contra" >

        <button type="submit" name="action" value="login" >Loguear</button>
        <button type="submit" name="action" value="register">Registrar</button>
    </form>
</div>

<%
    String mensajeError = (String) request.getAttribute("errorMessage");
    if (mensajeError != null) {
%>
<script>
    mostrarAlert('<%= mensajeError %>');
</script>
<%
    }
%>
</body>
</html>
