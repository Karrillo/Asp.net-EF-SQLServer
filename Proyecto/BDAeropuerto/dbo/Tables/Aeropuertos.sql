CREATE TABLE [dbo].[Aeropuertos] (
    [IDAeropuerto] BIGINT       IDENTITY (1, 1) NOT NULL,
    [Cuidad]       VARCHAR (50) NOT NULL,
    [Pais]         VARCHAR (50) NOT NULL,
    [Estado]       BIT          DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([IDAeropuerto] ASC)
);

