<%-- 
                    CREO QUE SOLO TUTORES (A MENOS QUE LOS ALUMNOS HAGAN COMENTARIOS SOBRE LA TUTORIAS)
    2. Notas, comentarios y observaciones respecto al progreso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Personas</title>
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
        }
        .grid-container .lista-alumnos, .detalle-alumnos {
            flex: 1;
            padding: 10px;
        }
        .lista-alumnos {
            border-right: 1px solid #ccc;
        }
        .lista-alumnos ul {
            list-style: none;
            padding: 0;
        }
        .lista-alumnos li {
            margin-bottom: 10px;
        }
        .lista-alumnos a {
            color: #2575fc;
            text-decoration: none;
            font-weight: bold;
        }
        .lista-alumnos a:hover {
            text-decoration: underline;
        }
        .grid-item {
            background-color: #f1f1f1;
            padding: 20px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: transform 0.3s, background-color 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: #333;
            font-size: 16px;
        }
        .grid-item:hover {
            transform: scale(1.05);
            background-color: #e0e0e0;
        }
        .details {
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .details h2 {
            margin-top: 0;
        }
        .chart-container {
            margin-top: 20px;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        var myChart;
        function showDetails(nombre, correo, numero) {
            document.getElementById('Nombre').innerText = nombre;
            document.getElementById('Correo').innerText = correo;
            document.getElementById('Telefono').innerText = numero;
            document.getElementById('detailsImage').style.display = 'none';
            document.getElementById('detailsText').style.display = 'block';

            var progresoData = {
                'Alberto Caballero Perez': [70, 85, 90, 60],
                'Martin Gustavo': [80, 75, 85, 70],
                'Yuliana Berumen Diaz': [90, 95, 80, 75]
            };

            var data = progresoData[nombre] || [0, 0, 0, 0];
            showChart(data);
        }

        function showChart(data) {
            var ctx = document.getElementById('myChart').getContext('2d');
            if (myChart) {
                myChart.destroy();
            }
            myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Formación básica', 'Formación disciplinaria', 'Formación terminal', 'Elección libre'],
                    datasets: [{
                        label: 'Progreso (%)',
                        data: data,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    indexAxis: 'y',
                    scales: {
                        x: {
                            beginAtZero: true,
                            max: 100,
                            ticks: {
                                callback: function(value) {
                                    return value + "%";
                                }
                            }
                        }
                    },
                    plugins: {
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return tooltipItem.raw + "%";
                                }
                            }
                        }
                    }
                }
            });
        }
    </script>
</head>
<body>
    <div class="navbar">
        <div class="logo">Lista y detalle de tutorados</div>
        <div class="menu">
            <a href="menuTutor.jsp">Inicio</a>
            <a href="Mensajes.jsp" class="icon">
                <i class="fas fa-envelope"></i> Mensajería
            </a>
            <a href="index.jsp">Cerrar sesión</a>
        </div>
    </div>

    <div class="content">
        <div class="grid-container">
            <div class="lista-alumnos">
                <ul>
                    <li><a href="#" onclick="showDetails('Alberto Caballero Perez', 'caballero@gmail.com', '229-1234')">Alberto Caballero</a></li>
                    <li><a href="#" onclick="showDetails('Martin Gustavo', 'martin@gmail.com', '229-5678')">Martin Gustavo</a></li>
                    <li><a href="#" onclick="showDetails('Yuliana Berumen Diaz', 'yuliana@gmail.com', '229-4321')">Yuliana Berumen</a></li>
                </ul>
            </div>
            <div class="details">
                <div id="detailsImage">
                    <img src="Images/UvLogo.png" alt="Selecciona una persona" width="100%" height="100%">
                </div>
                <div id="detailsText" style="display: none;">
                    <h2>Detalles</h2>
                    <p><strong>Nombre:</strong> <span id="Nombre">Selecciona un alumno para ver los detalles</span></p>
                    <p><strong>Correo:</strong> <span id="Correo">Selecciona un alumno para ver los detalles</span></p>
                    <p><strong>Numero:</strong> <span id="Telefono">Selecciona un alumno para ver los detalles</span></p>
                    <div class="chart-container">
                        <canvas id="myChart" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
