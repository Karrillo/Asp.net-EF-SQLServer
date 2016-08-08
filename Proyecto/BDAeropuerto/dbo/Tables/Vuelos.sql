CREATE TABLE [dbo].[Vuelos] (
    [IDVuelo]            BIGINT       IDENTITY (1, 1) NOT NULL,
    [Codigo]             VARCHAR (50) NOT NULL,
    [TipoDeAvion]        VARCHAR (50) NOT NULL,
    [HoraDeSalida]       DATETIME     NOT NULL,
    [HoraDeLlegada]      DATETIME     NOT NULL,
    [Estado]             BIT          DEFAULT ((1)) NOT NULL,
    [IDAerolinea]        BIGINT       NOT NULL,
    [IDPuertaDeAbordaje] BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([IDVuelo] ASC),
    FOREIGN KEY ([IDAerolinea]) REFERENCES [dbo].[Aerolineas] ([IDAerolinea]),
    FOREIGN KEY ([IDPuertaDeAbordaje]) REFERENCES [dbo].[PuertasDeAbordajes] ([IDPuertaDeAbordaje]),
    UNIQUE NONCLUSTERED ([Codigo] ASC)
);

