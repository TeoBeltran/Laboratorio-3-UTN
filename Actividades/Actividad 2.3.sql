/*
Actividades

1 Listado con la cantidad de usuarios que tienen una situacion crediticia con ID menor a 3.
2 Listado con el saldo promedio de las billeteras
3 Listado con el saldo acumulado de las billeteras que hayan sido creadas luego del 15 de Enero de 2022.
4 Listado con la cantidad de tarjetas que se vencen en el anio actual y que sean del Banco HSBC.
5 Listado con el promedio de antiguedad expresado en dias de las billeteras
6 Listado con el promedio de dias que restan para el vencimiento de las tarjetas no vencidas.
7 Listado con la fecha de nacimiento de la persona mas joven en tener una billetera.
8 Listado con el total de dinero acreditado mediante movimientos.
9 Por cada cliente, apellidos, nombres, alias de la billetera y cantidad de movimientos registrados.
10 Listar los clientes que hayan registrado debitos por mas de $15000
11 Listar el total debitado discriminado por nivel de situacion crediticia.
12 Listar el nombre y apellido del usuario que haya realizado mas depositos.
13 Listar la cantidad de usuarios que hayan registrado movimientos de tipo debito.
14 Listar por cada billetera el alias y la cantidad de transferencias realizadas (la billetera es el origen de la transferencia). Si hay billeteras que no tienen 
    transferencias realizadas deben figurar en el listado contabilizando 0.
15 Listar los apellidos y nombres y el alias de billeteras de aquellos clientes que hayan movilizado mas de $40000 durante el mes de agosto de 2023.
*/

Use MercadoLabo
Go
Select * From Usuarios Where ID_NivelesSituacionCrediticia < 3;
Go
Select AVG(Saldo) As SaldoPromedio From Billeteras;
Go
Select SUM(Saldo) As SaldoAcumulado From Billeteras Where FechaCreacion > '2022-01-15'
Go
Select COUNT(*) As Cantidad From Tarjetas Where Year(FechaVencimiento) = Year(GETDATE());
Go
Select AVG(DATEDIFF(day, FechaCreacion, GETDATE())) As PromedioAntiguedad From Billeteras;
Go
Select AVG(DATEDIFF(day, GETDATE(), FechaVencimiento)) As PromFaltanteParaVencimiento From Tarjetas Where GETDATE() < FechaVencimiento;
Go
Select MIN(U.FechaNacimiento) As MenorConBilletera From Usuarios U Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario;
Go
Select MAX(FechaNacimiento) From Usuarios Inner Join Billeteras On Usuarios.ID_Usuario = Billeteras.ID_Usuario
Go
-- 8 Ejercicio Cancelado
-- Go



/*
8 Listado con el total de dinero acreditado mediante movimientos.
9 Por cada cliente, apellidos, nombres, alias de la billetera y cantidad de movimientos registrados.
10 Listar los clientes que hayan registrado debitos por mas de $15000
11 Listar el total debitado discriminado por nivel de situacion crediticia.
12 Listar el nombre y apellido del usuario que haya realizado mas depositos.
13 Listar la cantidad de usuarios que hayan registrado movimientos de tipo debito.
14 Listar por cada billetera el alias y la cantidad de transferencias realizadas (la billetera es el origen de la transferencia). Si hay billeteras que no tienen 
    transferencias realizadas deben figurar en el listado contabilizando 0.
15 Listar los apellidos y nombres y el alias de billeteras de aquellos clientes que hayan movilizado mas de $40000 durante el mes de agosto de 2023.
*/