CREATE TABLE [dbo].[Aerolineas] (
    [IDAerolinea] BIGINT        IDENTITY (1, 1) NOT NULL,
    [Nombre]      VARCHAR (50)  NOT NULL,
    [Descripcion] VARCHAR (100) NULL,
    [Codigo]      VARCHAR (50)  NOT NULL,
    [Estado]      BIT           DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([IDAerolinea] ASC),
    UNIQUE NONCLUSTERED ([Codigo] ASC)
);

