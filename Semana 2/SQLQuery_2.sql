Use AppRecetas
go
INSERT into UnidadesMedida (IDUnidadMedida, Nombre)
Values
(1, 'Gramos'),
(2, 'CC'),
(3, 'Cucharada'),
(4, 'Unidad'),
(5, 'Taza'),
(6, 'Pizca')
GO
Insert into Platos(IDPlato, Nombre, Descripcion, TiempoPreparacion, Calorias, Dificultad)
VALUES
(1, 'Latte', 'Cafe con leche', 4, 30, 0.5),
(2, 'Carne encebolalda', 'Carne con cebollas', 30, 500, 2.5)
go
INSERT into Ingredientes (IDIngrediente, Nombre, EsVegano, EsVegetariano, EsCeliaco)
Values (1, 'Cafe', 1, 1, 1)
go
INSERT into Ingredientes (IDIngrediente, Nombre, EsCeliaco)
Values (2, 'Leche', 1)
go
INSERT into Ingredientes (IDIngrediente, Nombre, EsVegano, EsVegetariano, EsCeliaco)
Values (3, 'Carne', 0, 0, 1)
go
INSERT into Ingredientes (IDIngrediente, Nombre, EsVegano, EsVegetariano, EsCeliaco)
Values (4, 'Cebolla', 1, 1, 1)
GO
INSERT Into Recetas (IDPlato, IDIngrediente, Cantidad, IDUnidadMedida) VALUES
(1, 1, 200, 1),
(1, 2, 200, 1),
(2, 3, 2, 4),
(2, 4, 2, 4)

-- Update Recetas Set Cantidad = 3
-- Esto cambia TODAS las cantidades de todas las recetas, no hacer
-- Delete from Recetas
-- Esto borra todas las recetas, tampoco usar esto
Update Recetas Set Cantidad = 3 Where IDPlato = 2 And IDIngrediente = 4
Delete from Recetas Where IDPlato = 1

Select * FROM Ingredientes
Select * FROM Platos
Select * FROM Recetas
Select * FROM UnidadesMedida
