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
-- SECCIÓN: Creación de Triggers
-- ====================================================================================


-- ------------------------------------------------------------------------------------
-- Trigger 1: Registrar Automaticamente	la fecha de pago de la suscripcion
USE BD_Tienda_Musica_Podcast;
GO

CREATE TRIGGER TR_PagoSuscripcion_Fecha
ON Pago_suscripcion
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ps
    SET Fecha_pago = GETDATE()
    FROM Pago_suscripcion ps
    INNER JOIN inserted i 
        ON ps.ID_usuario = i.ID_usuario 
        AND ps.ID_suscripcion = i.ID_suscripcion
    WHERE i.Fecha_pago IS NULL;
END;
GO
 ----Trigger 2: Eliminar las canciones y registros relacionados a un album antes de eliminarlos y evitar datos huerfanos

CREATE TRIGGER TR_EliminarAlbum_Completo
ON Albumes
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Canciones
    WHERE ID_album IN (SELECT ID_album FROM deleted);

    DELETE FROM Albumes_guardados
    WHERE ID_album IN (SELECT ID_album FROM deleted);

    DELETE FROM Albumes_compuestos
    WHERE ID_album IN (SELECT ID_album FROM deleted);

    DELETE FROM Albumes
    WHERE ID_album IN (SELECT ID_album FROM deleted);
END;
GO

 ----Trigger 2: Evitar insertar canciones duplicadas en un mismo album.

CREATE TRIGGER TR_CancionesDuplicadas
ON Canciones
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Canciones c
        JOIN inserted i ON c.ID_album = i.ID_album
        AND c.Titulo = i.Titulo
        GROUP BY c.ID_album, c.Titulo
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR ('No se puede insertar una canción duplicada en el mismo álbum.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO