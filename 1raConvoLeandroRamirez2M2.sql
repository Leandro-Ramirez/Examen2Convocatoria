Create Database CineMark
Go

Restore DataBase CineMark From Disk='D:\CineMark.bak'
With Replace

Use CineMark
Go

------------------
-- Crear Tablas --
------------------

Create Table Pelicula
(
Id_Pelicula Int Primary Key Identity(1,1) Not Null,
NombreP Nvarchar (20) Not Null,
Duracion Int Not Null,
Costo Float Not Null,
EstadoPe Bit Default 1 Not Null
)
Go
Create Table Cliente
(
Id_Cliente Int Primary Key Identity(1,1) Not Null,
Estudiante Bit Default 0 Not Null
)
Go
Create Table Salas
(
Id_Salas Int Primary Key Identity(1,1) Not Null,
Numero Nvarchar (10) Not Null,
Capacidad Int Not Null,
Estado Bit Default 1 Not Null
)
Go
Create Table Producto
(
Id_Producto Int Primary Key Identity(1,1) Not Null,
Nombre Nvarchar (15) Not Null,
Descripcion Nvarchar (50) Not Null,
Precio float Not Null,
Existencia Int Not Null,
Estado Bit Default 1 Not Null
)
Go
Create Table Combos
(
Id_Combo Int Primary Key Identity(1,1) Not Null,
NombreCom Nvarchar (15) Not Null,
Id_Producto Int ForeIgn Key References Producto(Id_Producto) Not Null,
CostoCom Float Not Null
)
Go
Create Table Cafetin
(
Id_Cafetin Int Primary Key Identity(1,1) Not Null,
NombreB Nvarchar(35) Not Null,
Propietario Nvarchar(50) Not Null
)
Go
Create Table Ventas
(
Id_Venta Int Primary Key Identity (1,1) Not Null,
Fecha_Venta DateTime Default GetDate() Not Null,
Id_Cliente Int ForeIgn Key References Cliente(Id_Cliente) Not Null,
TotalV Float Not Null
)
Go
Create Table Det_Ventas
(
Id_Venta Int ForeIgn Key References Ventas(Id_Venta) Not Null,
Id_Cafetin Int ForeIgn Key References Cafetin(Id_Cafetin) Not Null,
Id_Producto Int ForeIgn Key References Producto(Id_Producto) Not Null,
Id_Combo Int ForeIgn Key References Combos(Id_Combo) Not Null,
CantidadV Int Not Null,
SubTotalP float
)
Go

----------------------------------------
-- Crear Procedimientos de Almacenado --
----------------------------------------

-- Guardar Salas --
Create Proc RegistrarSalas
(
@IdSalas Int,
@Numero Nvarchar(10),
@Capacidad Int,
@Estado Bit,
@Resultado Int OutPut
)
As
Begin
Set @Resultado = 0
IF Not Exists (Select * From Salas Where Id_Salas = @IdSalas)
Begin
Insert Into Salas(Numero,Capacidad,Estado) 
Values (@IdSalas,@Numero,@Capacidad,@Estado)
Set @Resultado = Scope_Identity()
End	
End
Go

-- Modificar Salas --
Create Procedure ModificarSala
(
@IdSalas Int,
@Numero Nvarchar(10),
@Capacidad Int,
@Estado Bit,
@Resultado Bit OutPut
)
As
Begin
Set @Resultado = 1
If Not Exists (Select * From Salas Where Numero = @Numero and Id_Salas != @IdSalas)
UpDate Salas set
Numero = @Numero,
Capacidad = @Capacidad,
Estado = @Estado
Where Id_Salas = @IdSalas
Else
Set @Resultado = 0
End
Go

-- Eliminar Salas --
Create Procedure EliminarSalas
@IdSalas Int
As
Declare @Idd As Int
Set @Idd=(Select Id_Salas From Salas Where Id_Salas=@IdSalas)
If(@IdSalas=@Idd)
Begin
  Delete from Salas
  Where Id_Salas=@Idd;
End
Else
Begin
  Print 'Sala no encontrada'
End
Go

-- Dar baja a Salas --
Create Procedure BajaSalas
@IdSalas Int
As
Declare @Idd As Int
Set @Idd=(Select Id_Salas From Salas Where Id_Salas=@IdSalas)
If(@Idd=@IdSalas)
Begin
  UpDate Salas Set Estado=0 Where Id_Salas=@IdSalas
End
Else
Begin
  Print 'Sala no encontrada'
End
Go

-- Lista Salas --
Create Procedure ListaSalas
As
Select * From Salas Where Estado=1

-- Buscar Salas --
Create Procedure BuscarSalas
@IdSalas Int
As
Declare @Idd As Int
Set @Idd=(Select Id_Salas From Salas Where Id_Salas=@IdSalas)
If(@IdSalas=@Idd)
Begin
  Select * From Salas Where Id_Salas=@IdSalas
End
Else
Begin
  Print 'Sala no encontrada'
End
Go

-- Guardar Pelicula --
Create Proc RegistrarPelicula
(
@IdPe Int,
@NombreP Nvarchar(20),
@Duracion Int,
@Costo Float,
@EstadoPe Bit,
@Resultado Int OutPut
)
As
Begin
Set @Resultado = 0
IF Not Exists (Select * From Pelicula Where Id_Pelicula = @IdPe)
Begin
Insert Into Pelicula(NombreP,Duracion,Costo,EstadoPe) 
Values (@IdPe,@NombreP,@Duracion,@Costo,@EstadoPe)
Set @Resultado = Scope_Identity()
End	
End
Go

