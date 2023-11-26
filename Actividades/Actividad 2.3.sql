Use MercadoLabo
Go

-- 1 Listado con la cantidad de usuarios que tienen una situacion crediticia con ID menor a 3.
Select * From Usuarios Where ID_NivelesSituacionCrediticia < 3;
Go

-- 2 Listado con el saldo promedio de las billeteras
Select AVG(Saldo) As SaldoPromedio From Billeteras;
Go

-- 3 Listado con el saldo acumulado de las billeteras que hayan sido creadas luego del 15 de Enero de 2022.
Select SUM(Saldo) As SaldoAcumulado From Billeteras Where FechaCreacion > '2022-01-15'
Go

-- 4 Listado con la cantidad de tarjetas que se vencen en el anio actual.
Select COUNT(*) As Cantidad From Tarjetas Where Year(FechaVencimiento) = Year(GETDATE());
Go

-- 5 Listado con el promedio de antiguedad expresado en dias de las billeteras
Select AVG(DATEDIFF(day, FechaCreacion, GETDATE())) As PromedioAntiguedad From Billeteras;
Go

-- 6 Listado con el promedio de dias que restan para el vencimiento de las tarjetas no vencidas.
Select AVG(DATEDIFF(day, GETDATE(), FechaVencimiento)) As PromParaVencimiento From Tarjetas Where GETDATE() < FechaVencimiento;
Go

-- 7 Listado con la fecha de nacimiento de la persona mas joven en tener una billetera.
Select MAX(FechaNacimiento) From Usuarios Inner Join Billeteras On Usuarios.ID_Usuario = Billeteras.ID_Usuario
Go

-- 8 Listado con el total de dinero acreditado mediante movimientos.
Select SUM(Importe) As TotalAcreditado From Movimientos;
Go

-- 9 Por cada usuario su apellidos, nombres, alias de la billetera y cantidad de movimientos registrados.
Select U.Apellidos, U.nombres, B.Alias, COUNT(M.ID_Billetera) As CanMovim From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Left Join Movimientos M On B.ID_Billetera = M.ID_Billetera 
Group By U.Apellidos, U.nombres, B.Alias;
Go

-- 10 Listar los usuario que hayan registrado debitos por mas de $15000
Select Distinct U.Apellidos, U.Nombres From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Movimientos M On B.ID_Billetera = M.ID_Billetera
Where M.TipoMovimiento = 'D' And M.Importe > 15000;
Go

-- 11 Listar el total debitado discriminado por nivel de situacion crediticia.
Select NSC.SituacionCrediticia, SUM(M.Importe) AS TotalDebitado From Usuarios U
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Movimientos M On B.ID_Billetera = M.ID_Billetera Inner Join NivelesSituacionCrediticia NSC On U.ID_NivelesSituacionCrediticia = NSC.ID_NivelesSituacionCrediticia 
Where M.TipoMovimiento = 'D' Group By NSC.SituacionCrediticia;
Go

-- 12 Listar el nombre y apellido del usuario que haya realizado mas depositos.
Select Top 1 U.Apellidos, U.Nombres, B.ID_Billetera, COUNT(*) AS CantidadMovimientosC From Usuarios U 
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Movimientos M On B.ID_Billetera = M.ID_Billetera
Where M.TipoMovimiento = 'C'
Group By U.Apellidos, U.Nombres, B.ID_Billetera
Order By COUNT(*) DESC
Go

-- 13 Listar la cantidad de usuarios que hayan registrado movimientos de tipo debito.
SELECT COUNT(DISTINCT U.ID_Usuario) AS CantidadUsuariosDebito From Usuarios U
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Movimientos M On B.ID_Billetera = M.ID_Billetera
Where M.TipoMovimiento = 'D';
Go

/* 14 Listar por cada billetera el alias y la cantidad de transferencias realizadas (la billetera es el origen de la transferencia). Si hay billeteras que no tienen 
    transferencias realizadas deben figurar en el listado contabilizando 0. */
Select B.Alias, COALESCE(COUNT(T.ID_BilleteraOrigen), 0) As CantTransfer From Billeteras B Left Join Transferencias T On B.ID_Billetera = T.ID_BilleteraOrigen Group By B.ID_Billetera, B.Alias;
Go

-- 15 Listar los apellidos y nombres y el alias de billeteras de aquellos usuario que hayan movilizado mas de $40000 durante el mes de agosto de 2023.
Select U.Apellidos, U.Nombres, B.Alias From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario Inner Join Movimientos M On B.ID_Billetera = M.ID_Billetera
Where M.FechaHora >= '2023-08-01' AND M.FechaHora < '2023-09-01' Group By U.Apellidos, U.Nombres, B.Alias Having SUM(M.Importe) > 40000;

