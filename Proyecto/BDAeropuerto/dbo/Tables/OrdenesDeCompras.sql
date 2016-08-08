CREATE TABLE [dbo].[OrdenesDeCompras] (
    [IDOrdenDeCompra] BIGINT       IDENTITY (1, 1) NOT NULL,
    [FechaPago]       DATETIME     NOT NULL,
    [NumeroTarjeta]   VARCHAR (20) NOT NULL,
    [Nombre]          VARCHAR (20) NOT NULL,
    [PrimerApellido]  VARCHAR (30) NOT NULL,
    [SegundoApellido] VARCHAR (30) NOT NULL,
    [Total]           DECIMAL (18) NOT NULL,
    PRIMARY KEY CLUSTERED ([IDOrdenDeCompra] ASC)
);

