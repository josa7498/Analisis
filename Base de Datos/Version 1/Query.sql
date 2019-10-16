use master

create database RMClient
on primary(
name = N'RMClient',
filename = N'C:\RMClient\RMClient.mdf',
size = 8192KB,
maxsize = unlimited,
filegrowth = 65536KB)
log on(
name = N'RMClient_log',
filename = N'C:\RMClient\RMClient_log.ldf',
size = 8192KB,
maxsize = 2048GB,
filegrowth = 65536KB)

drop database RMClient

use RMClient

create table Estado(
id int not null,
descripcion varchar(10) not null
)

create table Usuario(
id int not null identity(1,1),
username varchar(30) not null,
password varchar(30) not null,
idEstado int not null,
correo varchar(50) not null
)

create table Sede(
id int not null,
nombre varchar(30) not null,
idEstado int not null
)

create table Departamento(
id int not null,
idSede int not null,
descripcion varchar(30) not null
)

create table Genero(
id char(1) not null,
descripcion varchar(10) not null
)

create table Empleado(
id int not null identity(1,1),
cedula varchar(30) not null,
nombre varchar(30) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30) null,
idGenero char(1) not null,
numeroCelular varchar(20) not null,
otroNumero varchar(20) null,
correo varchar(50) not null,
idDepartamento int not null,
idSede int not null,
idUsuario int not null
)

create table TipoProducto(
id int not null,
descripcion varchar(200) not null
)

create table Proveedor(
id int not null identity(1,1),
descripcion varchar(100) not null,
cedula varchar(30) not null,
numeroTelefono varchar(15) not null,
correo varchar(50) not null
)

create table Producto(
id int not null identity(1,1),
idProveedor int not null,
idTipo int not null,
codigo varchar(30) not null,
nombre varchar(50) not null,
descripcion varchar(200) not null,
cantidadDisponible int not null,
fechaIngreso date not null,
fechaSalida date null
)

create table EstadoCampana(
id int not null,
descripcion varchar(15) not null
)

create table TipoCampana(
id int not null,
descripcion varchar(30) not null
)

create table Campana(
id int not null identity(1,1),
idTipo int not null,
idSede int not null,
idEstado int not null,
nombre varchar(30) not null,
descripcion varchar(200) not null,
fechaInicio date not null,
fechaFinal date null,
descuentoMinimo decimal not null,
descuentoMaximo decimal not null,
idEmpleadoCreador int not null,
idEmpleadoAprueba int null
)

create table EstadoCotizacion(
id int not null,
descripcion varchar(15) not null
)

create table EncabezadoCotizacion(
id int not null identity(1,1),
fechaCreacion datetime not null,
idCliente int not null,
idEmpleado int not null,
numeroLineas int not null,
idCampana int not null,
idEstadoCotizacion int not null,
subTotal decimal not null,
montoDescuento decimal not null,
impuestoVentas decimal not null,
total decimal not null
)

create table DetalleCotizacion(
id int not null,
idEncabezadoCotizacion int not null,
idProducto int not null,
cantidad int not null,
porcentajeDescuento decimal not null,
precio decimal not null,
montoDescuento decimal not null,
montoImpuesto decimal not null,
montoTotal decimal not null
)

create table Provincia(
id int not null,
descripcion varchar(30) not null
)

create table Canton(
id int not null,
idProvincia int not null,
descripcion varchar(30) not null
)

create table Ocupacion(
id int not null,
descripcion varchar(30) not null
)

create table EstadoCliente(
id int not null,
descripcion varchar(30) not null
)

create table TipoCliente(
id int not null,
descripcion varchar(30) not null
)

create table Cliente(
id int not null identity(1,1),
idTipoCliente int not null,
cedula varchar(30) not null,
nombre varchar(30) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30) null,
idGenero char(1) not null,
idOcupacion int not null,
numeroCelular varchar(20) not null,
otroNumero varchar(20) not null,
correo varchar(50) not null,
fechaNacimiento date not null,
ingresoSalarial decimal null,
idProvincia int not null,
idCanton int not null,
direccionExacta varchar(30) not null,
vehiculoInteres varchar(30) not null,
idEstadoCliente int not null,
)

create table EstadoModificacion(
id char(1) not null,
descripcion varchar(30) not null
)

create table Bitacora(
id int not null identity(1,1),
idUsuario int not null,
tipoModificacion varchar(30) not null,
fecha datetime not null,
idEstadoModificacion char(1) not null
)

