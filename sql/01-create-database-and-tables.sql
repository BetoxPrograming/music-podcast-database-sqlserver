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
-- SECCIÓN: Creación de la Base de Datos
-- ====================================================================================

CREATE DATABASE BD_Tienda_Musica_Podcast;
GO

USE BD_Tienda_Musica_Podcast;
GO

-- ------------------------------------------------------------------------------------
-- Sub-sección: Creación de Tablas
-- ------------------------------------------------------------------------------------

-- Tabla Usuarios
CREATE TABLE Usuarios (
    ID_Usuario INT NOT NULL,
    Nombre VARCHAR(30),
    Apellido VARCHAR(30),
    Correo VARCHAR(50),
    Contraseña VARCHAR(30),
    Fecha_de_Registro DATE,
    ID_Rol INT NOT NULL
);
GO

-- Tabla Roles
CREATE TABLE Roles (
    ID_Rol INT NOT NULL,
    nombre_rol NVARCHAR(30)
);
GO

-- Tabla Artistas
CREATE TABLE Artistas (
    ID_Artista INT NOT NULL,
    nombre_artístico NVARCHAR(50),
    nombre_real NVARCHAR(30),
    apellido_real NVARCHAR(30),
    nacionalidad NVARCHAR(30),
    biografía NVARCHAR(MAX)
);
GO

-- Tabla Canciones
CREATE TABLE Canciones (
    ID_cancion INT NOT NULL,
    Titulo NVARCHAR(100),
    Duracion TIME,
    ID_album INT NOT NULL
);
GO

-- Tabla Albumes
CREATE TABLE Albumes (
    ID_album INT NOT NULL,
    Titulo NVARCHAR(100),
    Fecha_lanzamiento DATE,
    Descripcion NVARCHAR(300)
);
GO

-- Tabla Podcast
CREATE TABLE Podcast (
    ID_podcast INT NOT NULL,
    Titulo NVARCHAR(100),
    Descripcion NVARCHAR(300),
    Categoria NVARCHAR(50)
);
GO

-- Tabla Episodios
CREATE TABLE Episodios (
    ID_episodio INT NOT NULL,
    Titulo NVARCHAR(100),
    Fecha_lanzamiento DATE,
    Duracion TIME,
    ID_podcast INT NOT NULL
);
GO

-- Tabla Suscripciones
CREATE TABLE Suscripciones (
    ID_suscripcion INT NOT NULL,
    Nombre NVARCHAR(30),
    Precio DECIMAL(10,2)
);
GO

-- Tabla Pago_Suscripcion
CREATE TABLE Pago_Suscripcion (
    ID_usuario INT NOT NULL,
    ID_suscripcion INT NOT NULL,
    Fecha_pago DATE
);
GO

-- Tabla Canciones_Escuchadas
CREATE TABLE Canciones_Escuchadas (
    ID_usuario INT NOT NULL,
    ID_cancion INT NOT NULL
);
GO

-- Tabla Episodios_Vistos
CREATE TABLE Episodios_Vistos (
    ID_usuario INT NOT NULL,
    ID_episodio INT NOT NULL
);
GO

-- Tabla Albumes_Guardados
CREATE TABLE Albumes_Guardados (
    ID_usuario INT NOT NULL,
    ID_album INT NOT NULL
);
GO

-- Tabla Podcast_Guardados
CREATE TABLE Podcast_Guardados (
    ID_usuario INT NOT NULL,
    ID_podcast INT NOT NULL
);
GO

-- Tabla Artistas_Favoritos
CREATE TABLE Artistas_Favoritos (
    ID_usuario INT NOT NULL,
    ID_artista INT NOT NULL
);
GO

-- Tabla Albumes_Compuestos
CREATE TABLE Albumes_Compuestos (
    ID_artista INT NOT NULL,
    ID_album INT NOT NULL
);
GO

-- Tabla Canciones_Compuestas
CREATE TABLE Canciones_Compuestas (
    ID_cancion INT NOT NULL,
    ID_artista INT NOT NULL
);
GO

-- Tabla Podcast_Locutados
CREATE TABLE Podcast_Locutados (
    ID_podcast INT NOT NULL,
    ID_artista INT NOT NULL
);
GO

-- Tabla Episodios_Locutados
CREATE TABLE Episodios_Locutados (
    ID_episodio INT NOT NULL,
    ID_artista INT NOT NULL
);
GO

-- ------------------------------------------------------------------------------------
-- Agregar las PK
-- ------------------------------------------------------------------------------------

