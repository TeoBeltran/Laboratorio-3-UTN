Use MercadoLabo

Insert into Provincias(Provincia) values ('Buenos Aires')
Insert into Provincias(Provincia) values ('Catamarca')
Insert into Provincias(Provincia) values ('Chaco')
Insert into Provincias(Provincia) values ('Chubut')
Insert into Provincias(Provincia) values ('Cordoba')

Insert into Localidades(ID_Provincia, Localidad) values (1, 'La Plata')
Insert into Localidades(ID_Provincia, Localidad) values (1, 'Mar del Plata')
Insert into Localidades(ID_Provincia, Localidad) values (1, 'Bahia Blanca')
Insert into Localidades(ID_Provincia, Localidad) values (1, 'Tandil')
Insert into Localidades(ID_Provincia, Localidad) values (2, 'San Fernando del Valle de Catamarca')
Insert into Localidades(ID_Provincia, Localidad) values (3, 'Resistencia')
Insert into Localidades(ID_Provincia, Localidad) values (3, 'Barranqueras')
Insert into Localidades(ID_Provincia, Localidad) values (3, 'Fontana')
Insert into Localidades(ID_Provincia, Localidad) values (4, 'Rawson')
Insert into Localidades(ID_Provincia, Localidad) values (4, 'Puerto Madryn')
Insert into Localidades(ID_Provincia, Localidad) values (4, 'Trelew')
Insert into Localidades(ID_Provincia, Localidad) values (5, 'Cordoba')
Insert into Localidades(ID_Provincia, Localidad) values (5, 'Rio Cuarto')
Insert into Localidades(ID_Provincia, Localidad) values (5, 'Villa Maria')
Insert into Localidades(ID_Provincia, Localidad) values (5, 'San Francisco')

Insert Into Bancos(Nombre) values ('Banco de la Nacion Argentina')
Insert Into Bancos(Nombre) values ('Banco Santander Rio')
Insert Into Bancos(Nombre) values ('Banco Galicia')
Insert Into Bancos(Nombre) values ('Banco BBVA')
Insert Into Bancos(Nombre) values ('Banco Macro')
Insert Into Bancos(Nombre) values ('Banco Patagonia')
Insert Into Bancos(Nombre) values ('Banco HSBC')
Insert Into Bancos(Nombre) values ('Banco Credicoop')
Insert Into Bancos(Nombre) values ('Banco Ciudad')
Insert Into Bancos(Nombre) values ('Banco Supervielle')
Insert Into Bancos(Nombre) values ('Banco Itau')
Insert Into Bancos(Nombre) values ('Banco Comafi')
Insert Into Bancos(Nombre) values ('Banco Hipotecario')
Insert Into Bancos(Nombre) values ('Banco Columbia')
Insert Into Bancos(Nombre) values ('Banco ICBC')

Insert Into NivelesSituacionCrediticia(SituacionCrediticia) values ('Excelente')
Insert Into NivelesSituacionCrediticia(SituacionCrediticia) values ('Muy Buena')
Insert Into NivelesSituacionCrediticia(SituacionCrediticia) values ('Buena')
Insert Into NivelesSituacionCrediticia(SituacionCrediticia) values ('Regular')
Insert Into NivelesSituacionCrediticia(SituacionCrediticia) values ('Mala')
Insert Into NivelesSituacionCrediticia(SituacionCrediticia) values ('Muy Mala')
Insert Into NivelesSituacionCrediticia(SituacionCrediticia) values ('No confiable')

Insert Into MarcasTarjeta(Marca) values ('Visa')
Insert Into MarcasTarjeta(Marca) values ('Mastercard')
Insert Into MarcasTarjeta(Marca) values ('American Express')
Insert Into MarcasTarjeta(Marca) values ('Naranja')
Insert Into MarcasTarjeta(Marca) values ('Cabal')
Insert Into MarcasTarjeta(Marca) values ('Diners Club')
Insert Into MarcasTarjeta(Marca) values ('Argencard')
Insert Into MarcasTarjeta(Marca) values ('Nomis')
Insert Into MarcasTarjeta(Marca) values ('Zelev')
Insert Into MarcasTarjeta(Marca) values ('Laramerican Express')
Insert Into MarcasTarjeta(Marca) values ('KlosterCard')

