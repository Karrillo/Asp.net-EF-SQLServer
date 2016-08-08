CREATE TABLE [dbo].[PuertasDeAbordajes] (
    [IDPuertaDeAbordaje] BIGINT       IDENTITY (1, 1) NOT NULL,
    [Codigo]             VARCHAR (50) NOT NULL,
    [EstadoActual]       BIT          NOT NULL,
    [Terminal]           SMALLINT     NOT NULL,
    [NumeroDePuerta]     SMALLINT     NOT NULL,
    [Estado]             BIT          DEFAULT ((1)) NOT NULL,
    [IDAeropuerto]       BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([IDPuertaDeAbordaje] ASC),
    FOREIGN KEY ([IDAeropuerto]) REFERENCES [dbo].[Aeropuertos] ([IDAeropuerto]),
    UNIQUE NONCLUSTERED ([Codigo] ASC)
);

