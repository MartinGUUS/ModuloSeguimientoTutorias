<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro Usuarios</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background: linear-gradient(to right, #6a11cb, #2575fc);
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: flex-start;
                margin: 0;
            }
            .login-container {
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                width: 100%;
                box-sizing: border-box;
                margin-top: 20px;
            }
            .login-container h1 {
                margin-bottom: 30px;
                font-size: 24px;
                text-align: center;
                color: #333;
            }
            .login-container label {
                display: contents;
                margin-bottom: 10px;
                text-align: left;
                color: #666;
            }
            .login-container input[type="text"] {
                width: 100%;
                padding: 5px;
                border-radius: 5px;
                font-size: 15px;
                margin-bottom: 15px;
            }
            .login-container input[type="number"] {
                width: 50px;
                padding: 5px;
                border-radius: 5px;
                font-size: 15px;
                margin-bottom: 15px;
            }
            .login-container input[type="submit"],
            .login-container input[type="button"] {
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
            .login-container input[type="submit"]:hover,
            .login-container input[type="button"]:hover {
                background-color: #2575fc;
            }

            .actions {
                display: none;
                margin-top: 20px;
            }

        </style>
        <script>
            function toggleActions() {
                var alumnoCheckbox = document.getElementById('alumno');
                var tutorCheckbox = document.getElementById('tutor');

                if (alumnoCheckbox.checked) {
                    tutorCheckbox.checked = false;
                    document.getElementById('alumno-actions').style.display = 'block';
                    document.getElementById('tutor-actions').style.display = 'none';
                } else if (tutorCheckbox.checked) {
                    alumnoCheckbox.checked = false;
                    document.getElementById('tutor-actions').style.display = 'block';
                    document.getElementById('alumno-actions').style.display = 'none';
                } else {
                    document.getElementById('alumno-actions').style.display = 'none';
                    document.getElementById('tutor-actions').style.display = 'none';
                }
            }
        </script>
    </head>
    <body>
        <div class="login-container">
            <h1>Registro</h1>
            <form action="index.jsp" method="post">
            <label for="nombre">Nombre: </label>
            <input type="text" id="nombre" name="nombre" > <br>
            
            <label for="segnombre">Segundo nombre: </label>
            <input type="text" id="segnombre" name="segnombre" > <br>
            
            <label for="paterno">Apellido paterno: </label>
            <input type="text" id="paterno" name="paterno" > <br>
            
            <label for="materno">Apellido Materno: </label>
            <input type="text" id="materno" name="materno" > <br>
            <!--
            <label for="edad">Edad: </label>
            <input type="number" id="edad" name="edad" > <br>
            -->
            <label for="nacimiento">Fecha de nacimiento: </label>
            <input type="date" id="nacimiento" name="nacimiento" > <br><br>
            
            <label for="telefono">Teléfono: </label>
            <input type="text" id="telefono" name="telefono" > <br>
            
            <label for="correo">Correo: </label>
            <input type="text" id="correo" name="correo" > <br>
            
            <label for="direccion">Dirección: </label>
            <input type="text" id="direccion" name="direccion" > <br>
            
            <label for="contra">Crea una contraseña: </label>
            <input type="text" id="contra" name="contra" > <br>
            
            <br>
            <b>Rol:</b> <br>
            <input type="radio" id="alumno" name="rol" onclick="toggleActions()">
            <label for="alumno">Tutorado</label>
            
            <input type="radio" id="tutor" name="rol" onclick="toggleActions()">
            <label for="tutor">Tutor</label>
            
            <div id="alumno-actions" class="actions">
                <label for="matricula">Matricula: </label>
                <input type="text" id="matricula" name="matricula" > <br>
                
                <label for="carrera">Carrera: </label>
                <input type="text" id="carrera" name="carrera" > <br>
                
                <label for="semestre">Semestre: </label>
                <input type="number" id="semestre" name="semestre" > <br>
                
                <label for="tutoralu">Nombre del tutor: </label>
                <input type="text" id="tutoralu" name="tutoralu" > <br>
            </div>
            
            <div id="tutor-actions" class="actions">
                <!--<label for="matriculaa">Matricula: </label>
                <input type="text" id="matriculaa" name="matriculaa" > <br>-->
            </div>
            
            <br><br>
            
            <input type="button" value="Registrar">
            </form>
            
            <form action="index.jsp" method="post">
                <input type="submit" value="Volver">
            </form>
        </div>
    </body>
</html>