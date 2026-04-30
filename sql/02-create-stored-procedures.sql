-- ====================================================================================
-- BASE DE DATOS: Sistema para una Tienda Digital de Música y Podcast
--
-- ESTUDIANTES:
--   Eduardo David González González
--   Alberto Zúñiga Sánchez
--   Jean Paul Segura Villalobos
--   Edgar Fabián Mora Hidalgo
--
-- UNIVERSIDAD FIDÉLITAS
-- CURSO: SC-404 Fundamentos de Diseño de Base de Datos
-- PROFESOR: Robles Sánchez Michael
-- FECHA: Junio 30, 2025
-- ====================================================================================

-- ====================================================================================
-- Creación de los procediminetos para insertar datos
-- ====================================================================================

-- Procedimiento para insertar en Usuarios
CREATE OR ALTER PROCEDURE PRDB_Insertar_Usuario
  @ID_Usuario INT,
  @Nombre VARCHAR(30),
  @Apellido VARCHAR(30),
  @Correo VARCHAR(50),
  @Contraseña VARCHAR(30),
  @Fecha_de_Registro DATE,
  @ID_Rol INT
AS
BEGIN
  INSERT INTO Usuarios (ID_Usuario, Nombre, Apellido, Correo, Contraseña, Fecha_de_Registro, ID_Rol)
  VALUES (@ID_Usuario, @Nombre, @Apellido, @Correo, @Contraseña, @Fecha_de_Registro, @ID_Rol);
END;
GO

-- Procedimiento para insertar en Roles
CREATE OR ALTER PROCEDURE PRDB_Insertar_Rol
  @ID_Rol INT,
  @nombre_rol NVARCHAR(30)
AS
BEGIN
  INSERT INTO Roles (ID_Rol, nombre_rol)
  VALUES (@ID_Rol, @nombre_rol);
END;
GO

-- Procedimiento para insertar en Artistas
CREATE OR ALTER PROCEDURE PRDB_Insertar_Artista
  @ID_artista INT,
  @nombre_artístico NVARCHAR(50),
  @nombre_real NVARCHAR(30),
  @apellido_real NVARCHAR(30),
  @nacionalidad NVARCHAR(30),
  @biografía NVARCHAR(MAX)
AS
BEGIN
  INSERT INTO Artistas (ID_artista, nombre_artístico, nombre_real, apellido_real, nacionalidad, biografía)
  VALUES (@ID_artista, @nombre_artístico, @nombre_real, @apellido_real, @nacionalidad, @biografía);
END;
GO

-- Procedimiento para insertar en Canciones
CREATE OR ALTER PROCEDURE PRDB_Insertar_Cancion
  @ID_cancion INT,
  @Titulo NVARCHAR(100),
  @Duracion TIME,
  @ID_album INT
AS
BEGIN
  INSERT INTO Canciones (ID_cancion, Titulo, Duracion, ID_album)
  VALUES (@ID_cancion, @Titulo, @Duracion, @ID_album);
END;
GO

-- Procedimiento para insertar en Albumes
CREATE OR ALTER PROCEDURE PRDB_Insertar_Album
  @ID_album INT,
  @Titulo NVARCHAR(100),
  @Fecha_lanzamiento DATE,
  @Descripcion NVARCHAR(300)
AS
BEGIN
  INSERT INTO Albumes (ID_album, Titulo, Fecha_lanzamiento, Descripcion)
  VALUES (@ID_album, @Titulo, @Fecha_lanzamiento, @Descripcion);
END;
GO

-- Procedimiento para insertar en Podcast
CREATE OR ALTER PROCEDURE PRDB_Insertar_Podcast
  @ID_podcast INT,
  @Titulo NVARCHAR(100),
  @Descripcion NVARCHAR(300),
  @Categoria NVARCHAR(50)
AS
BEGIN
  INSERT INTO Podcast (ID_podcast, Titulo, Descripcion, Categoria)
  VALUES (@ID_podcast, @Titulo, @Descripcion, @Categoria);
END;
GO

-- Procedimiento para insertar en Episodios
CREATE OR ALTER PROCEDURE PRDB_Insertar_Episodio
  @ID_episodio INT,
  @Titulo NVARCHAR(100),
  @Fecha_lanzamiento DATE,
  @Duracion TIME,
  @ID_podcast INT
AS
BEGIN
  INSERT INTO Episodios (ID_episodio, Titulo, Fecha_lanzamiento, Duracion, ID_podcast)
  VALUES (@ID_episodio, @Titulo, @Fecha_lanzamiento, @Duracion, @ID_podcast);
