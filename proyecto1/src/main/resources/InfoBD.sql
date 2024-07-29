/*Se crea la base de datos */
drop schema if exists proyecto;
drop user if exists Administrador;
CREATE SCHEMA proyecto ;

/*Se crea un usuario para la base de datos llamado "Administrador" y tiene la contraseña "Tienda2024"*/
create user 'Administrador'@'%' identified by 'Tienda2024';

/*Se asignan los prvilegios sobr ela base de datos TechShop al usuario creado */
GRANT ALL PRIVILEGES ON Proyecto.* TO 'Administrador'@'localhost';

flush privileges;


-- Crear tabla para Categoria
CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Crear tabla para Conozcanos
CREATE TABLE Conozcanos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    fecha DATE
);

-- Crear tabla para Contactenos
CREATE TABLE Contactenos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    mensaje TEXT,
    fecha DATE
);

-- Crear tabla para Mapa
CREATE TABLE Mapa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8)
);

-- Crear tabla para Politicas
CREATE TABLE Politicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    fecha DATE
);