-- PK para Usuarios
ALTER TABLE Usuarios
ADD CONSTRAINT PK_Usuarios PRIMARY KEY (ID_Usuario);
GO

-- PK para Roles
ALTER TABLE Roles
ADD CONSTRAINT PK_Roles PRIMARY KEY (ID_Rol);
GO

-- PK para Artistas
ALTER TABLE Artistas
ADD CONSTRAINT PK_Artistas PRIMARY KEY (ID_Artista);
GO

-- PK para Canciones
ALTER TABLE Canciones
ADD CONSTRAINT PK_Canciones PRIMARY KEY (ID_cancion);
GO

-- PK para Albumes
ALTER TABLE Albumes
ADD CONSTRAINT PK_Albumes PRIMARY KEY (ID_album);
GO

-- PK para Podcast
ALTER TABLE Podcast
ADD CONSTRAINT PK_Podcast PRIMARY KEY (ID_podcast);
GO

-- PK para Episodios
ALTER TABLE Episodios
ADD CONSTRAINT PK_Episodios PRIMARY KEY (ID_episodio);
GO

-- PK para Suscripciones
ALTER TABLE Suscripciones
ADD CONSTRAINT PK_Suscripciones PRIMARY KEY (ID_suscripcion);
GO

-- PK para Pago_Suscripcion
ALTER TABLE Pago_Suscripcion
ADD CONSTRAINT PK_Pago_Suscripcion PRIMARY KEY (ID_usuario, ID_suscripcion);
GO

-- PK para Canciones_Escuchadas
ALTER TABLE Canciones_Escuchadas
ADD CONSTRAINT PK_Canciones_Escuchadas PRIMARY KEY (ID_usuario, ID_cancion);
GO

-- PK para Episodios_Vistos
ALTER TABLE Episodios_Vistos
ADD CONSTRAINT PK_Episodios_Vistos PRIMARY KEY (ID_usuario, ID_episodio);
GO

-- PK para Albumes_Guardados
ALTER TABLE Albumes_Guardados
ADD CONSTRAINT PK_Albumes_Guardados PRIMARY KEY (ID_usuario, ID_album);
GO

-- PK para Podcast_Guardados
ALTER TABLE Podcast_Guardados
ADD CONSTRAINT PK_Podcast_Guardados PRIMARY KEY (ID_usuario, ID_podcast);
GO

-- PK para Artistas_Favoritos
ALTER TABLE Artistas_Favoritos
ADD CONSTRAINT PK_Artistas_Favoritos PRIMARY KEY (ID_usuario, ID_artista);
GO

-- PK para Albumes_Compuestos
ALTER TABLE Albumes_Compuestos
ADD CONSTRAINT PK_Albumes_Compuestos PRIMARY KEY (ID_artista, ID_album);
GO

-- PK para Canciones_Compuestas
ALTER TABLE Canciones_Compuestas
ADD CONSTRAINT PK_Canciones_Compuestas PRIMARY KEY (ID_cancion, ID_artista);
GO

-- PK para Podcast_Locutados
ALTER TABLE Podcast_Locutados
ADD CONSTRAINT PK_Podcast_Locutados PRIMARY KEY (ID_podcast, ID_artista);
GO

-- PK para Episodios_Locutados
ALTER TABLE Episodios_Locutados
ADD CONSTRAINT PK_Episodios_Locutados PRIMARY KEY (ID_episodio, ID_artista);
GO

-- ------------------------------------------------------------------------------------
-- Agregar las FK
-- ------------------------------------------------------------------------------------

-- FK de Usuarios → Roles
ALTER TABLE Usuarios
ADD CONSTRAINT FK_Usuarios_Roles
FOREIGN KEY (ID_Rol) REFERENCES Roles(ID_Rol);
GO

-- FK de Canciones → Albumes
ALTER TABLE Canciones
ADD CONSTRAINT FK_Canciones_Albumes
FOREIGN KEY (ID_album) REFERENCES Albumes(ID_album);
GO

-- FK de Episodios → Podcast
ALTER TABLE Episodios
ADD CONSTRAINT FK_Episodios_Podcast
FOREIGN KEY (ID_podcast) REFERENCES Podcast(ID_podcast);
GO

-- FK de Pago_Suscripcion → Usuarios
ALTER TABLE Pago_Suscripcion
ADD CONSTRAINT FK_Pago_Suscripcion_Usuario
FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID_Usuario);
GO

-- FK de Pago_Suscripcion → Suscripciones
ALTER TABLE Pago_Suscripcion
ADD CONSTRAINT FK_Pago_Suscripcion_Suscripcion
FOREIGN KEY (ID_suscripcion) REFERENCES Suscripciones(ID_suscripcion);
GO

