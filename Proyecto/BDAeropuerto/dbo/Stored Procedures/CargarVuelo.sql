CREATE PROCEDURE [dbo].[CargarVuelo]
	@IdVuelos bigint
AS
BEGIN
	SET NOCOUNT ON;
SELECT a.Pais,a.Cuidad,p.Terminal,p.NumeroDePuerta,a.IDAeropuerto,p.IDPuertaDeAbordaje  FROM Vuelos as v INNER JOIN PuertasDeAbordajes as p on v.IDPuertaDeAbordaje=p.IDPuertaDeAbordaje
INNER JOIN Aeropuertos as a on p.IDAeropuerto=a.IDAeropuerto WHERE v.Estado=1 and v.IDVuelo=@IdVuelos
END