SET DATEFORMAT 'YMD'
INSERT INTO Usuarios (DNI, Apellidos, Nombres, Genero, FechaNacimiento, Domicilio, ID_Localidad, ID_NivelesSituacionCrediticia, Telefono, Celular, Mail)
VALUES
    (1000, 'Garcia', 'Luis', 'F', '1987-08-25', 'Calle 123', 1, 3, '011-1234567', '155-987654', 'luis.garcia@example.com'),
    (1137, 'Martinez', 'Ana', 'M', '1995-04-12', 'Av. Principal 456', 2, 4, NULL, NULL, 'ana.martinez@example.com'),
    (1274, 'Fernandez', 'Diego', 'X', '2001-11-30', 'Ruta 7 KM 89', 3, 2, NULL, '155-789012', 'diego.fernandez@example.com'),
    (1411, 'Lopez', 'Maria', 'F', '1990-06-18', 'Calle del Sol 789', 4, 5, '0341-4567890', '154-567890', 'maria.lopez@example.com'),
    (1548, 'Rodriguez', 'Jorge', 'M', '1982-03-02', 'Calle 456', 1, 1, '011-5555555', NULL, 'jorge.rodriguez@example.com'),
    (1685, 'Perez', 'Laura', 'X', '1988-09-07', 'Av. Libertador 789', 2, 3, NULL, '155-123456', 'laura.perez@example.com'),
    (1822, 'Gomez', 'Juan', 'X', '2000-12-15', 'Ruta 9 KM 10', 3, 4, '0221-1111111', NULL, 'juan.gomez@example.com'),
    (1959, 'Hernandez', 'Carolina', 'F', '1993-07-22', 'Calle 789', 4, 2, NULL, '154-999999', 'carolina.hernandez@yahoo.com'),
    (2096, 'Diaz', 'Andres', 'M', '1984-01-08', 'Calle 123', 1, 5, '011-2222222', NULL, 'andres.diaz@utn.edu.ar'),
    (2233, 'Torres', 'Sofia', 'F', '1997-06-28', 'Av. Principal 456', 2, 1, NULL, '155-444444', 'sofia.torres@gmail.com'),
    (2369, 'Ramirez', 'Daniel', 'M', '2002-03-17', 'Ruta 7 KM 89', 3, 3, '0221-3333333', NULL, 'daniel.ramirez@google.com'),
    (2506, 'Herrera', 'Valentina', 'F', '1989-10-11', 'Calle del Sol 789', 4, 4, NULL, '154-777777', 'valentina.herrera@example.com'),
    (2643, 'Fernandez', 'Gustavo', 'M', '1986-12-03', 'Calle 456', 1, 2, '011-8888888', '155-666666', 'gustavo.fernandez@example.com'),
    (2779, 'Chavez', 'Camila', 'F', '1994-05-09', 'Av. Libertador 789', 2, 5, NULL, '154-222222', 'camila.chavez@example.com'),
    (2916, 'Sanchez', 'Mariano', 'M', '2003-09-20', 'Ruta 9 KM 10', 3, 1, '0221-9999999', NULL, 'mariano.sanchez@example.com'),
    (3053, 'Gonzalez', 'Paula', 'F', '1991-08-16', 'Calle 789', 4, 3, NULL, '155-555555', 'paula.gonzalez@ibm.com'),
    (3189, 'Lopez', 'Alejandro', 'M', '1983-07-14', 'Calle 123', 1, 4, '011-7777777', NULL, 'alejandro.lopez@example.com'),
    (3326, 'Martinez', 'Lucia', 'F', '1998-04-06', 'Av. Principal 456', 2, 2, NULL, '154-111111', 'lucia.martinez@example.com'),
    (3463, 'Diaz', 'Patricio', 'X', '2000-11-25', 'Ruta 7 KM 89', 3, 5, NULL, NULL, 'patricio.diaz@angel.org'),
    (3599, 'Gomez', 'Bianca', 'F', '1992-06-30', 'Calle del Sol 789', 5, 1, NULL, '155-333333', 'bianca.gomez@example.com');

Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('ABEJA.CAFE.TENIS', 1, '2020-01-01', 1000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('GALGO.AGUA.ROBOT', 2, '2020-01-15', 500)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('CABALLO.CASA.TELEFONO', 3, '2020-02-01', 2000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('GATO.ATUN.LATA', 4, '2020-02-15', 3000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('PERRO.CARNE.TECLADO', 5, '2020-03-01', 4000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('CRUCERO.MIEL.FUEGO', 6, '2020-03-15', 5000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('TORTUGA.CAFE.CANAPE', 7, '2021-04-01', 6000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('SIESTA.DRAGON.CARAMELO', 8, '2021-04-15', 47000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('LUNA.SOL.AGUA', 9, '2021-04-01', 6000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('ROJO.FUTBOL.PELOTA', 10, '2022-01-15', 47000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('TENIS.RAQUETA.DEPORTE', 11, '2020-03-18', 555500)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('CARRO.TREBOL.ASADO', 12, '2023-04-01', 0)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('PASTO.JUEGO.FUEGO', 13, '2021-03-25', 147000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('HUMO.CARAMELO.DATO', 14, '2021-04-11', 336000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('VINO.CASCO.PERA', 15, '2020-12-01', 247000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('MOTO.VELA.TRINEO', 16, '2020-06-25', 0)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('MULETA.ARCO.PINO', 17, '2022-11-11', 0)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('JUGO.KIWI.FRENO', 18, '2022-01-22', 34000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('TALCO.JABON.AGUA', 19, '2020-07-08', 55000)
Insert Into Billeteras(Alias, ID_Usuario, FechaCreacion, Saldo) values ('GATO.PELO.DIENTE', 20, '2021-01-10', 747000)

Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10001, 1, 1, '1234567890123456', '2020-01-01', '2022-12-31', '123')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10002, 3, 2, '2345678901234567', '2020-01-15', '2024-11-30', '234')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10003, 4, 3, '3456789012345678', '2020-02-01', '2023-10-30', '345')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10004, 4, 1, '4567890123456789', '2020-02-15', '2026-01-01', '456')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10005, 1, 2, '5678901234567890', '2020-03-01', '2028-12-01', '567')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10006, 4, 3, '6789012345678901', '2020-03-15', '2030-05-05', '678')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10007, 5, 4, '7890123456789012', '2021-04-01', '2025-06-30', '789')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10008, 1, 2, '8901234567890123', '2021-04-15', '2024-12-31', '890')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10009, 1, 1, '9012345678901234', '2021-04-01', '2025-12-31', '901')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10010, 9, 3, '0123456789012345', '2022-01-15', '2024-12-31', '012')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10011, 9, 7, '1234544490123456', '2020-03-18', '2023-12-31', '123')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10012, 8, 6, '2388878901234567', '2023-04-01', '2024-12-31', '234')
