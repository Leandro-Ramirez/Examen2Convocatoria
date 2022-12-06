create database CineMark
Go

use CineMark
Go

Create Table Estado
(
IdEstado Int Identity (1,1) Not Null,
Descripcion Varchar (50) Not Null,
Constraint Fk_Estado Primary Key (IdEstado)
)
Go

Create Table Sala
(
IdSala Int Identity (1,1) Not Null,
Descripcion Varchar(50) Not Null,
Asientos Int Not Null,
IdEstado Int Not Null,
Constraint Fk_Sala Primary Key (IdSala),
Constraint Fk_Sala_Estado Foreign Key (IdEstado) References Estado(IdEstado)
)
Go

Create Table Pelicula
(
IdPelicula Int Identity (1,1) Not Null,
Titulo Varchar(50) Not Null,
Duracion Time Not Null,
Genero Varchar(50) Not Null,
Clasificacion Varchar(50) Not Null,
Formato Varchar(40) Not Null,
IdEstado Int Not Null,
Constraint Fk_Pelicula Primary Key (IdPelicula),
Constraint Fk_Pelicula_Estado Foreign Key (IdEstado) References Estado(IdEstado)
)
Go

Create Table Asiento
(
IdAsiento Int Identity (1,1) Not Null,
NumAsiento Int Not Null,
IdSala Int Not Null,
IdEstado Int Not Null,
Constraint Fk_Asiento Primary Key (IdAsiento),
Constraint Fk_Asiento_Sala Foreign key (IdSala) References Sala(IdSala),
Constraint Fk_Asiento_Estado Foreign key (IdEstado) References Estado(IdEstado)
)
Go

Create Table Cliente
(
IdCliente Int Identity (1,1) Not Null,
Nombre Varchar(50) Not Null,
Apellido Varchar(50) Not Null,
Dni Char(8) Null,
Constraint Fk_Cliente Primary Key (IdCliente)
)
Go

Create Table Cartelera
(
IdCartelera Int Identity (1,1) Not Null,
IdPelicula Int Not Null,
IdSala Int Not Null,
HoraInicio Time Not Null,
HoraFin Time Not Null,
Fecha Date Not Null,
IdEstado Int Not Null,
Constraint Fk_Cartelera Primary Key (IdCartelera),
Constraint Fk_Cartelera_Pelicula Foreign Key (IdPelicula) References Pelicula(IdPelicula),
Constraint Fk_Cartelera_Sala Foreign Key (IdSala) References Sala(IdSala),
Constraint Fk_Cartelera_Estado Foreign Key (IdEstado) References Estado(IdEstado),
)
Go

Create Table RegistroAsiento
(
IdRegAsiento Int Identity (1,1) Not Null,
IdCartelera Int Not Null,
NumAsiento Int Not Null,
Constraint Fk_RAsiento Primary Key (IdRegAsiento),
Constraint Fk_RAsienot_Cartelera Foreign Key (IdCartelera) References Cartelera(IdCartelera)
)
Go

Create Table AsientoCliente
(
IdAsicliente Int Identity (1,1) Not Null,
IdRegAsiento Int Not Null,
IdCliente Int Not Null,
Constraint Fk_ACliente Primary Key (IdAsiCliente),
Constraint Fk_ACliente_RCliente Foreign key (IdRegAsiento) References RegistroAsiento(IdRegAsiento),
Constraint Fk_ACliente_Cliente Foreign key (IdCliente) References Cliente(IdCliente)
)
Go

Create Table Empleado
(
IdEmpleado Int Identity (1,1) Not Null,
Nombre Varchar(50) Not Null,
Apellido Varchar(50) Not Null,
IdEstado Int Not Null,
Constraint Fk_Empleado Primary Key (IdEmpleado),
Constraint Fk_Empleado_Estado Foreign Key (IdEstado) References Estado(IdEstado)
)
Go

