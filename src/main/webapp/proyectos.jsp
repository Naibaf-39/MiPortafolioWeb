<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Portafolio - Proyectos</title>
    <link rel="stylesheet" href="css/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.html">Mi Portafolio</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="index.html">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link active" href="proyectos.jsp">Proyectos</a></li>
                        <li class="nav-item"><a class="nav-link" href="habilidades.html">Habilidades</a></li>
                        <li class="nav-item"><a class="nav-link" href="contacto.html">Contacto</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="container my-5">
        <section id="proyectos">
            <h2 class="text-center mb-4">Mis Proyectos</h2>
            <div class="row">
                <%
                    // Bloque de código Java (Scriptlet)
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // 1. Cargar el driver JDBC
                        Class.forName("org.mariadb.jdbc.Driver");

                        // 2. Establecer la conexión
                        String url = "jdbc:mariadb://localhost:3306/portafolio_db";
                        String user = "fabian";
                        String password = "1234";
                        conn = DriverManager.getConnection(url, user, password);

                        // 3. Crear y ejecutar la consulta SQL
                        String sql = "SELECT titulo, descripcion, url_imagen, url_repositorio FROM proyectos";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        // 4. Procesar los resultados y generar HTML
                        while (rs.next()) {
                            String titulo = rs.getString("titulo");
                            String descripcion = rs.getString("descripcion");
                            String imgUrl = rs.getString("url_imagen");
                            String repoUrl = rs.getString("url_repositorio");
                %>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 card-proyecto">
                        <img src="<%= imgUrl %>" class="card-img-top" alt="Imagen del proyecto <%= titulo %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= titulo %></h5>
                            <p class="card-text"><%= descripcion %></p>
                        </div>
                        <div class="card-footer">
                            <a href="<%= repoUrl %>" class="btn btn-primary" target="_blank">Ver Repositorio</a>
                        </div>
                    </div>
                </div>
                <%
                        } // Fin del bucle while
                    } catch (Exception e) {
                        // Imprimir un mensaje de error amigable en la página
                        out.println("<div class='alert alert-danger'>Error al conectar a la base de datos: " + e.getMessage() + "</div>");
                        e.printStackTrace();
                    } finally {
                        // 5. Cerrar los recursos en el orden inverso
                        try { if (rs != null) rs.close(); } catch (SQLException e) {}
                        try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
                        try { if (conn != null) conn.close(); } catch (SQLException e) {}
                    }
                %>
            </div>
        </section>
    </main>

    <footer class="bg-dark text-white text-center p-3 mt-auto">
         <p>&copy; 2025 - Mi Portafolio. Todos los derechos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