alter table Estado add constraint pkEstado primary key (id)
alter table Usuario add constraint pkUsuario primary key (id)
alter table Sede add constraint pkSede primary key (id)
alter table Departamento add constraint pkDepartamentoSede primary key (id,idSede)
alter table Genero add constraint pkGenero primary key (id)
alter table Empleado add constraint pkEmpleado primary key (id)
alter table TipoProducto add constraint pkTipoProducto primary key (id)
alter table Proveedor add constraint pkProveedor primary key (id)
alter table Producto add constraint pkProducto primary key (id)
alter table EstadoCampana add constraint pkEstadoCampana primary key (id)
alter table TipoCampana add constraint pkTipoCampana primary key (id)
alter table Campana add constraint pkCampana primary key (id)
alter table EstadoCotizacion add constraint pkEstadoCotizacion primary key (id)
alter table EncabezadoCotizacion add constraint pkEncabezadoCotizacion primary key (id)
alter table Provincia add constraint pkProvincia primary key (id)
alter table Canton add constraint pkCantonProvincia primary key (id,idProvincia)
alter table Ocupacion add constraint pkOcupacion primary key (id)
alter table EstadoCliente add constraint pkEstadoCliente primary key (id)
alter table TipoCliente add constraint pkTipoCliente primary key (id)
alter table Cliente add constraint pkCliente primary key (id)
alter table EstadoModificacion add constraint pkEstadoModificacion primary key (id)
alter table Bitacora add constraint pkBitacora primary key (id)

alter table Usuario add constraint fkUsuarioEstado foreign key (idEstado) references Estado (id)
alter table Sede add constraint fkSedeEstado foreign key (idEstado) references Estado (id)
alter table Empleado add constraint fkEmpleadoGenero foreign key (idGenero) references Genero (id)
alter table Empleado add constraint fkEmpleadoDepartamento foreign key (idDepartamento,idSede) references Departamento (id,idSede)
alter table Empleado add constraint fkEmpleadoUsuario foreign key (idUsuario) references Usuario (id)
alter table Producto add constraint fkProductoProveedor foreign key (idProveedor) references Proveedor (id)
alter table Producto add constraint fkProductoTipoProducto foreign key (idTipo) references TipoProducto (id)
alter table Campana add constraint fkCampanaTipoCampana foreign key (idTipo) references TipoCampana (id)
alter table Campana add constraint fkCampanaSede foreign key (idSede) references Sede (id)
alter table Campana add constraint fkCampanaEstadoCampana foreign key (idEstado) references EstadoCampana (id)
alter table Campana add constraint fkCampanaEmpleadoCreador foreign key (idEmpleadoCreador) references Empleado (id)
alter table Campana add constraint fkCampanaEmpleadoAprueba foreign key (idEmpleadoAprueba) references Empleado (id)
alter table EncabezadoCotizacion add constraint fkEncabezadoCotizacionCliente foreign key (idCliente) references Cliente (id)
alter table EncabezadoCotizacion add constraint fkEncabezadoCotizacionEmpleado foreign key (idEmpleado) references Empleado (id)
alter table EncabezadoCotizacion add constraint fkEncabezadoCotizacionCampana foreign key (idCampana) references Campana (id)
alter table EncabezadoCotizacion add constraint fkEncabezadoCotizacionEstadoCotizacion foreign key (idEstadoCotizacion) references EstadoCotizacion (id)
alter table DetalleCotizacion add constraint fkDetalleCotizacionEncabezadoCotizacion foreign key (idEncabezadoCotizacion) references EncabezadoCotizacion (id)
alter table DetalleCotizacion add constraint fkDetalleCotizacionProducto foreign key (idProducto) references Producto (id)
alter table Canton add constraint fkCantonProvincia foreign key (idProvincia) references Provincia (id)
alter table Cliente add constraint fkClienteTipoCliente foreign key (idTipoCliente) references TipoCliente (id)
alter table Cliente add constraint fkClienteGenero foreign key (idGenero) references Genero (id)
alter table Cliente add constraint fkClienteOcupacion foreign key (idOcupacion) references Ocupacion (id)
alter table Cliente add constraint fkClienteProvincia foreign key (idCanton, idProvincia) references Canton (id, idProvincia)
alter table Cliente add constraint fkClienteEstadoCliente foreign key (idEstadoCliente) references EstadoCliente (id)
alter table Bitacora add constraint fkBitacoraUsuario foreign key (idUsuario) references Usuario (id)
alter table Bitacora add constraint fkBitacoraEstadoModificacion foreign key (idEstadoModificacion) references EstadoModificacion(id)