Create Table Ticket
(
IdTicket Int Identity (1,1) Not Null,
Tipo Varchar(80) Not Null,
Descripcion Varchar(200) Not Null,
Precio Decimal(10,2) Not Null,
IdEstado Int Not Null,
Constraint Fk_Ticket Primary Key (IdTicket),
Constraint Fk_Ticket_Estado Foreign Key (IdEstado) References Estado(IdEstado)
)
Go

Create Table Venta
(
IdVenta Int Identity (1,1) Not Null,
IdCliente Int Not Null,
IdCartelera Int Not Null,
IdEmpleado Int Not Null,
Fecha Date Not Null,
Asientos Varchar (50) Not Null,
ToPago Varchar (50) Not Null,
Promocion Varchar (80) Not Null,
Descuento Decimal (10,2) Not Null,
IdEstado Int Not Null,
Constraint Fk_Venta Primary Key (IdVenta),
Constraint Fk_Venta_Cliente Foreign Key (IdCliente) References Cliente(IdCliente),
Constraint Fk_Venta_Cartelera Foreign Key (IdCartelera) References Cartelera(IdCartelera),
Constraint Fk_Venta_Empleado Foreign Key (IdEmpleado) References Empleado(IdEmpleado),
Constraint Fk_Venta_Estado Foreign Key (IdEstado) References Estado(IdEstado)
)
Go

Create Table DetalleVenta
(
IdDetVenta Int Identity (1,1) Not Null,
IdVenta Int Not Null,
Descripcion Varchar (100) Not Null,
Cantidad Int Not Null,
Precio Decimal (10,2) Not Null,
Constraint Fk_DVenta Primary Key (IdDetVenta),
Constraint Fk_DVenta_Venta Foreign Key (IdVenta) References Venta(IdVenta)
)
Go

Create Table Promocion
(
IdPromocion Int Identity (1,1) Not Null,
Nombre Varchar (80) Not Null,
Descuento Decimal (10,2) Not Null,
IdEstado Int Not Null,
BaseTicket Bit Not Null,
Constraint Fk_Promocion Primary Key (IdPromocion),
Constraint Fk_Promocion_Estado Foreign Key (IdEstado) References Estado(IdEstado)
)
Go

Create Table ProGrPromocion
(
IdPGPromocion Int Identity (1,1) Not Null,
Fecha Date Not Null,
Promocion Varchar (80) Not Null,
IdEstado Int Not Null,
Constraint Pk_PGPromocion Primary Key (IdPGPromocion),
Constraint Fk_PGPromocion_Estado Foreign Key (IdEstado) References Estado(IdEstado)
)
Go

Insert Into Estado Values ('Activo')
Insert Into Estado Values ('Inactivo')
Insert Into Estado Values ('Ocupado')
Insert Into Estado Values ('Libre')
Insert Into Estado Values ('Cancelado')

Insert Into Sala Values ('SALA 1',14,4);
Insert Into Sala Values ('SALA 2',14,4);

Insert Into Pelicula Values ('Cars2 1','01:30:00','ACCION','APTO PARA TODOS','3D',null,1);

Insert Into Asiento Values (1,1,1);
Insert Into Asiento Values (2,1,1);
Insert Into Asiento Values (3,1,1);
Insert Into Asiento Values (4,1,1);
Insert Into Asiento Values (5,1,1);
Insert Into Asiento Values (6,1,1);
Insert Into Asiento Values (7,1,1);
Insert Into Asiento Values (8,1,1);
Insert Into Asiento Values (9,1,1);
Insert Into Asiento Values (10,1,1);
Insert Into Asiento Values (11,1,1);
Insert Into Asiento Values (12,1,1);
Insert Into Asiento Values (13,1,1);
Insert Into Asiento Values (14,1,1);

Insert Into Asiento Values (1,2,1);
Insert Into Asiento Values (2,2,1);
Insert Into Asiento Values (3,2,1);
Insert Into Asiento Values (4,2,1);
Insert Into Asiento Values (5,2,1);
Insert Into Asiento Values (6,2,1);
Insert Into Asiento Values (7,2,1);
Insert Into Asiento Values (8,2,1);
Insert Into Asiento Values (9,2,1);
Insert Into Asiento Values (10,2,1);
Insert Into Asiento Values (11,2,1);
Insert Into Asiento Values (12,2,1);
Insert Into Asiento Values (13,2,1);
Insert Into Asiento Values (14,2,1);

