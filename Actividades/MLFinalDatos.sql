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


-------------------------------------------------------------------------------------------------------------------
go
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10001, 1, 2, '8901234567895423', '2021-02-15', '2024-12-31', '190')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10001, 4, 1, '9012345673431234', '2021-05-01', '2025-12-31', '931')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10002, 9, 3, '0123456789014345', '2022-02-15', '2024-12-31', '014')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10002, 9, 7, '1234544490112456', '2020-01-18', '2023-12-31', '113')
Insert into Tarjetas (ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad) values (10002, 2, 7, '2388878901234437', '2023-02-01', '2024-12-31', '179')

-- Movimientos

-- Movimiento 1
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10001, '2023-09-01 12:00:00', 5000.00, 'D');

-- Movimiento 2
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10002, '2023-09-02 14:30:00', 7000.50, 'C');

-- Movimiento 3
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10003, '2023-09-03 09:15:00', 1200.00, 'D');

-- Movimiento 4
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10004, '2023-08-04 16:45:00', 4000.25, 'C');

-- Movimiento 5
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10005, '2023-08-05 11:30:00', 9000.75, 'D');

-- Movimiento 6
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10006, '2023-08-06 08:20:00', 55000.00, 'C');

-- Movimiento 7
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10007, '2023-08-07 15:45:00', 1500.00, 'D');

-- Movimiento 8
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10008, '2023-08-08 10:10:00', 3700.80, 'C');

-- Movimiento 9
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10009, '2023-08-09 12:30:00', 6500.25, 'D');

-- Movimiento 10
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10010, '2023-08-10 18:00:00', 800.50, 'C');

-- Movimiento 11
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10011, '2023-08-11 07:55:00', 4400.75, 'D');

-- Movimiento 12
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento, Estado)
VALUES (10012, '2023-08-12 14:15:00', 9500000.20, 'C', 0);

-- Movimiento 13
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10001, '2023-09-01 09:30:00', 12000.00, 'D');

-- Movimiento 14
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10002, '2023-08-14 17:20:00', 650.75, 'C');

-- Movimiento 15
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10003, '2023-08-15 11:45:00', 85000.00, 'D');

-- Movimiento 16
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10004, '2023-09-01 16:00:00', 4200.30, 'C');

-- Movimiento 17
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10005, '2023-09-01 08:10:00', 75000.50, 'D');

-- Movimiento 18
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10006, '2023-09-02 14:40:00', 6000.25, 'C');

-- Movimiento 19
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10007, '2023-08-19 10:05:00', 11000.00, 'D');

-- Movimiento 20
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10008, '2023-09-02 13:55:00', 48000.75, 'C');

-- Movimiento 21
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10009, '2023-08-21 07:25:00', 9000.00, 'D');

-- Movimiento 22
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10010, '2023-08-22 15:15:00', 550.30, 'C');

-- Movimiento 23
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10011, '2023-08-23 11:50:00', 7000.50, 'D');

-- Movimiento 24
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10012, '2023-08-24 16:25:00', 30005.80, 'C');

-- Movimiento 25
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10001, '2023-08-25 09:40:00', 13000.00, 'D');

-- Movimiento 26
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10002, '2023-08-26 18:30:00', 7000.75, 'C');

-- Movimiento 27
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10003, '2023-08-27 13:10:00', 95000.00, 'D');

-- Movimiento 28
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10004, '2023-08-28 07:45:00', 5000.20, 'C');

-- Movimiento 29
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10005, '2023-08-29 15:20:00', 8500.50, 'D');

-- Movimiento 30
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10006, '2023-08-30 10:00:00', 7500.75, 'C');

-- Transferencias

-- Transferencia 1: De la billetera 10001 a la billetera 10002
-- Registro en la tabla Transferencias
INSERT INTO Transferencias (ID_BilleteraOrigen, ID_BilleteraDestino, FechaHora, Importe)
VALUES (10001, 10002, '2023-08-01 14:00:00', 50000.00);

-- Movimiento en la billetera 10001 (salida)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10001, '2023-08-01 14:00:00', 50000.00, 'D');

-- Movimiento en la billetera 10002 (entrada)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10002, '2023-08-01 14:00:00', 50000.00, 'C');

-- Transferencia 2: De la billetera 10003 a la billetera 10004
-- Registro en la tabla Transferencias
INSERT INTO Transferencias (ID_BilleteraOrigen, ID_BilleteraDestino, FechaHora, Importe)
VALUES (10003, 10004, '2023-08-02 10:30:00', 750.50);

-- Movimiento en la billetera 10003 (salida)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10003, '2023-08-02 10:30:00', 750.50, 'D');

-- Movimiento en la billetera 10004 (entrada)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10004, '2023-08-02 10:30:00', 750.50, 'C');

-- Transferencia 3: De la billetera 10005 a la billetera 10006
-- Registro en la tabla Transferencias
INSERT INTO Transferencias (ID_BilleteraOrigen, ID_BilleteraDestino, FechaHora, Importe)
VALUES (10005, 10006, '2023-08-03 15:45:00', 1200.00);

-- Movimiento en la billetera 10005 (salida)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10005, '2023-08-03 15:45:00', 1200.00, 'D');

-- Movimiento en la billetera 10006 (entrada)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10006, '2023-08-03 15:45:00', 1200.00, 'C');

-- Transferencia 4: De la billetera 10007 a la billetera 10008
-- Registro en la tabla Transferencias
INSERT INTO Transferencias (ID_BilleteraOrigen, ID_BilleteraDestino, FechaHora, Importe)
VALUES (10007, 10008, '2023-08-04 11:15:00', 9000.75);

-- Movimiento en la billetera 10007 (salida)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10007, '2023-08-04 11:15:00', 9000.75, 'D');

-- Movimiento en la billetera 10008 (entrada)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10008, '2023-08-04 11:15:00', 9000.75, 'C');

-- Transferencia 5: De la billetera 10009 a la billetera 10010
-- Registro en la tabla Transferencias
INSERT INTO Transferencias (ID_BilleteraOrigen, ID_BilleteraDestino, FechaHora, Importe)
VALUES (10009, 10010, '2023-08-05 17:30:00', 65000.25);

-- Movimiento en la billetera 10009 (salida)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10009, '2023-08-05 17:30:00', 65000.25, 'D');

-- Movimiento en la billetera 10010 (entrada)
INSERT INTO Movimientos (ID_Billetera, FechaHora, Importe, TipoMovimiento)
VALUES (10010, '2023-08-05 17:30:00', 65000.25, 'C');