<%@page import="Datos.Materias_alumnosDAO"%>
<%@page import="Modelo.Alumnos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Avance del alumno</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            .navbardetalle {
                background-color: #333;
                width: 260px;
                height: 385px;
            }
            .navbardetalle a {
                display: block;
                font-size: 25px;
                font-weight: bold;
                color: #f2f2f2;
                text-align: center;
                padding: 30px 16px;
                text-decoration: none;
            }
            .navbardetalle a:hover {
                background-color: #ddd;
                color: black;
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
            }
            .details {
                background-color: #f9f9f9;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                height: 345px;
                overflow-y: scroll;
            }
            .details h2 {
                margin-top: 0;
            }
            table {
                width: 100%;
                margin-top: 10px;
            }
            .asuntotuto {
                font-size: 20px;
                flex-direction: column;
            }
            .fechatuto {
                font-size: 15px;
                color: #555;
                text-align: right;
            }
            .btn-historial {
                width: 70%;
                margin-top: 20px;
                padding: 12px;
                background-color: #6a11cb;
                border-radius: 5px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin-bottom: 10px;
                display: block;
                margin-left: auto;
                margin-right: auto;
            }
            .btn-historial:hover {
                background-color: #2575fc;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <div class="navbar">
            <div class="logo">Información del alumno</div>
            <div class="menu">
                <a href="menuAlumno.jsp">Inicio</a>
                <a href="Mensajes.jsp" class="icon">
                    <i class="fas fa-envelope"></i> Mensajería
                </a>
                <a href="index.jsp">Cerrar sesión</a>
            </div>
        </div>

        <div class="content">
            <div class="grid-container">
                <canvas id="avanceChart"></canvas>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var ctx = document.getElementById('avanceChart').getContext('2d');

                    <% Alumnos alumno = Materias_alumnosDAO.selectAlumnoPorMatricula("A12345678");
                        int[] avanceEsperadoPorSemestre = {7, 13, 19, 25, 32, 39, 45, 52, 56, 56, 56, 56, 56, 56};
                        int totalAvanceEsperado = avanceEsperadoPorSemestre[alumno.getSemestre() - 1];

                        int[] avanceRealPorSemestre = {7, 13, 19, 25, 31, 36, 41, 46, 51, 56, 56, 56, 56, 56};
                        int totalAvanceReal = avanceRealPorSemestre[alumno.getSemestre() - 1];
                    %>

                        var avanceTotal = <%= Materias_alumnosDAO.contarAvanceTotal("A12345678")%>;
                        var avanceEsperado = <%= totalAvanceEsperado%>;
                        var avanceEsperadoReal = <%= totalAvanceReal%>;

                        var myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: ['Avance Actual', 'Avance Esperado', 'Avance Esperado Real'],
                                datasets: [{
                                        label: 'Materias aprobadas',
                                        data: [avanceTotal, avanceEsperado, avanceEsperadoReal],
                                        backgroundColor: [
                                            'rgba(75, 192, 192, 0.2)',
                                            'rgba(200, 162, 235, 0.2)',
                                            'rgba(255, 206, 86, 0.2)'
                                        ],
                                        borderColor: [
                                            'rgba(75, 192, 192, 1)',
                                            'rgba(200, 162, 235, 1)',
                                            'rgba(255, 206, 86, 1)'
                                        ],
                                        borderWidth: 1
                                    }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
                    });
                </script>
            </div>
        </div>
    </body>
</html>