-- Modificar Pelicula --
Create Procedure ModificarPelicula
(
@IdPelicula Int,
@NombreP Nvarchar(20),
@Duracion Int,
@Costo Float,
@EstadoPe Bit,
@Resultado Bit OutPut
)
As
Begin
Set @Resultado = 1
If Not Exists (Select * From Pelicula Where NombreP = @NombreP and Id_Pelicula != @IdPelicula)
UpDate Pelicula set
NombreP = @NombreP,
Duracion = @Duracion,
Costo = @Costo,
EstadoPe = @EstadoPe
Where Id_Pelicula = @IdPelicula
Else
Set @Resultado = 0
End
Go

-- Eliminar Pelicula --
Create Procedure EliminarPelicula
@IdPelicula Int
As
Declare @Idd As Int
Set @Idd=(Select Id_Pelicula From Pelicula Where Id_Pelicula=@IdPelicula)
If(@IdPelicula=@Idd)
Begin
  Delete from Pelicula
  Where Id_Pelicula=@Idd;
End
Else
Begin
  Print 'Pelicula no encontrada'
End
Go

-- Dar baja a Pelicula --
Create Procedure BajaPelicula
@IdPelicula Int
As
Declare @Idd As Int
Set @Idd=(Select Id_Pelicula From Pelicula Where Id_Pelicula=@IdPelicula)
If(@Idd=@IdPelicula)
Begin
  UpDate Pelicula Set EstadoPe=0 Where Id_Pelicula=@IdPelicula
End
Else
Begin
  Print 'Pelicula no encontrada'
End
Go

-- Lista Pelicula --
Create Procedure ListaPelicula
As
Select * From Pelicula Where EstadoPe=1
Go

-- Buscar Pelicula --
Create Procedure BuscarPelicula
@IdPelicula Int
As
Declare @Idd As Int
Set @Idd=(Select Id_Pelicula From Pelicula Where Id_Pelicula=@IdPelicula)
If(@IdPelicula=@Idd)
Begin
  Select * From Pelicula Where Id_Pelicula=@IdPelicula
End
Else
Begin
  Print 'Pelicula no encontrada'
End
Go

-- Guardar Producto --
Create Proc RegistrarProducto
(
@IdProducto Int,
@Nombre Nvarchar(15),
@Descripcion Nvarchar(50),
@Existencia Int,
@Estado Bit,
@Resultado Int OutPut
)
As
Begin
Set @Resultado = 0
If Not Exists (Select * From Producto Where Id_Producto = @IdProducto)
Begin
Insert Into Producto(Id_Producto,Nombre,Descripcion,Existencia,Estado) 
Values (@IdProducto,@Nombre,@Descripcion,@Existencia,@Estado)
Set @Resultado = Scope_Identity()
End	
End
Go

-- Modificar Producto --
create procedure ModificarProducto
(
@IdProducto Int,
@Nombre Nvarchar(15),
@Descripcion Nvarchar(50),
@Existencia Int,
@Estado Bit,
@Resultado Bit OutPut
)
As
Begin
Set @Resultado = 1
If Not Exists (Select * From Producto Where Nombre = @Nombre and Id_Producto != @IdProducto)	
UpDate Producto Set
Nombre = @Nombre,
Descripcion = @Descripcion,
Existencia = @Existencia,
Estado = @Estado
Where IdProducto = @IdProducto
Else
Set @Resultado = 0
End
Go

-- Dar baja a Producto --
Create Procedure BajaProducto
@IdProducto Int
As
Declare @Idd As Int
Set @Idd=(Select Id_Producto From Producto Where Id_Producto=@IdProducto)
If(@Idd=@IdProducto)
Begin
  UpDate Producto Set Estado=0 Where Id_Producto=@IdProducto
End
Else
Begin
  Print 'Producto no encontrado'
End
Go

-- Lista Producto --
Create Procedure ListaProducto
As
Select * From Producto Where Estado=1
Go

-- Buscar Producto --
Create Procedure BuscarProducto
@IdProducto Int
As
Declare @Idd As Int
Set @Idd=(Select Id_Producto From Producto Where Id_Producto=@IdProducto)
If(@IdProducto=@Idd)
Begin
  Select * From Producto Where Id_Producto=@IdProducto
End
Else
Begin
  Print 'Producto no encontrado'
End
Go

---------------------
-- Crear Funciones --
---------------------

--------------------
-- Crear Triggers --
--------------------

-- Salas Llenas --
Create Trigger SalasLLenas
On Salas 
For Insert
As
Set NoCount On
Update Salas
Set Salas.Capacidad = Salas.Capacidad - Inserted.Capacidad From Inserted
Inner Join Salas on Salas.Id_Salas = Inserted.Id_Salas
Go

-- Venta de Productos --
Create Trigger VentaProducto
On Det_Ventas 
For Insert
As
Set NoCount On
Update Producto
Set Producto.Existencia = Producto.Existencia - Inserted.Existencia From Inserted
Inner Join Producto on Producto.Id_Producto = Inserted.Id_Producto
Go

-------------------------
-- Crear Transacciones --
-------------------------

BackUp DataBase CineMark To Disk='D:\CineMark.bak'