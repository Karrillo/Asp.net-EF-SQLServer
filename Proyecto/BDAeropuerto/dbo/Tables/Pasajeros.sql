CREATE TABLE [dbo].[Pasajeros] (
    [IDPasajero]      BIGINT       IDENTITY (1, 1) NOT NULL,
    [Nombre]          VARCHAR (20) NOT NULL,
    [PrimerApellido]  VARCHAR (30) NOT NULL,
    [SegundoApellido] VARCHAR (30) NOT NULL,
    [Telefono]        VARCHAR (9)  NOT NULL,
    [Pais]            VARCHAR (20) NOT NULL,
    [NumeroPasaporte] VARCHAR (11) NOT NULL,
    PRIMARY KEY CLUSTERED ([IDPasajero] ASC),
    CONSTRAINT [ChkPasajeroNum] CHECK ([Telefono] like '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    CONSTRAINT [ChkPasajeroPass] CHECK ([NumeroPasaporte] like '[0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    UNIQUE NONCLUSTERED ([NumeroPasaporte] ASC)
);

