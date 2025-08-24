# Mi Portafolio Web

Este es un proyecto para el curso de Desarrollo Web I.

## Tecnologías Utilizadas

* **Frontend:** HTML5, CSS3, Bootstrap 5
* **Backend:** JavaServer Pages (JSP)
* **Base de Datos:** MariaDB
* **Servidor de Aplicaciones:** Apache Tomcat 10
* **Control de Versiones:** Git y GitHub

## Cómo Ejecutar el Proyecto Localmente

1.  **Clonar el repositorio:**
    git clone [https://github.com/Naibaf-39/MiPortafolioWeb.git](https://github.com/Naibaf-39/MiPortafolioWeb.git)

2.  **Configurar la Base de Datos:**
    * MariaDB
        
      CREATE DATABASE portafolio_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
      
      CREATE TABLE proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    url_imagen VARCHAR(255),
    url_repositorio VARCHAR(255)
);

INSERT INTO proyectos (titulo, descripcion, url_imagen, url_repositorio) VALUES
('Proyecto A', 'Sistema de gestión de tareas desarrollado con tecnologías web modernas.', 'img/proyecto-a.png', 'https://github.com'),
('Proyecto B', 'Aplicación de e-commerce con un backend robusto y un frontend interactivo.', 'img/proyecto-b.png', 'https://github.com'),
('Proyecto C', 'Un blog personal.', 'img/proyecto-c.png', 'https://github.com');


      
3.  **Instalar el Driver JDBC:**
    * Descarga el conector MariaDB para Java (archivo .jar).
    * Copia el archivo `.jar` en la carpeta `src/main/webapp/WEB-INF/lib/`.

4.  **Desplegar en Tomcat 10:**
    * Copia el contenido de `src/main/webapp/` a `/var/lib/tomcat10/webapps/MiPortafolio/`.

5.  **Acceder al sitio:**
    * `http://localhost:8080/MiPortafolio/`.