END;
GO

-- Procedimiento para insertar en Suscripciones
CREATE OR ALTER PROCEDURE PRDB_Insertar_Suscripcion
  @ID_suscripcion INT,
  @Nombre NVARCHAR(30),
  @Precio DECIMAL(10,2)
AS
BEGIN
  INSERT INTO Suscripciones (ID_suscripcion, Nombre, Precio)
  VALUES (@ID_suscripcion, @Nombre, @Precio);
END;
GO

-- Procedimiento para insertar en Pago_Suscripcion
CREATE OR ALTER PROCEDURE PRDB_Insertar_Pago_Suscripcion
  @ID_usuario INT,
  @ID_suscripcion INT,
  @Fecha_pago DATE
AS
BEGIN
  INSERT INTO Pago_Suscripcion (ID_usuario, ID_suscripcion, Fecha_pago)
  VALUES (@ID_usuario, @ID_suscripcion, @Fecha_pago);
END;
GO

-- Procedimiento para insertar en Canciones_Escuchadas
CREATE OR ALTER PROCEDURE PRDB_Insertar_Canciones_Escuchadas
  @ID_usuario INT,
  @ID_cancion INT
AS
BEGIN
  INSERT INTO Canciones_Escuchadas (ID_usuario, ID_cancion)
  VALUES (@ID_usuario, @ID_cancion);
END;
GO

-- Procedimiento para insertar en Episodios_Vistos
CREATE OR ALTER PROCEDURE PRDB_Insertar_Episodios_Vistos
  @ID_usuario INT,
  @ID_episodio INT
AS
BEGIN
  INSERT INTO Episodios_Vistos (ID_usuario, ID_episodio)
  VALUES (@ID_usuario, @ID_episodio);
END;
GO

-- Procedimiento para insertar en Albumes_Guardados
CREATE OR ALTER PROCEDURE PRDB_Insertar_Albumes_Guardados
  @ID_usuario INT,
  @ID_album INT
AS
BEGIN
  INSERT INTO Albumes_Guardados (ID_usuario, ID_album)
  VALUES (@ID_usuario, @ID_album);
END;
GO

-- Procedimiento para insertar en Podcast_Guardados
CREATE OR ALTER PROCEDURE PRDB_Insertar_Podcast_Guardados
  @ID_usuario INT,
  @ID_podcast INT
AS
BEGIN
  INSERT INTO Podcast_Guardados (ID_usuario, ID_podcast)
  VALUES (@ID_usuario, @ID_podcast);
END;
GO

-- Procedimiento para insertar en Artistas_Favoritos
CREATE OR ALTER PROCEDURE PRDB_Insertar_Artistas_Favoritos
  @ID_usuario INT,
  @ID_artista INT
AS
BEGIN
  INSERT INTO Artistas_Favoritos (ID_usuario, ID_artista)
  VALUES (@ID_usuario, @ID_artista);
END;
GO

-- Procedimiento para insertar en Albumes_Compuestos
CREATE OR ALTER PROCEDURE PRDB_Insertar_Albumes_Compuestos
  @ID_artista INT,
  @ID_album INT
AS
BEGIN
  INSERT INTO Albumes_Compuestos (ID_artista, ID_album)
  VALUES (@ID_artista, @ID_album);
END;
GO

-- Procedimiento para insertar en Canciones_Compuestas
CREATE OR ALTER PROCEDURE PRDB_Insertar_Canciones_Compuestas
  @ID_cancion INT,
  @ID_artista INT
AS
BEGIN
  INSERT INTO Canciones_Compuestas (ID_cancion, ID_artista)
  VALUES (@ID_cancion, @ID_artista);
END;
GO

-- Procedimiento para insertar en Podcast_Locutados
CREATE OR ALTER PROCEDURE PRDB_Insertar_Podcast_Locutados
  @ID_podcast INT,
  @ID_artista INT
AS
BEGIN
  INSERT INTO Podcast_Locutados (ID_podcast, ID_artista)
  VALUES (@ID_podcast, @ID_artista);
END;
GO

-- Procedimiento para insertar en Episodios_Locutados
CREATE OR ALTER PROCEDURE PRDB_Insertar_Episodios_Locutados
  @ID_episodio INT,
  @ID_artista INT
AS
BEGIN
  INSERT INTO Episodios_Locutados (ID_episodio, ID_artista)
  VALUES (@ID_episodio, @ID_artista);
END;
GO

