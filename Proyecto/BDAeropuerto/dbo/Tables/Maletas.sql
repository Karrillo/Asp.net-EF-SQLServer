CREATE TABLE [dbo].[Maletas] (
    [IDMaleta]              BIGINT       IDENTITY (1, 1) NOT NULL,
    [Peso]                  DECIMAL (18) NOT NULL,
    [CodigoAsignado]        VARCHAR (50) NOT NULL,
    [Fragil]                BIT          DEFAULT ((0)) NOT NULL,
    [Extra]                 BIT          DEFAULT ((1)) NOT NULL,
    [IDAsientoDeItinerario] BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([IDMaleta] ASC),
    FOREIGN KEY ([IDAsientoDeItinerario]) REFERENCES [dbo].[AsientosDeItinerarios] ([IDAsientoDeItinerario])
);

