<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="Datos.TutoresDAO" %>
<%@ page import="Modelo.Tutores" %>
<%@ page import="java.util.List" %>
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="date"],
        .form-group input[type="password"],
        .form-group input[type="number"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 15px;
            box-sizing: border-box;
        }
        .form-group .radio-group {
            display: flex;
            align-items: center;
        }
        .form-group .radio-group input[type="radio"] {
            margin-right: 5px;
        }
        .form-group .radio-group label {
            margin-right: 15px;
            margin-bottom: 0;
        }
        .form-group input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #6a11cb;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-group input[type="submit"]:hover {
            background-color: #2575fc;
        }
        .actions {
            display: none;
            margin-top: 20px;
        }
        .alert {
            padding: 15px;
            background-color: #f44336;
            color: white;
            margin-bottom: 15px;
            border-radius: 5px;
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
                document.getElementById('alumno-actions').style.display = 'none';
                document.getElementById('tutor-actions').style.display = 'block';
            }
        }

        function setDateLimits() {
            var dateField = document.getElementById('nacimiento');
            var today = new Date();
            var maxDate = new Date(today.getFullYear() - 17, today.getMonth(), today.getDate());
            dateField.max = maxDate.toISOString().split('T')[0];
            dateField.min = '1970-01-01';
        }

        function validatePhone(event) {
            var phoneField = document.getElementById('telefono');
            phoneField.value = phoneField.value.replace(/[^0-9]/g, '');
        }

        function validateForm(event) {
            var phoneField = document.getElementById('telefono');
            if (phoneField.value.length !== 10) {
                alert("El número de teléfono debe tener exactamente 10 dígitos.");
                event.preventDefault();
            }
        }

        window.onload = function () {
            toggleActions();
            setDateLimits();
            <%

                String registroError = (String) session.getAttribute("registroError");
                out.println(registroError);
                Map<String, String[]> datosFormulario = (Map<String, String[]>) session.getAttribute("datosFormulario");
                if (registroError != null) {
            %>
            alert("<%= registroError.replace("\n", "\\n") %>");
            <%
                for (Map.Entry<String, String[]> entry : datosFormulario.entrySet()) {
                    String key = entry.getKey();
                    String value = entry.getValue()[0];
            %>
            document.getElementById("<%= key %>").value = "<%= value %>";
            <%
                }
                session.removeAttribute("registroError");
                session.removeAttribute("datosFormulario");
                }
            %>
        }
    </script>
</head>
<body>
<div class="login-container">
    <h1>Registro</h1>
    <form action="svRegistro" method="POST" onsubmit="validateForm(event)">
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>
        <div class="form-group">
            <label for="segnombre">Segundo nombre:</label>
            <input type="text" id="segnombre" name="segnombre">
        </div>
        <div class="form-group">
            <label for="paterno">Apellido paterno:</label>
            <input type="text" id="paterno" name="paterno" required>
        </div>
        <div class="form-group">
            <label for="materno">Apellido Materno:</label>
            <input type="text" id="materno" name="materno">
        </div>
        <div class="form-group">
            <label for="nacimiento">Fecha de nacimiento:</label>
            <input type="date" id="nacimiento" name="nacimiento" required>
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" required oninput="validatePhone()">
        </div>
        <div class="form-group">
            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" required>
        </div>
        <div class="form-group">
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" required>
        </div>
        <div class="form-group">
            <label for="contra">Crea una contraseña:</label>
            <input type="password" id="contra" name="contra" required>
        </div>
        <div class="form-group">
            <b>Rol:</b>
            <div class="radio-group">
                <input type="radio" id="alumno" name="rol" value="alumno" onclick="toggleActions()" checked>
                <label for="alumno">Tutorado</label>
                <input type="radio" id="tutor" name="rol" value="tutor" onclick="toggleActions()">
                <label for="tutor">Tutor</label>
            </div>
        </div>
        <div id="alumno-actions" class="actions">
            <div class="form-group">
                <label for="matricula">Matricula:</label>
                <input type="text" id="matricula" name="matricula">
            </div>
            <div class="form-group">
                <label for="carrera">Carrera:</label>
                <select id="carrera" name="carrera">
                    <option value="Ingenieria informatica">Ingeniería Informática</option>
                    <option value="ingenieria en electronica y comunicaciones">Ingeniería en Electrónica y Comunicaciones</option>
                    <option value="ingenieria mecatronica">Ingeniería Mecatrónica</option>
                    <option value="ingenieria civil">Ingeniería Civil</option>
                    <option value="ingenieria quimica">Ingeniería Química</option>
                    <option value="ingenieria industrial">Ingeniería Industrial</option>
                    <option value="ingenieria topografica">Ingeniería Topográfica</option>
                    <option value="ingenieria mecanica electrica">Ingeniería Mecánica Eléctrica</option>
                </select>
            </div>
            <div class="form-group">
                <label for="semestre">Semestre:</label>
                <input type="number" id="semestre" name="semestre" min="1" max="14">
            </div>
            <div class="form-group">
                <label for="tutoralu">Tutor:</label>
                <select id="tutoralu" name="tutoralu">
                    <%
                        TutoresDAO tutoresDAO = new TutoresDAO();
                        List<Tutores> tutoresList = tutoresDAO.selectTutoresVarios();
                        for (Tutores tutor : tutoresList) {
                            int idTutor = tutor.getIdTutores();
                            String nombreCompleto = idTutor + ".- " + tutor.getNombre().toUpperCase();
                    %>
                    <option value="<%= tutor.getIdTutores() %>"><%= tutor.getNombre().toUpperCase() + " " + tutor.getSegundoNombre().toUpperCase() + " " + tutor.getApPaterno().toUpperCase() + " " + tutor.getApMaterno().toUpperCase() %></option>
                    <%
                        }
                    %>
                </select>
            </div>
        </div>

        <div class="form-group">
            <input type="submit" value="Registrar">
        </div>
    </form>
    <form action="index.jsp" method="post">
        <div class="form-group">
            <input type="submit" value="Volver">
        </div>
    </form>
</div>
</body>
</html>