Insert Into Asiento Values (1,3,1);
Insert Into Asiento Values (2,3,1);
Insert Into Asiento Values (3,3,1);
Insert Into Asiento Values (4,3,1);
Insert Into Asiento Values (5,3,1);
Insert Into Asiento Values (6,3,1);
Insert Into Asiento Values (7,3,1);
Insert Into Asiento Values (8,3,1);
Insert Into Asiento Values (9,3,1);
Insert Into Asiento Values (10,3,1);
Insert Into Asiento Values (11,3,1);
Insert Into Asiento Values (12,3,1);
Insert Into Asiento Values (13,3,1);
Insert Into Asiento Values (14,3,1);

Insert Into Cliente Values ('Jose','Calero','88888888');

Insert Into Cartelera Values (1,1,'18:00:00','19:30:00',CURRENT_TIMESTAMP,1);

Insert Into Empleado Values ('Pedro','Sanchez',CURRENT_TIMESTAMP,1);

Insert Into Ticket Values ('Entrada General','Entrada para las personas mayores a 18 años',10,1);
Insert Into Ticket Values ('Entrada Niños','Entrada para los niños',5,1);

Insert Into Promocion Values ('Promocion 3X2',1.0,1,1);
Insert Into Promocion Values ('Descuento 30%',0.3,0,1);

Create Procedure SP_Programar_Pelicula
(
@IdPelicula Int,
@Duracion Int,
@IdSala Int,
@HoraInicio Time,
@HoraFin Time
) 
As
Declare @UltimoDia Int,
@UltDia Date,
@DiaPrograma Date,
@Contador Int=1
Begin 
 Set @UltimoDia=(Select 7-( DateDiff(Day,0,GetDate())%7+1));
 Set @UltDia=(Select DateAdd(Day,@UltimoDia,GetDate()))
 Set @DiaPrograma=GetDate();
 While (@Contador<=@Duracion)
 Begin  
   While (@DiaPrograma<=@UltDia)
  Begin  
   Insert Into Cartelera Values (@IdPelicula,@IdSala,@HoraInicio,@HoraFin,@DiaPrograma,1);
   Set @DiaPrograma=(Select DateAdd(Day,1,@DiaPrograma));
     End
  Set @UltDia=(Select DateAdd(Day,7,@UltDia));
    Set @Contador=@Contador+1; 
 End
End
Go

Create Procedure [dbo].[SP_Venta]
(
@IdCliente Int,
@IdCartelera Int,
@IdEmpleado Int,
@ToPago Varchar (50),
@XMLDoc Text
)
As
Declare @Documento Int,
@IdVenta Int,
@IdRegAsiento Int,
@DescT Decimal (19,2)
Begin
 Begin TRY
  Begin TRANSACTION 
  Exec sp_xml_preparedocument @Documento OutPut, @XMLDoc;
   Declare @PromoTemporal Table
   (
   id Int Identity (1,1),
   descuento Decimal (10,2) Default 0,
   baseticket Bit Default 0
   ); 
    If (Select Count(IdPGPromocion) From ProGrPromocion Where Convert(Varchar,Fecha,111)=Convert(varchar,GetDate(),111))>0
     Insert Into @PromoTemporal Select p.Descuento,p.BaseTicket 
     From ProGrPromocion pg 
	 Inner Join Promocion p On p.IdPromocion=pg.IdPGPromocion 
	 Where pg.Fecha=Convert(varchar,GetDate(),111);
     
    Set @DescT =(Select descuento From @PromoTemporal);
    Insert Into Venta 
    Select @IdCliente,@IdCartelera,@IdEmpleado,GetDate(),Asiento,@ToPago,Promocion,@DescT,1 From OpenXML(@Documento,N'/ROOT/VENTA') 
    With (Asiento Varchar (20),ToPago Varchar (50),Peomocion Varchar (80)) 
    Select @IdVenta=@@Identity;

    If @@Error<>0
     RollBack
    Else

    Insert Into DetalleVenta 
    Select @IdVenta,Descripcion,Cantidad,Precio From OpenXML(@Documento,N'/ROOT/VENTA/ITEM')
    With (Descripcion Varchar (100),Cantidad Int,Precio Decimal (10,2));

     If @@Error<>0
     RollBack
     Else
      
      Insert Into RegistroAsiento 
      Select @IdVenta,@IdCartelera,NumAsiento From OpenXML(@Documento,N'/ROOT/ASIENTO')
      With ( NumAsiento Int);

    Commit
 End Try
 Begin Catch
  If @@TranCount > 0
   RollBack
 End Catch
