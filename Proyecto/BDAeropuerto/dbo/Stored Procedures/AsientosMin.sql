CREATE PROCEDURE AsientosMin
 @Id bigint
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO AsientosDeVuelos([TipoDeAsiento],[Fila],[Numero],[IDVuelo]) VALUES('Business','A',1,@Id),('Business','A',2,@Id),('Business','A',3,@Id),('Business','A',4,@Id),('Business','A',5,@Id),('Business','A',6,@Id),('Business','A',7,@Id),('Business','A',8,@Id),('Business','A',9,@Id),('Business','A',10,@Id);
INSERT INTO AsientosDeVuelos([TipoDeAsiento],[Fila],[Numero],[IDVuelo]) VALUES('Business','B',11,@Id),('Business','B',12,@Id),('Business','B',13,@Id),('Business','B',14,@Id),('Business','B',15,@Id),('Business','B',16,@Id),('Business','B',17,@Id),('Business','B',18,@Id),('Business','B',19,@Id),('Business','B',20,@Id);
INSERT INTO AsientosDeVuelos([TipoDeAsiento],[Fila],[Numero],[IDVuelo]) VALUES('Turista','C',21,@Id),('Turista','C',22,@Id),('Turista','C',23,@Id),('Turista','C',24,@Id),('Turista','C',25,@Id),('Turista','C',26,@Id),('Turista','C',27,@Id),('Turista','C',28,@Id),('Turista','C',29,@Id),('Turista','C',30,@Id);
INSERT INTO AsientosDeVuelos([TipoDeAsiento],[Fila],[Numero],[IDVuelo]) VALUES('Turista','D',31,@Id),('Turista','D',32,@Id),('Turista','D',33,@Id),('Turista','D',34,@Id),('Turista','D',35,@Id),('Turista','D',36,@Id),('Turista','D',37,@Id),('Turista','D',38,@Id),('Turista','D',39,@Id),('Turista','D',40,@Id);
INSERT INTO AsientosDeVuelos([TipoDeAsiento],[Fila],[Numero],[IDVuelo]) VALUES('Turista','E',41,@Id),('Turista','E',42,@Id),('Turista','E',43,@Id),('Turista','E',44,@Id),('Turista','E',45,@Id),('Turista','E',46,@Id),('Turista','E',47,@Id),('Turista','E',48,@Id),('Turista','E',49,@Id),('Turista','E',50,@Id);

END




