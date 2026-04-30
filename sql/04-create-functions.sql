- ====================================================================================
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
-- SECCIÓN: Creación de 5 funciones
-- ====================================================================================

CREATE FUNCTION TOTAL_CANCIONES_ESCUCHADAS_POR_USUARIO_FN (@ID_USUARIO INT)
RETURNS INT
AS
BEGIN
    DECLARE @TOTAL INT;

    SELECT @TOTAL = COUNT(*) 
    FROM CANCIONES_ESCUCHADAS
    WHERE ID_USUARIO = @ID_USUARIO;

    RETURN @TOTAL;
END;
GO

CREATE FUNCTION DURACION_TOTAL_ALBUM_FN (@ID_ALBUM INT)
RETURNS TIME
AS
BEGIN
    DECLARE @DURACION_TOTAL TIME;

    SELECT @DURACION_TOTAL = CAST(DATEADD(SECOND, SUM(DATEDIFF(SECOND, 0, DURACION)), 0) AS TIME)
    FROM CANCIONES
    WHERE ID_ALBUM = @ID_ALBUM;

    RETURN @DURACION_TOTAL;
END;
GO

CREATE FUNCTION EPISODIOS_VISTOS_POR_USUARIO_EN_PODCAST_FN (
    @ID_USUARIO INT,
    @ID_PODCAST INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TOTAL INT;

    SELECT @TOTAL = COUNT(*)
    FROM EPISODIOS_VISTOS EV
    JOIN EPISODIOS E ON EV.ID_EPISODIO = E.ID_EPISODIO
    WHERE EV.ID_USUARIO = @ID_USUARIO AND E.ID_PODCAST = @ID_PODCAST;

    RETURN @TOTAL;
END;
GO

CREATE FUNCTION ARTISTA_FAVORITO_PRINCIPAL_FN (@ID_USUARIO INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @NOMBRE_ARTISTICO NVARCHAR(50);

    SELECT TOP 1 @NOMBRE_ARTISTICO = A.NOMBRE_ARTÍSTICO
    FROM ARTISTAS_FAVORITOS AF
    JOIN ARTISTAS A ON AF.ID_ARTISTA = A.ID_ARTISTA
    WHERE AF.ID_USUARIO = @ID_USUARIO
    ORDER BY A.NOMBRE_ARTÍSTICO ASC;

    RETURN @NOMBRE_ARTISTICO;
END;
GO

CREATE FUNCTION TOTAL_ALBUMES_GUARDADOS_FN (@ID_USUARIO INT)
RETURNS INT
AS
BEGIN
    DECLARE @TOTAL INT;

    SELECT @TOTAL = COUNT(*)
    FROM ALBUMES_GUARDADOS
    WHERE ID_USUARIO = @ID_USUARIO;

    RETURN @TOTAL;
END;
GO