End
Go

Create Procedure SP_Programar_Promocion
(
@Duracion Int,
@NomPromocion Varchar (80),
@IdPromocion Int
)
As
Declare @UltimoDia Int,
@UltDia Date,
@DiaProgramado Date,
@Contador Int=1
Begin
Set @UltimoDia=(Select 7-( DateDiff(Day,0,GetDate())%7+1));
Set @UltDia=(Select DateAdd(Day,@UltimoDia,GetDate()))
Set @DiaProgramado=GetDate();
While (@Contador<=@Duracion)
Begin
While (@DiaProgramado<=@UltDia)
Begin
Insert Into ProGrPromocion Values (GetDate(),@NomPromocion,@IdPromocion,1);
Set @DiaProgramado=(Select DateAdd(Day,1,@DiaProgramado));
End
Set @UltDia=(Select DateAdd(Day,7,@UltDia));
Set @Contador=@Contador+1;
End
End
Go

Create Procedure SP_Programacion_De_Fecha
(
@FechaInicio Date,
@FechaFin Date
)
As
Begin
Select c.IdCartelera,p.Titulo,s.Descripcion,c.HoraInicio,c.HoraFin,c.Fecha,e.Descripcion As 'Estado' 
From Cartelera c 
Inner Join Pelicula p On p.IdPelicula=c.IdPelicula
Inner Join Sala s On s.IdSala=c.IdSala
Inner Join Estado e On e.IdEstado=c.IdEstado
Where c.Fecha Between @FechaInicio And @FechaFin;
End
Go

Create Procedure SP_Reporte_VentaCliente
(
@CodCliente Int
)
As
Begin
Select v.IdVenta,v.Fecha,c.Nombre+' '+c.Apellido As Cliente,r.HoraInicio,R.HoraFin,p.Titulo As Pelicula,d.Nombre+' '+d.Apellido As 'Empleado',v.Fecha,v.Asientos,v.ToPago,v.Promocion,v.Descuento,e.Descripcion 
From Venta v
Inner Join Cartelera r On r.IdCartelera = v.IdCartelera
Inner Join Estado e On e.IdEstado=r.IdEstado
Inner Join Cliente c On c.IdCliente=v.IdCliente
Inner Join Pelicula p On p.IdPelicula = r.IdPelicula
Inner Join Empleado d On d.IdEmpleado=v.IdEmpleado
WHERE V.IDCLIENTE=@CODCLIENTE;
END
Go

Create Procedure SP_Reporte_Cartelera
(
@Duracion INT
)
As
Declare @Semanas Int=@Duracion*7;
Declare @SPelicula Date=GetDate()+@Semanas;
Begin
Select f.IdCartelera,f.FECHA,f.HoraInicio,f.HoraFin,p.Titulo,s.Descripcion
From Cartelera F
Inner Join Pelicula p On p.IdPelicula=f.IdPelicula
Inner Join Sala s On s.IdSala=f.IdSala
Where F.Fecha Between GetDate() And @SPelicula;
End
Go

Create Trigger T_VentaAsiento
On RegistroAsiento
After Insert
As
Begin
Insert Into AsientoCliente Select i.IdRegAsiento,v.IdCliente From inserted i 
Inner Join Venta v on v.IdVenta=i.IdVenta;
UpDate Asiento Set IdEstado=3  From inserted i Where Asiento.IdAsiento =i.NumAsiento;
End
Go