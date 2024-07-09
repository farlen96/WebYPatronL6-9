-- Crear la base de datos Proyecto
CREATE DATABASE Proyecto;

-- Crear el usuario Administrador con la contraseña Tienda2024
CREATE USER 'Administrador'@'localhost' IDENTIFIED BY 'Tienda2024';

-- Otorgar todos los privilegios al usuario Administrador sobre la base de datos Proyecto
GRANT ALL PRIVILEGES ON Proyecto.* TO 'Administrador'@'localhost';

-- Aplicar los cambios
FLUSH PRIVILEGES;


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

