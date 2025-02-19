CREATE TABLE categorias(
id int identity (1,1) primary key,
nombre varchar(50) unique not null,
descripcion varchar(255),
estado bit default 1,
)
GO

CREATE TABLE articulo(
id int identity (1,1),
idCategoria int not null,
codigo int not null,
nombre varchar (50) not null,
precioVenta decimal (11,2),
stock int not null,
descripcion varchar(255),
imagen varchar (255),
estado bit default 1,

	FOREIGN KEY (idCategoria)
	REFERENCES categorias (id)
)
GO

CREATE TABLE rol(
id int identity (1,1) Primary Key,
nombre varchar (255) not null,
descripcion varchar (255) not null,
)
Go

Create Table  usuario(
id int identity (1,1) primary key,
idrol int not null,
nombre varchar (255),
tipoDocumento varchar(50),
numeroDocumento varchar (100),
direccion  varchar (255),
telefono varchar (50),
email varchar (150),
clave varchar (128),
estado bit default 1,
Foreign Key(idrol) references rol (id)
) 
Go

CREATE TABLE persona (
id int identity (1,1) primary key,
tipoPersona varchar (50),
nombre varchar (255),
tipoDocumento varchar(50),
numeroDocumento varchar (100),
direccion  varchar (255),
telefono varchar (50),
email varchar (150),
clave varchar (128),
estado bit default 1,
)
GO

Create Table ingreso (
id int identity (1,1) primary key,
idpersona int not null,
idusuario int not null,
tipoComprobante varchar (50) not null,
serieComprobante varchar (50)not  null,
numeroComprobante varchar (410) not null,
fecha DATETIME not null,
impuesto Decimal(11,2),
total decimal (11,2),
estado varchar (30) default 'pendiente',

Foreign key (idpersona) references persona (id),
Foreign key (idusuario) references usuario (id),
)
GO

CREATE TABLE ingreso_articulo(
id int identity (1,1) primary key,
idingreso int,
idarticulo int,
cantidad int,
precio decimal (11,2),

Foreign key (idingreso) references ingreso (id),
Foreign key (idarticulo) references articulo (id),
) 
Go

CREATE TABLE venta (
id int identity (1,1) primary key,
idpersona int,
idusuario int,
tipoComprobante varchar (50) not null,
serieComprobante varchar (50)not  null,
numeroComprobante varchar (410) not null,
fecha DATETIME not null,
impuesto Decimal(11,2),
total decimal (11,2),
estado varchar (30) default 'pendiente',

Foreign key (idpersona) references persona (id),
Foreign key (idusuario) references usuario (id),
)
GO

Create table detalle_Venta(
	id int identity (1,1) primary key,
	idventa int,
	idarticulo int,
	cantidad int,
	precio decimal (11,2),
	descuento decimal (11,2),

	Foreign key (idarticulo) references articulo (id),
	Foreign Key (idventa) references venta,
)
GO