insert into Provincia values(1,'San José')
insert into Provincia values(2,'Alajuela')
insert into Provincia values(3,'Cartago')
insert into Provincia values(4,'Heredia')
insert into Provincia values(5,'Guanacaste')
insert into Provincia values(6,'Puntarenas')
insert into Provincia values(7,'Limón')

insert into Canton values(1,1,'San José')
insert into Canton values(2,1,'Escazú')
insert into Canton values(3,1,'Desamparados')
insert into Canton values(4,1,'Puriscal')
insert into Canton values(5,1,'Tarrazú')
insert into Canton values(6,1,'Aserrí')
insert into Canton values(7,1,'Mora')
insert into Canton values(8,1,'Goicoechea')
insert into Canton values(9,1,'Santa Ana')
insert into Canton values(10,1,'Alajuelita')
insert into Canton values(11,1,'Vásquez de Coronado')
insert into Canton values(12,1,'Acosta')
insert into Canton values(13,1,'Tibás')
insert into Canton values(14,1,'Moravia')
insert into Canton values(15,1,'Montes de Oca')
insert into Canton values(16,1,'Turrubares')
insert into Canton values(17,1,'Dota')
insert into Canton values(18,1,'Curridabat')
insert into Canton values(19,1,'Pérez Zeledón')
insert into Canton values(20,1,'León Cortéz Castro')
insert into Canton values(1,2,'Alajuela')
insert into Canton values(2,2,'San Ramón')
insert into Canton values(3,2,'Grecia')
insert into Canton values(4,2,'San Mateo')
insert into Canton values(5,2,'Atenas')
insert into Canton values(6,2,'Naranjo')
insert into Canton values(7,2,'Palmares')
insert into Canton values(8,2,'Poás')
insert into Canton values(9,2,'Orotina')
insert into Canton values(10,2,'San Carlos')
insert into Canton values(11,2,'Zarcero')
insert into Canton values(12,2,'Valverde Vega')
insert into Canton values(13,2,'Upala')
insert into Canton values(14,2,'Los Chiles')
insert into Canton values(15,2,'Guatuso')
insert into Canton values(1,3,'Cartago')
insert into Canton values(2,3,'Paraíso')
insert into Canton values(3,3,'La Unión')
insert into Canton values(4,3,'Jiménez')
insert into Canton values(5,3,'Turrialba')
insert into Canton values(6,3,'Alvarado')
insert into Canton values(7,3,'Oreamuno')
insert into Canton values(8,3,'El Guarco')
insert into Canton values(1,4,'Heredia')
insert into Canton values(2,4,'Barva')
insert into Canton values(3,4,'Santo Domingo')
insert into Canton values(4,4,'Santa Bárbara')
insert into Canton values(5,4,'San Rafaél')
insert into Canton values(6,4,'San Isidro')
insert into Canton values(7,4,'Belén')
insert into Canton values(8,4,'Flores')
insert into Canton values(9,4,'San Pablo')
insert into Canton values(10,4,'Sarapiquí')
insert into Canton values(1,5,'Liberia')
insert into Canton values(2,5,'Nicoya')
insert into Canton values(3,5,'Santa Cruz')
insert into Canton values(4,5,'Bagaces')
insert into Canton values(5,5,'Carrillo')
insert into Canton values(6,5,'Cañas')
insert into Canton values(7,5,'Abangáres')
insert into Canton values(8,5,'Tilarán')
insert into Canton values(9,5,'Nandayure')
insert into Canton values(10,5,'La Cruz')
insert into Canton values(11,5,'Hojancha')
insert into Canton values(1,6,'Puntarenas')
insert into Canton values(2,6,'Esparza')
insert into Canton values(3,6,'Buenos Aires')
insert into Canton values(4,6,'Montes de Oro')
insert into Canton values(5,6,'Osa')
insert into Canton values(6,6,'Aguirre')
insert into Canton values(7,6,'Golfito')
insert into Canton values(8,6,'Coto Brus')
insert into Canton values(9,6,'Parrita')
insert into Canton values(10,6,'Corredores')
insert into Canton values(11,6,'Garabito')
insert into Canton values(1,7,'Limón')
insert into Canton values(2,7,'Pococí')
insert into Canton values(3,7,'Siquirres')
insert into Canton values(4,7,'Talamanca')
insert into Canton values(5,7,'Matina')
insert into Canton values(6,7,'Guácimo')

insert into Genero values('-','No indica')
insert into Genero values('M','Masculino')
insert into Genero values('F','Femenino')