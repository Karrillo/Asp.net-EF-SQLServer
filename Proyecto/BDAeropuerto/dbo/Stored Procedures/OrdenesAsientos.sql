
CREATE PROCEDURE OrdenesAsientos
	@FechaPago datetime,@NumeroTarjeta varchar(20),@Nombre varchar(20),@PrimerApellido varchar(20),
	@SegundoApellido varchar(20),@Total decimal(18, 0),

	@Numero smallint,@TipoDeAsiento varchar(15),@Precio decimal(18, 0),@Fila char(1),
	@IDItinerario bigint,@IDPasajero bigint
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO OrdenesDeCompras(OrdenesDeCompras.FechaPago,OrdenesDeCompras.NumeroTarjeta,
	OrdenesDeCompras.Nombre,OrdenesDeCompras.PrimerApellido,OrdenesDeCompras.SegundoApellido,.
	OrdenesDeCompras.Total) VALUES(@FechaPago,@NumeroTarjeta,@Nombre,@PrimerApellido,@SegundoApellido,@Total) 

	INSERT INTO AsientosDeItinerarios(AsientosDeItinerarios.Numero,AsientosDeItinerarios.TipoDeAsiento,
	AsientosDeItinerarios.Precio,AsientosDeItinerarios.Fila,AsientosDeItinerarios.MaximodeMaletasGratis,
	AsientosDeItinerarios.IDOrdenDeCompra,AsientosDeItinerarios.IDItinerario,AsientosDeItinerarios.IDPasajero) 
	VALUES(@Numero,@TipoDeAsiento,@Precio,@Fila,1,SCOPE_IDENTITY(),@IDItinerario,@IDPasajero)
END
