CREATE PROCEDURE [dbo].[AsientosDisponibles]
	 @Fecha varchar(10),
	 @IDVuelos bigint
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE @IDItinerario bigint = (SELECT TOP(1)i.IDItinerario FROM AsientosDeVuelos AS av
INNER JOIN Vuelos AS v ON v.IDVuelo=av.IDVuelo 
INNER JOIN Itinerarios AS i ON v.IDVuelo=i.IDVuelo
WHERE CONVERT(varchar(10),i.HoraRealDeSalida,103) = @Fecha AND v.IDVuelo =  @IDVuelos AND v.Estado=1)

SELECT i.IDItinerario, av.Fila,av.Numero,av.TipoDeAsiento FROM AsientosDeVuelos AS av
INNER JOIN Vuelos AS v ON v.IDVuelo=av.IDVuelo 
INNER JOIN Itinerarios AS i ON v.IDVuelo=i.IDVuelo
WHERE CONVERT(varchar(10),i.HoraRealDeSalida,103) = @Fecha AND v.IDVuelo = @IDVuelos AND v.Estado=1
AND NOT EXISTS (SELECT * FROM AsientosDeItinerarios AS ai where av.Fila=ai.Fila AND av.Numero=ai.Numero AND ai.IDItinerario=@IDItinerario)
END 
