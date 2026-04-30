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
-- SECCIÓN: Creación de las vistas 
-- ====================================================================================


-- ------------------------------------------------------------------------------------
-- VISTA 1: Información de Usuarios con su Rol
-- ------------------------------------------------------------------------------------

USE BD_Tienda_Musica_Podcast;
GO

-- ------------------------------------------------------------------------------------
-- VISTA 1: Información de Usuarios con su Rol
-- ------------------------------------------------------------------------------------
CREATE VIEW VW_Usuarios_Con_Roles AS
SELECT 
    u.ID_Usuario,
    u.Nombre,
    u.Apellido,
    u.Correo,
    u.Fecha_de_Registro,
    r.nombre_rol AS Rol
FROM Usuarios u
INNER JOIN Roles r ON u.ID_Rol = r.ID_Rol;
GO

-- ------------------------------------------------------------------------------------
-- VISTA 2: Canciones con Información del Álbum y Artista
-- ------------------------------------------------------------------------------------
CREATE OR ALTER VIEW VW_Canciones_Album_Artista AS
SELECT 
    c.ID_cancion,
    c.Titulo AS Cancion,
    c.Duracion,
    a.Titulo AS Album,
    a.Fecha_lanzamiento,
    art.nombre_artístico AS Artista,
    art.nacionalidad
FROM Canciones c
INNER JOIN Albumes a ON c.ID_album = a.ID_album
INNER JOIN Canciones_Compuestas cc ON c.ID_cancion = cc.ID_cancion
INNER JOIN Artistas art ON cc.ID_artista = art.ID_Artista;
GO

-- ------------------------------------------------------------------------------------
-- VISTA 3: Episodios con Información del Podcast y Locutor
-- ------------------------------------------------------------------------------------
CREATE VIEW VW_Episodios_Podcast_Locutor AS
SELECT 
    e.ID_episodio,
    e.Titulo AS Episodio,
    e.Fecha_lanzamiento,
    e.Duracion,
    p.Titulo AS Podcast,
    p.Categoria,
    art.nombre_artístico AS Locutor,
    art.nacionalidad AS Nacionalidad_Locutor
FROM Episodios e
INNER JOIN Podcast p ON e.ID_podcast = p.ID_podcast
INNER JOIN Episodios_Locutados el ON e.ID_episodio = el.ID_episodio
INNER JOIN Artistas art ON el.ID_artista = art.ID_Artista;
GO

-- ------------------------------------------------------------------------------------
-- VISTA 4: Usuarios con sus Suscripciones Activas
-- ------------------------------------------------------------------------------------
CREATE VIEW VW_Usuarios_Suscripciones AS
SELECT 
    u.ID_Usuario,
    u.Nombre + ' ' + u.Apellido AS Nombre_Completo,
    u.Correo,
    s.Nombre AS Tipo_Suscripcion,
    s.Precio,
    ps.Fecha_pago AS Fecha_Ultimo_Pago
FROM Usuarios u
INNER JOIN Pago_Suscripcion ps ON u.ID_Usuario = ps.ID_usuario
INNER JOIN Suscripciones s ON ps.ID_suscripcion = s.ID_suscripcion;
GO

-- ------------------------------------------------------------------------------------
-- VISTA 5: Actividad de Usuarios (Canciones Escuchadas)
-- ------------------------------------------------------------------------------------
CREATE  VIEW VW_Actividad_Usuarios AS
SELECT 
    u.ID_Usuario,
    u.Nombre + ' ' + u.Apellido AS Usuario,
    c.Titulo AS Cancion_Escuchada,
    a.Titulo AS Album,
    'CANCION' AS Tipo_Contenido
FROM Usuarios u
INNER JOIN Canciones_Escuchadas ce ON u.ID_Usuario = ce.ID_usuario
INNER JOIN Canciones c ON ce.ID_cancion = c.ID_cancion
INNER JOIN Albumes a ON c.ID_album = a.ID_album;
GO
