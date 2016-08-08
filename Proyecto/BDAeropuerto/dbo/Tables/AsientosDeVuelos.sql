CREATE TABLE [dbo].[AsientosDeVuelos] (
    [IDAsientoDeVuelo] BIGINT       IDENTITY (1, 1) NOT NULL,
    [TipoDeAsiento]    VARCHAR (15) NOT NULL,
    [Fila]             CHAR (1)     NOT NULL,
    [Numero]           SMALLINT     NOT NULL,
    [IDVuelo]          BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([IDAsientoDeVuelo] ASC),
    FOREIGN KEY ([IDVuelo]) REFERENCES [dbo].[Vuelos] ([IDVuelo])
);

