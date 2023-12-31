Use MercadoLabo
Go

-- 1 Apellido, nombres y fecha de nacimiento de todos los usuarios
Select Apellidos, Nombres, DATEDIFF(Year, FechaNacimiento, GETDATE()) as Edad From Usuarios
Go

-- 2 Apellido, nombres y edad de todos los usuarios
SELECT Apellidos, Nombres, 
    DATEDIFF(YEAR, FechaNacimiento, GETDATE()) - 
    CASE 
        WHEN DATEADD(YEAR, DATEDIFF(YEAR, FechaNacimiento, GETDATE()), FechaNacimiento) > GETDATE() 
        THEN 1 
        ELSE 0 
    END AS Edad
FROM Usuarios;
Go

-- 3 Apellido y nombres de aquellos colaboradores cuyo genero no sea masculino (letra 'M').
Select Apellidos, Nombres From Usuarios Where Genero <> 'M';
Go

-- 4 Todos los datos de los usuarios que hayan nacido en el primer semestre (indistintamente de que anio fue).
Select * From Usuarios Where MONTH(FechaNacimiento) <= 6;
Go

-- 5 Apellidos, nombres y DNI  de aquellos usuarios cuya situacion crediticia sea 1, 3 o 5.
Select Apellidos, Nombres, DNI From Usuarios Where ID_NivelesSituacionCrediticia in (1, 3, 5);
Go

-- 6 Todos los datos de los usuarios que hayan nacido entre los anios 1990 y 1995 (ambos inclusive) o 2000 y 2005 (ambos inclusive)
Select * From Usuarios Where Year(FechaNacimiento) BETWEEN 1990 and 1995 or Year(FechaNacimiento) BETWEEN 2000 and 2005;
Go

-- 7 Apellidos y nombres concatenados en una misma columna llamada "Apenom" y el telefono, celular y mail. Si no tiene telefono o celular modificar el valor NULL por el texto "No tiene".
SELECT CONCAT(Apellidos, ' ', Nombres) AS Apenom,
       ISNULL(Telefono, 'No tiene') AS Telefono,
       ISNULL(Celular, 'No tiene') AS Celular,
       Mail
FROM Usuarios;
Go

-- 8 Todos los datos de todos los usuarios que tengan celular pero no telefono.
Select * From Usuarios Where Celular is not null and Telefono is null;
Go

-- 9 Apellidos y nombres de los usuarios y una columna llamada Contacto. En ella debe figurar primero el celular, si el usuario no tiene celular, debe figurar el telefono y si el usuario no tiene telefono debe figurar el mail.
Select Apellidos, Nombres, COALESCE(Celular, Telefono, Mail) As Contacto From Usuarios;
Go

/* 10 Apellidos y nombres de los usuarios y una columna llamada FormaContacto. En ella debe figurar "Celular" si el usuario tiene celular, si el usuario no tiene celular, debe figurar el "Telefono" si el usuario tiene 
    telefono, de lo contrario debe figurar "Mail". */
SELECT Apellidos, Nombres,
    CASE
        WHEN Celular IS NOT NULL THEN 'Celular'
        WHEN Telefono IS NOT NULL THEN 'Telefono'
        ELSE 'Mail'
    END AS FormaContacto
FROM Usuarios;
Go

-- 11 Los ID_Localidad, sin repeticiones, de los usuarios
Select Distinct ID_Localidad From Usuarios;
Go

-- 12 Todos los datos de los usuarios que tengan en un su nombre la letra 'A' o la letra 'O'. 
Select * From Usuarios Where Nombres Like '%a%'or Nombres Like '%o%';
Go

-- 13 Todos los datos de los usuarios que tengan un mail con subdominio ".org"
Select * From Usuarios Where Mail Like '%.org';
Go

-- 14 Todos los datos de los usuarios que hayan nacido un martes
Select * From Usuarios Where DATEPART(dw, FechaNacimiento) = 3;
Go

-- 15 Todos los datos de los usuarios que no hayan nacido martes, jueves ni domingo.
Select * From Usuarios Where DATEPART(dw, FechaNacimiento) not in (1, 3, 5);
