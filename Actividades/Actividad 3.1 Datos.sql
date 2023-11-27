-- 3.1 Datos Prueba

Use SUBE
Go
INSERT INTO Usuario (Apellido, Nombre, DNI, PrimeraTarjeta, SaldoUltimaTarjeta, CantidadViajes, Domicilio, Edad, Estado)
VALUES 
('Gonzalez', 'Maria', '12345678', '2023-01-15', 500.00, 7, 'Calle Principal 123', 30, 1),
('Lopez', 'Juan', '98765432', '2023-02-20', 300.00, 7, 'Avenida Central 456', 25, 1),
('Martinez', 'Ana', '55556666', '2023-03-10', 1000.00, 7, 'Calle Secundaria 789', 40, 0),
('Perez', 'Carlos', '77778888', '2023-04-05', 750.00, 8, 'Avenida Norte 1010', 35, 1),
('Rodriguez', 'Luis', '11112222', '2023-05-12', 200.00, 6, 'Calle Sur 1313', 22, 1);

Go
INSERT INTO Tarjeta (ID_Usuario, FechaAlta, Saldo, Estado)
VALUES 
(1, '2023-01-20', 200.00, 1),
(2, '2023-02-25', 100.00, 1),
(3, '2023-03-15', 500.00, 1),
(4, '2023-04-10', 300.00, 1),
(5, '2023-05-17', 50.00, 1);

Go
INSERT INTO LineaColectivo (Nombre, Domicilio)
VALUES 
('Linea 1', 'Calle Principal 100'),
('Linea 2', 'Avenida Central 200'),
('Linea 3', 'Calle Secundaria 300'),
('Linea 4', 'Avenida Norte 400'),
('Linea 5', 'Calle Sur 500');

Go
INSERT INTO Viajes (FechaHora, NumColectivo, LineaColectivo, ID_Tarjeta, Importe, ID_Usuario)
VALUES 
('2023-06-01 08:00:00', 123, 1, 1, 20.00, 1),
('2023-06-02 10:00:00', 456, 2, 1, 15.00, 1),

('2023-06-01 08:00:00', 123, 1, 2, 20.00, 2),
('2023-06-02 10:00:00', 456, 2, 2, 15.00, 2),

('2023-06-01 08:00:00', 123, 1, 3, 20.00, 3),
('2023-06-02 10:00:00', 456, 2, 3, 15.00, 3),

('2023-06-01 08:00:00', 123, 1, 4, 20.00, 4),
('2023-06-02 10:00:00', 456, 2, 4, 15.00, 4),
('2023-06-03 12:00:00', 789, 3, 4, 30.00, 4),

('2023-06-01 08:00:00', 123, 1, 5, 45.00, 5);

Go
INSERT INTO Movimientos (FechaHora, ID_Tarjeta, Importe, TipoMov)
VALUES 
('2023-06-01 08:00:00', 1, 20.00, 'D'),
('2023-06-02 10:00:00', 1, 15.00, 'D'),

('2023-06-01 08:00:00', 2, 20.00, 'D'),
('2023-06-02 10:00:00', 2, 15.00, 'D'),
('2023-06-07 18:00:00', 2, 37.00, 'C'),

('2023-06-01 08:00:00', 3, 20.00, 'D'),
('2023-06-02 10:00:00', 3, 15.00, 'D'),

('2023-06-01 08:00:00', 4, 20.00, 'D'),
('2023-06-02 10:00:00', 4, 15.00, 'D'),
('2023-06-03 12:00:00', 4, 30.00, 'D'),
('2023-06-09 15:45:00', 4, 80.00, 'C'),

('2023-06-01 08:00:00', 5, 45.00, 'D'),
('2023-06-01 12:00:00', 5, 90.00, 'C');