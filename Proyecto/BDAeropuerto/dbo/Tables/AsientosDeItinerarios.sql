CREATE TABLE [dbo].[AsientosDeItinerarios] (
    [IDAsientoDeItinerario] BIGINT       IDENTITY (1, 1) NOT NULL,
    [Numero]                SMALLINT     NOT NULL,
    [TipoDeAsiento]         VARCHAR (15) NOT NULL,
    [Precio]                DECIMAL (18) NOT NULL,
    [Fila]                  CHAR (1)     NOT NULL,
    [MaximodeMaletasGratis] SMALLINT     DEFAULT ((1)) NOT NULL,
    [IDOrdenDeCompra]       BIGINT       NOT NULL,
    [IDItinerario]          BIGINT       NOT NULL,
    [IDPasajero]            BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([IDAsientoDeItinerario] ASC),
    FOREIGN KEY ([IDItinerario]) REFERENCES [dbo].[Itinerarios] ([IDItinerario]),
    FOREIGN KEY ([IDOrdenDeCompra]) REFERENCES [dbo].[OrdenesDeCompras] ([IDOrdenDeCompra]),
    FOREIGN KEY ([IDPasajero]) REFERENCES [dbo].[Pasajeros] ([IDPasajero])
);

