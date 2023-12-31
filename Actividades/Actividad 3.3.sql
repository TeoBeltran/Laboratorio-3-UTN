--Parte 3 - Transacciones

--  Rehacer los procedimientos almacenados B-D para que se ejecuten dentro de una transaccion.


--B) Realizar un procedimiento almacenado llamado sp_Agregar_Tarjeta que de de alta una tarjeta. El procedimiento solo debe recibir el DNI del usuario.
--   Como el sistema solo permite una tarjeta activa por usuario, el procedimiento debe:
--   Dar de baja la ultima tarjeta del usuario (si corresponde).
--   Dar de alta la nueva tarjeta del usuario
--   Traspasar el saldo de la vieja tarjeta a la nueva tarjeta (si corresponde)
Use SUBE
Go
Create Procedure sp_Agregar_Tarjeta2
    @DNI varchar(20)
As
Begin
    BEGIN TRY
        BEGIN TRANSACTION;
            Declare @ID_UltimaTarjeta int, @SaldoUltimaTarjeta decimal(10, 2)

            Select Top 1 @ID_UltimaTarjeta = ID_Tarjeta, @SaldoUltimaTarjeta = Saldo From Tarjeta
            Where ID_Usuario = (Select ID_Usuario From Usuario Where DNI = @DNI)
            Order By FechaAlta DESC

            If @ID_UltimaTarjeta Is Not Null
            Begin
                Update Tarjeta Set Estado = 0 Where ID_Tarjeta = @ID_UltimaTarjeta

                Declare @ID_NuevaTarjeta Int
                Insert Into Tarjeta (ID_Usuario, FechaAlta, Saldo, Estado)
                Values ((Select ID_Usuario From Usuario Where DNI = @DNI), GETDATE(), 0.00, 1)
                Set @ID_NuevaTarjeta = SCOPE_IDENTITY()

                If @SaldoUltimaTarjeta > 0
                Begin
                    Update Tarjeta Set Saldo = Saldo + @SaldoUltimaTarjeta
                    Where ID_Tarjeta = @ID_NuevaTarjeta
                End
            End
            Else
            Begin
                Insert Into Tarjeta (ID_Usuario, FechaAlta, Saldo, Estado)
                Values ((Select ID_Usuario From Usuario Where DNI = @DNI), GETDATE(), 0.00, 1)
            End
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH;
End
Go
Exec sp_Agregar_Tarjeta2 '101099999';
Go


--C) Realizar un procedimiento almacenado llamado sp_Agregar_Viaje que registre un viaje a una tarjeta en particular. 
--   El procedimiento debe recibir: Numero de tarjeta, importe del viaje, nro de interno y nro de linea.
--   El procedimiento debera:
--   Descontar el saldo
--   Registrar el viaje
--   Registrar el movimiento de debito
--   NOTA: Una tarjeta no puede tener una deuda que supere los $2000.
Use SUBE
Go
Create Procedure sp_Agregar_Viaje2
    @NumeroTarjeta int,
    @ImporteViaje decimal(10, 2),
    @NumeroInterno int,
    @NumeroLinea int
As
Begin
    BEGIN TRY
        BEGIN TRANSACTION
            Declare @SaldoActual decimal(10, 2)

            Select @SaldoActual = Saldo From Tarjeta
            Where ID_Tarjeta = @NumeroTarjeta

            If @SaldoActual >= @ImporteViaje And @SaldoActual - @ImporteViaje >= -2000
            Begin
                Update Tarjeta Set Saldo = Saldo - @ImporteViaje 
                Where ID_Tarjeta = @NumeroTarjeta

                Insert Into Viajes (FechaHora, NumColectivo, LineaColectivo, ID_Tarjeta, Importe, ID_Usuario)
                Values (GETDATE(), @NumeroInterno, @NumeroLinea, @NumeroTarjeta, @ImporteViaje, (Select ID_Usuario From Tarjeta Where ID_Tarjeta = @NumeroTarjeta))

                Insert Into Movimientos (FechaHora, ID_Tarjeta, Importe, TipoMov)
                Values (GETDATE(), @NumeroTarjeta, @ImporteViaje, 'D')
            End
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
    END CATCH
End
Go
Exec sp_Agregar_Viaje2 8, 400.00, 123, 2;
Go


--D) Realizar un procedimiento almacenado llamado sp_Agregar_Saldo que registre un movimiento de credito a una tarjeta en particular. 
--   El procedimiento debe recibir: El numero de tarjeta y el importe a recargar. Modificar el saldo de la tarjeta.
Use SUBE
Go
Create Procedure sp_Agregar_Saldo
    @NumeroTarjeta int,
    @ImporteRecarga decimal(10, 2)
As
Begin
    BEGIN TRY
        BEGIN TRANSACTION
            Insert Into Movimientos (FechaHora, ID_Tarjeta, Importe, TipoMov)
            Values (GETDATE(), @NumeroTarjeta, @ImporteRecarga, 'C')
            Update Tarjeta Set Saldo = Saldo + @ImporteRecarga Where ID_Tarjeta = @NumeroTarjeta
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
    END CATCH
End
Go