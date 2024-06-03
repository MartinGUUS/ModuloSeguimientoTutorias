<%@ page import="Datos.TutoresDAO" %>
<%@ page import="Modelo.Tutores" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Usuarios</title>
    <link rel="stylesheet" href="Registro.css">

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
                document.getElementById('matricula').value = '';
                document.getElementById('carrera').value = '';
                document.getElementById('semestre').value = '';
                document.getElementById('tutor-actions').style.display = 'block';
                document.getElementById('alumno-actions').style.display = 'none';
            } else {
                document.getElementById('alumno-actions').style.display = 'block';
                document.getElementById('tutor-actions').style.display = 'none';
            }
        }

        window.onload = function () {
            toggleActions();
        }

    </script>
</head>
<body>
<div class="login-container">
    <h1>Registro</h1>
    <form action="svRegistro" method="POST">
        <label for="nombre">Nombre: </label>
        <input type="text" id="nombre" name="nombre"> <br>

        <label for="segnombre">Segundo nombre: </label>
        <input type="text" id="segnombre" name="segnombre"> <br>

        <label for="paterno">Apellido paterno: </label>
        <input type="text" id="paterno" name="paterno"> <br>

        <label for="materno">Apellido Materno: </label>
        <input type="text" id="materno" name="materno"> <br>

        <label for="nacimiento">Fecha de nacimiento: </label>
        <input type="date" id="nacimiento" name="nacimiento"> <br><br>

        <label for="telefono">Teléfono: </label>
        <input type="text" id="telefono" name="telefono"> <br>

        <label for="correo">Correo: </label>
        <input type="text" id="correo" name="correo"> <br>

        <label for="direccion">Dirección: </label>
        <input type="text" id="direccion" name="direccion"> <br>

        <label for="contra">Crea una contraseña: </label>
        <input type="text" id="contra" name="contra"> <br>

        <br>
        <b>Rol:</b> <br>
        <input type="radio" id="alumno" name="rol" value="alumno" onclick="toggleActions()" checked>
        <label for="alumno">Tutorado</label>

        <input type="radio" id="tutor" name="rol" value="tutor" onclick="toggleActions()">
        <label for="tutor">Tutor</label>

        <div id="alumno-actions" class="actions">
            <label for="matricula">Matricula: </label>
            <input type="text" id="matricula" name="matricula"> <br>

            <label for="carrera">Carrera: </label>
            <input type="text" id="carrera" name="carrera"> <br>

            <label for="semestre">Semestre: </label>
            <input type="number" id="semestre" name="semestre" min="1" max="14"> <br>

            <label for="tutoralu">Tutor: </label>
            <select id="tutoralu" name="tutoralu">

                <%
                    TutoresDAO tutoresDAO = new TutoresDAO();
                    List<Tutores> as = tutoresDAO.selectTutoresVarios();
                    String tuto = " ";
                    for (int i = 0; i < as.size(); i++) {
                        String idTutor = String.valueOf(as.get(i).getIdTutores());
                        tuto = (as.get(i).getIdTutores() + ".- " + as.get(i).getNombre().toUpperCase() + " " + as.get(i).getSegundoNombre().toUpperCase() + " " + as.get(i).getApPaterno().toUpperCase() + " " + as.get(i).getApMaterno().toUpperCase());
                %>
                <option value="<%= idTutor %>" ><%=tuto%>
                </option>
                <% }%>

            </select> <br>
        </div>

        <div id="tutor-actions" class="actions">

        </div>

        <br><br>

        <input type="submit" value="Registrar">
    </form>

    <form action="index.jsp" method="post">
        <input type="submit" value="Volver">
    </form>
</div>
</body>
</html>