-- Crear base de datos
CREATE DATABASE DigitalEcom;
USE DigitalEcom;

-- Tabla de clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombreCompleto VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    fecha_registro DATE DEFAULT CURDATE(),
    nombre_usuario VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);

-- Tabla de empresas
CREATE TABLE Empresas (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombreComercial VARCHAR(100) NOT NULL,
    representante VARCHAR(100) NOT NULL,
    sector VARCHAR(100),
    descripcion TEXT,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    fecha_creacion DATE DEFAULT CURDATE()
);

-- Tabla de categorías de paquetes publicitarios
CREATE TABLE CategoriasPaquete (
    id_categoria_paquete INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de paquetes publicitarios
CREATE TABLE PaquetesPublicitarios (
    id_paquete INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria_paquete INT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    duracion_dias INT NOT NULL,
    estado VARCHAR(10),
    FOREIGN KEY (id_categoria_paquete) REFERENCES CategoriasPaquete(id_categoria_paquete)
);

-- Tabla de usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);

-- Tabla de categorías de servicios
CREATE TABLE CategoriasServicio (
    id_categoria_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de servicios ofrecidos
CREATE TABLE Servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    estado VARCHAR(10),
    id_categoria_servicio INT,
    FOREIGN KEY (id_categoria_servicio) REFERENCES CategoriasServicio(id_categoria_servicio)
);

-- Tabla de mensajes
CREATE TABLE Mensajes (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    contenido TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla de comentarios sobre paquetes
CREATE TABLE Comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_paquete INT,
    id_cliente INT,
    comentario TEXT NOT NULL,
    fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_paquete) REFERENCES PaquetesPublicitarios(id_paquete),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla de visitas a los paquetes
CREATE TABLE Visitas (
    id_visita INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_paquete INT,
    fecha_visita TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_paquete) REFERENCES PaquetesPublicitarios(id_paquete)
);

-- Tabla de ventas de paquetes publicitarios
CREATE TABLE VentasPaquetes (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_paquete INT,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_pago DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_paquete) REFERENCES PaquetesPublicitarios(id_paquete)
);

-- Tabla de afiliación de clientes a empresas
CREATE TABLE Afiliacion (
    id_afiliacion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_empresa INT,
    fecha_afiliacion DATE DEFAULT CURDATE(),
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa)
);

--Tablas

-- Tabla de categorías de productos
CREATE TABLE CategoriasProducto (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);
-- Productos
-- Catalogo Digital
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT not null,
    id_categoria INT not null,
    descripcion text not null,
    precio DECIMAL(10,2) not null,
    fecha_vencimiento DATE null,
    stockdisponible DECIMAL(10,2) not null,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_categoria) REFERENCES CategoriasProducto(id_categoria)
);
-- Catalogo Digital
CREATE TABLE CatalogoDigital (
    id_catalago INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT not null,
    id_producto INT not null,
    fecha_publicacion DATE not null,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_Producto) REFERENCES Empresas(id_empresa)
);
--Bodegas
-- Tabla de bodegas
CREATE TABLE Bodegas (
    id_bodega INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT not null,
    localizacion VARCHAR(100) NOT NULL,
    capacidad DECIMAL(10,2)  NOT NULL,
    estado ENUM('disponible', 'no disponible') DEFAULT 'disponible',
);
--Movimientos
CREATE TABLE Movimientos (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT not null,
    id_producto INT not null,
    id_bodega_inicio INT not null,
    id_bodega_destino INT not null,
    fecha_movimiento DATE DEFAULT CURDATE(),
    FOREIGN KEY (id_Producto) REFERENCES Empresas(id_empresa),
    FOREIGN KEY (id_bodega_inicio) REFERENCES Bodegas(id_bodega),
    FOREIGN KEY (id_bodega_destino) REFERENCES Bodegas(id_bodega),
);
--videos
-- Tabla de videos
CREATE TABLE Video (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    id_producto int not null,
    descripcion TEXT not null,
    duracion DECIMAL(10,2)  NOT NULL,
    peso DECIMAL(10,2)  NOT NULL,
    estado ENUM('disponible', 'no disponible') DEFAULT 'disponible',
    url text not null,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
--Tutoriales
CREATE TABLE Tutorial (
    id_tutorial INT AUTO_INCREMENT PRIMARY KEY,
    id_video int not null,
    descripcion TEXT not null,
    url text not null
    peso DECIMAL(10,2)  NOT NULL,
    estado ENUM('disponible', 'no disponible') DEFAULT 'disponible',
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),
);

--Procedimientos almacenados
