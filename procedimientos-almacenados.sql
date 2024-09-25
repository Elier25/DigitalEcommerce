DELIMITER //

CREATE PROCEDURE GuardarCliente(
    IN p_nombreCompleto VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255),
    IN p_nombre_usuario VARCHAR(100),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    INSERT INTO Clientes (nombreCompleto, email, telefono, direccion, nombre_usuario, contrasena)
    VALUES (p_nombreCompleto, p_email, p_telefono, p_direccion, p_nombre_usuario, p_contrasena);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarCliente(
    IN p_id_cliente INT,
    IN p_nombreCompleto VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255),
    IN p_nombre_usuario VARCHAR(100),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    UPDATE Clientes
    SET nombreCompleto = p_nombreCompleto,
        email = p_email,
        telefono = p_telefono,
        direccion = p_direccion,
        nombre_usuario = p_nombre_usuario,
        contrasena = p_contrasena
    WHERE id_cliente = p_id_cliente;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarCliente(
    IN p_id_cliente INT
)
BEGIN
    DELETE FROM Clientes WHERE id_cliente = p_id_cliente;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarCliente(
    IN p_criterio VARCHAR(100)
)
BEGIN
    SELECT * FROM Clientes
    WHERE nombreCompleto LIKE CONCAT('%', p_criterio, '%')
       OR email LIKE CONCAT('%', p_criterio, '%');
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GuardarEmpresa(
    IN p_nombreComercial VARCHAR(100),
    IN p_representante VARCHAR(100),
    IN p_sector VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255)
)
BEGIN
    INSERT INTO Empresas (nombreComercial, representante, sector, descripcion, telefono, direccion)
    VALUES (p_nombreComercial, p_representante, p_sector, p_descripcion, p_telefono, p_direccion);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ModificarEmpresa(
    IN p_id_empresa INT,
    IN p_nombreComercial VARCHAR(100),
    IN p_representante VARCHAR(100),
    IN p_sector VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255)
)
BEGIN
    UPDATE Empresas
    SET nombreComercial = p_nombreComercial,
        representante = p_representante,
        sector = p_sector,
        descripcion = p_descripcion,
        telefono = p_telefono,
        direccion = p_direccion
    WHERE id_empresa = p_id_empresa;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE EliminarEmpresa(
    IN p_id_empresa INT
)
BEGIN
    DELETE FROM Empresas WHERE id_empresa = p_id_empresa;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE BuscarEmpresa(
    IN p_criterio VARCHAR(100)
)
BEGIN
    SELECT * FROM Empresas
    WHERE nombreComercial LIKE CONCAT('%', p_criterio, '%')
       OR sector LIKE CONCAT('%', p_criterio, '%');
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GuardarPaquetePublicitario(
    IN p_id_categoria_paquete INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2),
    IN p_duracion_dias INT,
    IN p_estado VARCHAR(10)
)
BEGIN
    INSERT INTO PaquetesPublicitarios (id_categoria_paquete, nombre, descripcion, precio, duracion_dias, estado)
    VALUES (p_id_categoria_paquete, p_nombre, p_descripcion, p_precio, p_duracion_dias, p_estado);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarPaquetePublicitario(
    IN p_id_paquete INT,
    IN p_id_categoria_paquete INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2),
    IN p_duracion_dias INT,
    IN p_estado VARCHAR(10)
)
BEGIN
    UPDATE PaquetesPublicitarios
    SET id_categoria_paquete = p_id_categoria_paquete,
        nombre = p_nombre,
        descripcion = p_descripcion,
        precio = p_precio,
        duracion_dias = p_duracion_dias,
        estado = p_estado
    WHERE id_paquete = p_id_paquete;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarPaquetePublicitario(
    IN p_id_paquete INT
)
BEGIN
    DELETE FROM PaquetesPublicitarios WHERE id_paquete = p_id_paquete;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE BuscarPaquetePublicitario(
    IN p_criterio VARCHAR(100)
)
BEGIN
    SELECT * FROM PaquetesPublicitarios
    WHERE nombre LIKE CONCAT('%', p_criterio, '%')
       OR estado LIKE CONCAT('%', p_criterio, '%');
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GuardarCategoriaPaquete(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO CategoriasPaquete (nombre, descripcion)
    VALUES (p_nombre, p_descripcion);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarCategoriaPaquete(
    IN p_id_categoria_paquete INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT
)
BEGIN
    UPDATE CategoriasPaquete
    SET nombre = p_nombre,
        descripcion = p_descripcion
    WHERE id_categoria_paquete = p_id_categoria_paquete;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarCategoriaPaquete(
    IN p_id_categoria_paquete INT
)
BEGIN
    DELETE FROM CategoriasPaquete WHERE id_categoria_paquete = p_id_categoria_paquete;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarCategoriaPaquete(
    IN p_criterio VARCHAR(100)
)
BEGIN
    SELECT * FROM CategoriasPaquete
    WHERE nombre LIKE CONCAT('%', p_criterio, '%');
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GuardarUsuario(
    IN p_nombre_usuario VARCHAR(100),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    INSERT INTO Usuarios (nombre_usuario, contrasena)
    VALUES (p_nombre_usuario, p_contrasena);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarUsuario(
    IN p_id_usuario INT,
    IN p_nombre_usuario VARCHAR(100),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    UPDATE Usuarios
    SET nombre_usuario = p_nombre_usuario,
        contrasena = p_contrasena
    WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarUsuario(
    IN p_id_usuario INT
)
BEGIN
    DELETE FROM Usuarios WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarUsuario(
    IN p_criterio VARCHAR(100)
)
BEGIN
    SELECT * FROM Usuarios
    WHERE nombre_usuario LIKE CONCAT('%', p_criterio, '%');
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GuardarCategoriaServicio(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO CategoriasServicio (nombre, descripcion)
    VALUES (p_nombre, p_descripcion);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarCategoriaServicio(
    IN p_id_categoria_servicio INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT
)
BEGIN
    UPDATE CategoriasServicio
    SET nombre = p_nombre,
        descripcion = p_descripcion
    WHERE id_categoria_servicio = p_id_categoria_servicio;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarCategoriaServicio(
    IN p_id_categoria_servicio INT
)
BEGIN
    DELETE FROM CategoriasServicio WHERE id_categoria_servicio = p_id_categoria_servicio;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarCategoriaServicio(
    IN p_criterio VARCHAR(100)
)
BEGIN
    SELECT * FROM CategoriasServicio
    WHERE nombre LIKE CONCAT('%', p_criterio, '%');
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GuardarServicio(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2),
    IN p_estado VARCHAR(10),
    IN p_id_categoria_servicio INT
)
BEGIN
    INSERT INTO Servicios (nombre, descripcion, precio, estado, id_categoria_servicio)
    VALUES (p_nombre, p_descripcion, p_precio, p_estado, p_id_categoria_servicio);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarServicio(
    IN p_id_servicio INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2),
    IN p_estado VARCHAR(10),
    IN p_id_categoria_servicio INT
)
BEGIN
    UPDATE Servicios
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        precio = p_precio,
        estado = p_estado,
        id_categoria_servicio = p_id_categoria_servicio
    WHERE id_servicio = p_id_servicio;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarServicio(
    IN p_id_servicio INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2),
    IN p_estado VARCHAR(10),
    IN p_id_categoria_servicio INT
)
BEGIN
    UPDATE Servicios
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        precio = p_precio,
        estado = p_estado,
        id_categoria_servicio = p_id_categoria_servicio
    WHERE id_servicio = p_id_servicio;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarServicio(
    IN p_id_servicio INT
)
BEGIN
    DELETE FROM Servicios WHERE id_servicio = p_id_servicio;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarServicio(
    IN p_criterio VARCHAR(100)
)
BEGIN
    SELECT * FROM Servicios
    WHERE nombre LIKE CONCAT('%', p_criterio, '%')
       OR estado LIKE CONCAT('%', p_criterio, '%');
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GuardarMensaje(
    IN p_id_cliente INT,
    IN p_contenido TEXT
)
BEGIN
    INSERT INTO Mensajes (id_cliente, contenido)
    VALUES (p_id_cliente, p_contenido);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarMensaje(
    IN p_id_mensaje INT,
    IN p_contenido TEXT
)
BEGIN
    UPDATE Mensajes
    SET contenido = p_contenido
    WHERE id_mensaje = p_id_mensaje;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarMensaje(
    IN p_id_mensaje INT
)
BEGIN
    DELETE FROM Mensajes WHERE id_mensaje = p_id_mensaje;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarMensaje(
    IN p_id_cliente INT
)
BEGIN
    SELECT * FROM Mensajes
    WHERE id_cliente = p_id_cliente;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GuardarComentario(
    IN p_id_paquete INT,
    IN p_id_cliente INT,
    IN p_comentario TEXT
)
BEGIN
    INSERT INTO Comentarios (id_paquete, id_cliente, comentario)
    VALUES (p_id_paquete, p_id_cliente, p_comentario);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarComentario(
    IN p_id_comentario INT,
    IN p_id_paquete INT,
    IN p_id_cliente INT,
    IN p_comentario TEXT
)
BEGIN
    UPDATE Comentarios
    SET id_paquete = p_id_paquete,
        id_cliente = p_id_cliente,
        comentario = p_comentario
    WHERE id_comentario = p_id_comentario;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarComentario(
    IN p_id_comentario INT
)
BEGIN
    DELETE FROM Comentarios WHERE id_comentario = p_id_comentario;
END //

DELIMITER ;
