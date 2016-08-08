CREATE TABLE [dbo].[Itinerarios] (
    [IDItinerario]      BIGINT   IDENTITY (1, 1) NOT NULL,
    [Estado]            BIT      NOT NULL,
    [HoraRealDeSalida]  DATETIME NOT NULL,
    [HoraRealDeLlegada] DATETIME NOT NULL,
    [IDVuelo]           BIGINT   NOT NULL,
    PRIMARY KEY CLUSTERED ([IDItinerario] ASC),
    FOREIGN KEY ([IDVuelo]) REFERENCES [dbo].[Vuelos] ([IDVuelo])
);

