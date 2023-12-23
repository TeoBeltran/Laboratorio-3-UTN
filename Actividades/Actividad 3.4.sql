--1) Realizar un trigger que al agregar un viaje:
--   Verifique que la tarjeta se encuentre activa.
--   Verifique que el saldo de la tarjeta sea suficiente para realizar el viaje.
--   Registre el viaje
--   Registre el movimiento
--   Descuente el stock de la tarjeta
Use SUBE
Go
CREATE TRIGGER trg_Agregar_Viaje ON Viajes
AFTER INSERT
AS
BEGIN
    -- Verificar si la tarjeta está activa y tiene saldo suficiente
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Tarjeta t ON i.ID_Tarjeta = t.ID_Tarjeta
        WHERE t.Estado = 1 AND t.Saldo >= i.Importe
    )
    BEGIN
        -- Registro del viaje
        INSERT INTO Viajes (FechaHora, NumColectivo, LineaColectivo, ID_Tarjeta, Importe, ID_Usuario)
        SELECT FechaHora, NumColectivo, LineaColectivo, ID_Tarjeta, Importe, ID_Usuario
        FROM inserted

        -- Registro del movimiento
        INSERT INTO Movimientos (FechaHora, ID_Tarjeta, Importe, TipoMov)
        SELECT GETDATE(), ID_Tarjeta, Importe, 'D'
        FROM inserted

        -- Actualizar el saldo de la tarjeta
        UPDATE Tarjeta
        SET Saldo = Saldo - i.Importe
        FROM inserted i
        WHERE Tarjeta.ID_Tarjeta = i.ID_Tarjeta
    END
    ELSE
    BEGIN
        -- Si no hay saldo suficiente o la tarjeta no está activa, hacer algo (puede ser un mensaje de error)
        PRINT 'La tarjeta no está activa o no tiene saldo suficiente para realizar el viaje.'
        -- Puedes ajustar esta parte según la acción que desees.
    END
END
GO


--2) Realizar un trigger que al registrar un nuevo usuario:
--   Registre el usuario
--   Registre una tarjeta a dicho usuario
CREATE TRIGGER trg_RegistrarUsuario ON Usuario
AFTER INSERT
AS
BEGIN
    -- Insertar datos en la tabla Tarjeta para asignar una nueva tarjeta al usuario registrado
    INSERT INTO Tarjeta (ID_Usuario, FechaAlta, Saldo, Estado)
    SELECT ID_Usuario, GETDATE(), 0.00, 1
    FROM inserted;
END;
GO


--3) Realizar un trigger que al registrar una nueva tarjeta:
--   Le realice baja logica a la ultima tarjeta del cliente.
--   Le asigne a la nueva tarjeta el saldo de la ultima tarjeta del cliente.
--   Registre la nueva tarjeta para el cliente (con el saldo de la vieja tarjeta, la fecha de alta de la tarjeta debera ser la del sistema).
CREATE TRIGGER trg_RegistrarNuevaTarjeta ON Tarjeta
AFTER INSERT
AS
BEGIN
    DECLARE @ID_UltimaTarjeta INT, @SaldoUltimaTarjeta DECIMAL(10, 2), @ID_NuevaTarjeta INT

    SELECT TOP 1 @ID_UltimaTarjeta = ID_Tarjeta, @SaldoUltimaTarjeta = Saldo
    FROM Tarjeta
    WHERE ID_Usuario = (SELECT ID_Usuario FROM inserted)
    ORDER BY FechaAlta DESC

    UPDATE Tarjeta
    SET Estado = 0
    WHERE ID_Tarjeta = @ID_UltimaTarjeta

    INSERT INTO Tarjeta (ID_Usuario, FechaAlta, Saldo, Estado)
    VALUES ((SELECT ID_Usuario FROM inserted), GETDATE(), @SaldoUltimaTarjeta, 1)
END;
GO


--4) Realizar un trigger que al eliminar un cliente:
--   Elimine el cliente
--   Elimine todas las tarjetas del cliente
--   Elimine todos los movimientos de sus tarjetas
--   Elimine todos los viajes de sus tarjetas
CREATE TRIGGER trg_EliminarCliente ON Usuario
AFTER DELETE
AS
BEGIN
    DECLARE @ID_Usuario INT
    SELECT @ID_Usuario = ID_Usuario FROM deleted

    DELETE FROM Tarjeta WHERE ID_Usuario = @ID_Usuario
    DELETE FROM Movimientos WHERE ID_Tarjeta IN (SELECT ID_Tarjeta FROM Tarjeta WHERE ID_Usuario = @ID_Usuario)
    DELETE FROM Viajes WHERE ID_Tarjeta IN (SELECT ID_Tarjeta FROM Tarjeta WHERE ID_Usuario = @ID_Usuario)
    DELETE FROM Usuario WHERE ID_Usuario = @ID_Usuario
END;