-- FK de Canciones_Escuchadas → Usuarios
ALTER TABLE Canciones_Escuchadas
ADD CONSTRAINT FK_CancionesEscuchadas_Usuario
FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID_Usuario);
GO

-- FK de Canciones_Escuchadas → Canciones
ALTER TABLE Canciones_Escuchadas
ADD CONSTRAINT FK_CancionesEscuchadas_Cancion
FOREIGN KEY (ID_cancion) REFERENCES Canciones(ID_cancion);
GO

-- FK de Episodios_Vistos → Usuarios
ALTER TABLE Episodios_Vistos
ADD CONSTRAINT FK_EpisodiosVistos_Usuario
FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID_Usuario);
GO

-- FK de Episodios_Vistos → Episodios
ALTER TABLE Episodios_Vistos
ADD CONSTRAINT FK_EpisodiosVistos_Episodio
FOREIGN KEY (ID_episodio) REFERENCES Episodios(ID_episodio);
GO

-- FK de Albumes_Guardados → Usuarios
ALTER TABLE Albumes_Guardados
ADD CONSTRAINT FK_AlbumesGuardados_Usuario
FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID_Usuario);
GO

-- FK de Albumes_Guardados → Albumes
ALTER TABLE Albumes_Guardados
ADD CONSTRAINT FK_AlbumesGuardados_Album
FOREIGN KEY (ID_album) REFERENCES Albumes(ID_album);
GO

-- FK de Podcast_Guardados → Usuarios
ALTER TABLE Podcast_Guardados
ADD CONSTRAINT FK_PodcastGuardados_Usuario
FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID_Usuario);
GO

-- FK de Podcast_Guardados → Podcast
ALTER TABLE Podcast_Guardados
ADD CONSTRAINT FK_PodcastGuardados_Podcast
FOREIGN KEY (ID_podcast) REFERENCES Podcast(ID_podcast);
GO

-- FK de Artistas_Favoritos → Usuarios
ALTER TABLE Artistas_Favoritos
ADD CONSTRAINT FK_ArtistasFavoritos_Usuario
FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID_Usuario);
GO

-- FK de Artistas_Favoritos → Artistas
ALTER TABLE Artistas_Favoritos
ADD CONSTRAINT FK_ArtistasFavoritos_Artista
FOREIGN KEY (ID_artista) REFERENCES Artistas(ID_Artista);
GO

-- FK de Albumes_Compuestos → Artistas
ALTER TABLE Albumes_Compuestos
ADD CONSTRAINT FK_AlbumesCompuestos_Artista
FOREIGN KEY (ID_artista) REFERENCES Artistas(ID_Artista);
GO

-- FK de Albumes_Compuestos → Albumes
ALTER TABLE Albumes_Compuestos
ADD CONSTRAINT FK_AlbumesCompuestos_Album
FOREIGN KEY (ID_album) REFERENCES Albumes(ID_album);
GO

-- FK de Canciones_Compuestas → Canciones
ALTER TABLE Canciones_Compuestas
ADD CONSTRAINT FK_CancionesCompuestas_Cancion
FOREIGN KEY (ID_cancion) REFERENCES Canciones(ID_cancion);
GO

-- FK de Canciones_Compuestas → Artistas
ALTER TABLE Canciones_Compuestas
ADD CONSTRAINT FK_CancionesCompuestas_Artista
FOREIGN KEY (ID_artista) REFERENCES Artistas(ID_Artista);
GO

-- FK de Podcast_Locutados → Podcast
ALTER TABLE Podcast_Locutados
ADD CONSTRAINT FK_PodcastLocutados_Podcast
FOREIGN KEY (ID_podcast) REFERENCES Podcast(ID_podcast);
GO

-- FK de Podcast_Locutados → Artistas
ALTER TABLE Podcast_Locutados
ADD CONSTRAINT FK_PodcastLocutados_Artista
FOREIGN KEY (ID_artista) REFERENCES Artistas(ID_Artista);
GO

-- FK de Episodios_Locutados → Episodios
ALTER TABLE Episodios_Locutados
ADD CONSTRAINT FK_EpisodiosLocutados_Episodio
FOREIGN KEY (ID_episodio) REFERENCES Episodios(ID_episodio);
GO

-- FK de Episodios_Locutados → Artistas
ALTER TABLE Episodios_Locutados
ADD CONSTRAINT FK_EpisodiosLocutados_Artista
FOREIGN KEY (ID_artista) REFERENCES Artistas(ID_Artista);
GO
