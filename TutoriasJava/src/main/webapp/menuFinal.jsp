<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Tutores</title>
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
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
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
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">Universidad Veracruzana Tutorías</div>
        <div class="menu">
            <a href="#inicio">Inicio</a>
            <a href="#mensajeria" class="icon">
                <i class="fas fa-envelope"></i> Mensajería
            </a>
            <a href="index.jsp">Cerrar sesión</a>
        </div>
    </div>

    <div class="content">
        <div class="grid-container">
            <a href="#opcion1" class="grid-item">Opción 1</a>
            <a href="#opcion2" class="grid-item">Opción 2</a>
            <a href="#opcion3" class="grid-item">Opción 3</a>
            <a href="#opcion4" class="grid-item">Opción 4</a>
            <a href="#opcion5" class="grid-item">Opción 5</a>
            <a href="#opcion6" class="grid-item">Opción 6</a>
            <a href="#opcion7" class="grid-item">Opción 7</a>
            <a href="#opcion8" class="grid-item">Opción 8</a>
            <a href="#opcion9" class="grid-item">Opción 9</a>
            <a href="#opcion10" class="grid-item">Opción 10</a>
            <a href="#opcion11" class="grid-item">Opción 11</a>
            <a href="#opcion12" class="grid-item">Opción 12</a>
        </div>
    </div>
</body>
</html>
