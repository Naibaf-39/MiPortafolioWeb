<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Mensaje Recibido</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <main class="container my-5 text-center">
        <%
            // Obtenemos los parámetros enviados por el formulario
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String mensaje = request.getParameter("mensaje");
        %>
        <div class="alert alert-success">
            <h1>¡Gracias por tu mensaje, <%= nombre %>!</h1>
            <p>Hemos recibido tus datos y te contactaremos pronto al correo: <strong><%= email %></strong></p>
            <hr>
            <p class="mb-0">Tu mensaje: <em>"<%= mensaje %>"</em></p>
        </div>
        <a href="index.html" class="btn btn-primary mt-3">Volver al Inicio</a>
    </main>
</body>
</html>
