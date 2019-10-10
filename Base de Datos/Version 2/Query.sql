use master

drop database RMClient

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

use RMClient

create table Estado(
idEstado int not null,
descripcion varchar(10) not null
)

create table Usuario(
idUsuario int not null,
usuario varchar(30) not null,
clave varchar(30) not null,
correo varchar(50) not null,
idEstado int not null
)

create table Sede(
idSede int not null,
descripcion varchar(30) not null,
idProvincia int not null,
idCanton int not null,
idDistrito int not null,
idEstado int not null
)

create table Departamento(
idDepartamento int not null,
descripcion varchar(30) not null,
idSede int not null
)

create table Genero(
idGenero char(1) not null,
descripcion varchar(10) not null
)

create table Empleado(
idEmpleado int not null,
cedula varchar(30) not null,
nombre varchar(30) not null,
apellido1 varchar(30) not null,
apellido2 varchar(30) null,
idGenero char(1) not null,
telefonoCelular varchar(20) not null,
otroTelefono varchar(20) null,
correo varchar(50) not null,
idProvincia int not null,
idCanton int not null,
idDistrito int not null,
direccionExacta varchar(300) not null,
idSede int not null,
idDepartamento int not null,
idUsuario int not null,
idEstado int not null
)

create table TipoVehiculo(
idTipoVehiculo int not null,
descripcion varchar(200) not null
)

create table Proveedor(
idProveedor int not null,
nombreProveedor varchar(100) not null,
cedula varchar(30) not null,
numeroTelefono varchar(15) not null,
correo varchar(50) not null,
idEstado int not null
)

create table Vehiculo(
idVehiculo int not null,
idProveedor int not null,
idTipoVehiculo int not null,
codigo varchar(50) not null,
marca varchar(50) not null,
modelo varchar(50) not null,
parametroVersion varchar(50) not null,
annio int not null,
cantidadDisponible int not null,
fechaIngreso date not null,
fechaSalida date null
)

create table EstadoCampana(
idEstadoCampana int not null,
descripcion varchar(15) not null
)

create table TipoCampana(
idTipoCampana int not null,
descripcion varchar(30) not null
)

create table Campana(
idCampana int not null,
idTipoCampana int not null,
idSede int not null,
idEstadoCampana int not null,
nombre varchar(30) not null,
descripcion varchar(200) not null,
idProvincia int not null,
idCanton int not null,
fechaInicio date not null,
fechaFinal date null,
descuentoMinimo decimal not null,
descuentoMaximo decimal not null,
idEmpleadoCreador int not null,
idEmpleadoAprueba int null
)

create table EstadoCotizacion(
idEstadoCotizacion int not null,
descripcion varchar(15) not null
)

create table EncabezadoCotizacion(
idEncabezadoCotizacion int not null,
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
idDetalleCotizacion int not null,
idEncabezadoCotizacion int not null,
idVehiculo int not null,
cantidad int not null,
porcentajeDescuento decimal not null,
precio decimal not null,
montoDescuento decimal not null,
montoImpuesto decimal not null,
montoTotal decimal not null
)

create table Provincia(
idProvincia int not null,
descripcion varchar(30) not null
)

create table Canton(
idCanton int not null,
idProvincia int not null,
descripcion varchar(30) not null
)

create table Distrito(
idDistrito int not null,
idCanton int not null,
idProvincia int not null,
descripcion varchar(30) not null,
)

create table Ocupacion(
idOcupacion int not null,
descripcion varchar(30) not null
)

create table EstadoCliente(
idEstadoCliente int not null,
descripcion varchar(30) not null
)

create table TipoCliente(
idTipoCliente int not null,
descripcion varchar(30) not null
)

create table Cliente(
idCliente int not null,
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
idDistrito int not null,
direccionExacta varchar(30) null,
vehiculoInteres varchar(30) not null,
idEstadoCliente int not null,
)

create table EstadoModificacion(
idEstadoModificacion int not null,
descripcion varchar(30) not null
)

create table Bitacora(
idBitacora int not null identity(1,1),
idUsuario int not null,
tipoModificacion varchar(30) not null,
fecha datetime not null,
idEstadoModificacion int not null
)

alter table Empleado add constraint dfEmpleadoApellido2 default 'No indica' for apellido2
alter table Empleado add constraint dfEmpleadoOtroTelefono default 'No indica' for otroTelefono
alter table Vehiculo add constraint dfVehiculoFechaSalida default null for fechaSalida
alter table Campana add constraint dfCampanaFechaFinal default null for fechaFinal
alter table Campana add constraint dfCampanaIdEmpleadoAprueba default 0 for idEmpleadoAprueba
alter table Cliente add constraint dfClienteApellido2 default 'No indica' for apellido2
alter table Cliente add constraint dfClienteIngresoSalarial default 0.00 for ingresoSalarial
alter table Cliente add constraint dfClienteDireccionExacta default 'No indica' for direccionExacta

alter table Estado add constraint pkEstado primary key (idEstado)
alter table Usuario add constraint pkUsuario primary key (idUsuario)
alter table Sede add constraint pkSede primary key (idSede)
alter table Departamento add constraint pkDepartamentoSede primary key (idDepartamento,idSede)
alter table Genero add constraint pkGenero primary key (idGenero)
alter table Empleado add constraint pkEmpleado primary key (idEmpleado)
alter table TipoVehiculo add constraint pkTipoVehiculo primary key (idTipoVehiculo)
alter table Proveedor add constraint pkProveedor primary key (idProveedor)
alter table Vehiculo add constraint pkVehiculo primary key (idVehiculo)
alter table EstadoCampana add constraint pkEstadoCampana primary key (idEstadoCampana)
alter table TipoCampana add constraint pkTipoCampana primary key (idTipoCampana)
alter table Campana add constraint pkCampana primary key (idCampana)
alter table EstadoCotizacion add constraint pkEstadoCotizacion primary key (idEstadoCotizacion)
alter table EncabezadoCotizacion add constraint pkEncabezadoCotizacion primary key (idEncabezadoCotizacion)
alter table DetalleCotizacion add constraint pkDetalleCotizacion primary key (idDetalleCotizacion,idEncabezadoCotizacion)
alter table Provincia add constraint pkProvincia primary key (idProvincia)
alter table Canton add constraint pkCantonProvincia primary key (idCanton,idProvincia)
alter table Distrito add constraint pkCantonDistrito primary key (idDistrito,idCanton,idProvincia)
alter table Ocupacion add constraint pkOcupacion primary key (idOcupacion)
alter table EstadoCliente add constraint pkEstadoCliente primary key (idEstadoCliente)
alter table TipoCliente add constraint pkTipoCliente primary key (idTipoCliente)
alter table Cliente add constraint pkCliente primary key (idCliente)
alter table EstadoModificacion add constraint pkEstadoModificacion primary key (idEstadoModificacion)
alter table Bitacora add constraint pkBitacora primary key (idBitacora)

alter table Usuario add constraint fkUsuarioEstado foreign key (idEstado) references Estado (idEstado)
alter table Sede add constraint fkSedeEstado foreign key (idEstado) references Estado (idEstado)
alter table Empleado add constraint fkEmpleadoGenero foreign key (idGenero) references Genero (idGenero)
alter table Empleado add constraint fkEmpleadoDepartamento foreign key (idDepartamento,idSede) references Departamento (idDepartamento,idSede)
alter table Empleado add constraint fkEmpleadoUsuario foreign key (idUsuario) references Usuario (idUsuario)
alter table Empleado add constraint fkEmpleadoEstado foreign key (idEstado) references Estado (idEstado)
alter table Proveedor add constraint fkProveedorEstado foreign key (idEstado) references Estado (idEstado)
alter table Vehiculo add constraint fkVehiculoProveedor foreign key (idProveedor) references Proveedor (idProveedor)
alter table Vehiculo add constraint fkVehiculoTipoVehiculo foreign key (idTipoVehiculo) references TipoVehiculo (idTipoVehiculo)
alter table Campana add constraint fkCampanaTipoCampana foreign key (idTipoCampana) references TipoCampana (idTipoCampana)
alter table Campana add constraint fkCampanaSede foreign key (idSede) references Sede (idSede)
alter table Campana add constraint fkCampanaEstadoCampana foreign key (idEstadoCampana) references EstadoCampana (idEstadoCampana)
alter table Campana add constraint fkCampanaEmpleadoCreador foreign key (idEmpleadoCreador) references Empleado (idEmpleado)
alter table Campana add constraint fkCampanaEmpleadoAprueba foreign key (idEmpleadoAprueba) references Empleado (idEmpleado)
alter table EncabezadoCotizacion add constraint fkEncabezadoCotizacionCliente foreign key (idCliente) references Cliente (idCliente)
alter table EncabezadoCotizacion add constraint fkEncabezadoCotizacionEmpleado foreign key (idEmpleado) references Empleado (idEmpleado)
alter table EncabezadoCotizacion add constraint fkEncabezadoCotizacionCampana foreign key (idCampana) references Campana (idCampana)
alter table EncabezadoCotizacion add constraint fkEncabezadoCotizacionEstadoCotizacion foreign key (idEstadoCotizacion) references EstadoCotizacion (idEstadoCotizacion)
alter table DetalleCotizacion add constraint fkDetalleCotizacionEncabezadoCotizacion foreign key (idEncabezadoCotizacion) references EncabezadoCotizacion (idEncabezadoCotizacion)
alter table DetalleCotizacion add constraint fkDetalleCotizacionVehiculo foreign key (idVehiculo) references Vehiculo (idVehiculo)
alter table Canton add constraint fkCantonProvincia foreign key (idProvincia) references Provincia (idProvincia)
alter table Distrito add constraint fkCantonDistrito foreign key (idCanton,idProvincia) references Canton (idCanton,idProvincia)
alter table Cliente add constraint fkClienteTipoCliente foreign key (idTipoCliente) references TipoCliente (idTipoCliente)
alter table Cliente add constraint fkClienteGenero foreign key (idGenero) references Genero (idGenero)
alter table Cliente add constraint fkClienteOcupacion foreign key (idOcupacion) references Ocupacion (idOcupacion)
alter table Cliente add constraint fkClienteEstadoCliente foreign key (idEstadoCliente) references EstadoCliente (idEstadoCliente)
alter table Bitacora add constraint fkBitacoraUsuario foreign key (idUsuario) references Usuario (idUsuario)
alter table Bitacora add constraint fkBitacoraEstadoModificacion foreign key (idEstadoModificacion) references EstadoModificacion(idEstadoModificacion)

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

insert into Distrito values(1,1,1,'Carmen')
insert into Distrito values(2,1,1,'Merced')
insert into Distrito values(3,1,1,'Hospital')
insert into Distrito values(4,1,1,'Catedral')
insert into Distrito values(5,1,1,'Zapote')
insert into Distrito values(6,1,1,'San Francisco De Dos Ríos')
insert into Distrito values(7,1,1,'Uruca')
insert into Distrito values(8,1,1,'Mata Redonda')
insert into Distrito values(9,1,1,'Pavas')
insert into Distrito values(10,1,1,'Hatillo')
insert into Distrito values(11,1,1,'San Sebastián')
insert into Distrito values(1,2,1,'Escazú')
insert into Distrito values(2,2,1,'San Antonio')
insert into Distrito values(3,2,1,'San Rafael')
insert into Distrito values(1,3,1,'Desamparados')
insert into Distrito values(2,3,1,'San Miguel')
insert into Distrito values(3,3,1,'San Juan De Dios')
insert into Distrito values(4,3,1,'San Rafael Arriba')
insert into Distrito values(5,3,1,'San Antonio')
insert into Distrito values(6,3,1,'Frailes')
insert into Distrito values(7,3,1,'Patarrá')
insert into Distrito values(8,3,1,'San Cristóbal')
insert into Distrito values(9,3,1,'Rosario')
insert into Distrito values(10,3,1,'Damas')
insert into Distrito values(11,3,1,'San Rafael Abajo')
insert into Distrito values(12,3,1,'Gravilias')
insert into Distrito values(13,3,1,'Los Guido')
insert into Distrito values(1,4,1,'Santiago')
insert into Distrito values(2,4,1,'Mercedes Sur')
insert into Distrito values(3,4,1,'Barbacoas')
insert into Distrito values(4,4,1,'Grifo Alto')
insert into Distrito values(5,4,1,'San Rafael')
insert into Distrito values(6,4,1,'Candelarita')
insert into Distrito values(7,4,1,'Desamparaditos')
insert into Distrito values(8,4,1,'San Antonio')
insert into Distrito values(9,4,1,'Chires')
insert into Distrito values(1,5,1,'San Marcos')
insert into Distrito values(2,5,1,'San Lorenzo')
insert into Distrito values(3,5,1,'San Carlos')
insert into Distrito values(1,6,1,'Aserri')
insert into Distrito values(2,6,1,'Tarbaca')
insert into Distrito values(3,6,1,'Vuelta De Jorco')
insert into Distrito values(4,6,1,'San Gabriel')
insert into Distrito values(5,6,1,'Legua')
insert into Distrito values(6,6,1,'Monterrey')
insert into Distrito values(7,6,1,'Salitrillos')
insert into Distrito values(1,7,1,'Colón')
insert into Distrito values(2,7,1,'Guayabo')
insert into Distrito values(3,7,1,'Tabarcia')
insert into Distrito values(4,7,1,'Piedras Negras')
insert into Distrito values(5,7,1,'Picagres')
insert into Distrito values(6,7,1,'Jaris')
insert into Distrito values(7,7,1,'Quitirrisi')
insert into Distrito values(1,8,1,'Guadalupe')
insert into Distrito values(2,8,1,'San Francisco')
insert into Distrito values(3,8,1,'Calle Blancos')
insert into Distrito values(4,8,1,'Mata De Plátano')
insert into Distrito values(5,8,1,'Ipís')
insert into Distrito values(6,8,1,'Rancho Redondo')
insert into Distrito values(7,8,1,'Purral')
insert into Distrito values(1,9,1,'Santa Ana')
insert into Distrito values(2,9,1,'Salitral')
insert into Distrito values(3,9,1,'Pozos')
insert into Distrito values(4,9,1,'Uruca')
insert into Distrito values(5,9,1,'Piedades')
insert into Distrito values(6,9,1,'Brasil')
insert into Distrito values(1,10,1,'Alajuelita')
insert into Distrito values(2,10,1,'San Josecito')
insert into Distrito values(3,10,1,'San Antonio')
insert into Distrito values(4,10,1,'Concepción')
insert into Distrito values(5,10,1,'San Felipe')
insert into Distrito values(1,11,1,'San Isidro')
insert into Distrito values(2,11,1,'San Rafael')
insert into Distrito values(3,11,1,'Dulce Nombre De Jesús')
insert into Distrito values(4,11,1,'Patalillo')
insert into Distrito values(5,11,1,'Cascajal')
insert into Distrito values(1,12,1,'San Ignacio')
insert into Distrito values(2,12,1,'Guaitil Villa')
insert into Distrito values(3,12,1,'Palmichal')
insert into Distrito values(4,12,1,'Cangrejal')
insert into Distrito values(5,12,1,'Sabanillas')
insert into Distrito values(1,13,1,'San Juan')
insert into Distrito values(2,13,1,'Cinco Esquinas')
insert into Distrito values(3,13,1,'Anselmo Llorente')
insert into Distrito values(4,13,1,'Leon Xiii')
insert into Distrito values(5,13,1,'Colima')
insert into Distrito values(1,14,1,'San Vicente')
insert into Distrito values(2,14,1,'San Jerónimo')
insert into Distrito values(3,14,1,'La Trinidad')
insert into Distrito values(1,15,1,'San Pedro')
insert into Distrito values(2,15,1,'Sabanilla')
insert into Distrito values(3,15,1,'Mercedes')
insert into Distrito values(4,15,1,'San Rafael')
insert into Distrito values(1,16,1,'San Pablo')
insert into Distrito values(2,16,1,'San Pedro')
insert into Distrito values(3,16,1,'San Juan De Mata')
insert into Distrito values(4,16,1,'San Luis')
insert into Distrito values(5,16,1,'Carara')
insert into Distrito values(1,17,1,'Santa María')
insert into Distrito values(2,17,1,'Jardín')
insert into Distrito values(3,17,1,'Copey')
insert into Distrito values(1,18,1,'Curridabat')
insert into Distrito values(2,18,1,'Granadilla')
insert into Distrito values(3,18,1,'Sánchez')
insert into Distrito values(4,18,1,'Tirrases')
insert into Distrito values(1,19,1,'San Isidro De El General')
insert into Distrito values(2,19,1,'El General')
insert into Distrito values(3,19,1,'Daniel Flores')
insert into Distrito values(4,19,1,'Rivas')
insert into Distrito values(5,19,1,'San Pedro')
insert into Distrito values(6,19,1,'Platanares')
insert into Distrito values(7,19,1,'Pejibaye')
insert into Distrito values(8,19,1,'Cajón')
insert into Distrito values(9,19,1,'Barú')
insert into Distrito values(10,19,1,'Río Nuevo')
insert into Distrito values(11,19,1,'Páramo')
insert into Distrito values(1,20,1,'San Pablo')
insert into Distrito values(2,20,1,'San Andrés')
insert into Distrito values(3,20,1,'Llano Bonito')
insert into Distrito values(4,20,1,'San Isidro')
insert into Distrito values(5,20,1,'Santa Cruz')
insert into Distrito values(6,20,1,'San Antonio')
insert into Distrito values(1,1,2,'Alajuela')
insert into Distrito values(2,1,2,'San José')
insert into Distrito values(3,1,2,'Carrizal')
insert into Distrito values(4,1,2,'San Antonio')
insert into Distrito values(5,1,2,'Guácima')
insert into Distrito values(6,1,2,'San Isidro')
insert into Distrito values(7,1,2,'Sabanilla')
insert into Distrito values(8,1,2,'San Rafael')
insert into Distrito values(9,1,2,'Río Segundo')
insert into Distrito values(10,1,2,'Desamparados')
insert into Distrito values(12,1,2,'Tambor')
insert into Distrito values(13,1,2,'Garita')
insert into Distrito values(14,1,2,'Sarapiquí')
insert into Distrito values(11,1,2,'Turrúcares')
insert into Distrito values(1,2,2,'San Ramón')
insert into Distrito values(2,2,2,'Santiago')
insert into Distrito values(3,2,2,'San Juan')
insert into Distrito values(4,2,2,'Piedades Norte')
insert into Distrito values(5,2,2,'Piedades Sur')
insert into Distrito values(6,2,2,'San Rafael')
insert into Distrito values(7,2,2,'San Isidro')
insert into Distrito values(8,2,2,'Ángeles')
insert into Distrito values(9,2,2,'Alfaro')
insert into Distrito values(10,2,2,'Volio')
insert into Distrito values(11,2,2,'Concepción')
insert into Distrito values(12,2,2,'Zapotal')
insert into Distrito values(13,2,2,'Peñas Blancas')
insert into Distrito values(1,3,2,'Grecia')
insert into Distrito values(2,3,2,'San Isidro')
insert into Distrito values(3,3,2,'San José')
insert into Distrito values(4,3,2,'San Roque')
insert into Distrito values(5,3,2,'Tacares')
insert into Distrito values(6,3,2,'Río Cuarto')
insert into Distrito values(7,3,2,'Puente De Piedra')
insert into Distrito values(8,3,2,'Bolívar')
insert into Distrito values(1,4,2,'San Mateo')
insert into Distrito values(2,4,2,'Desmonte')
insert into Distrito values(3,4,2,'Jesús María')
insert into Distrito values(4,4,2,'Labrador')
insert into Distrito values(1,5,2,'Atenas')
insert into Distrito values(2,5,2,'Jesús')
insert into Distrito values(3,5,2,'Mercedes')
insert into Distrito values(4,5,2,'San Isidro')
insert into Distrito values(5,5,2,'Concepción')
insert into Distrito values(6,5,2,'San Jose')
insert into Distrito values(7,5,2,'Santa Eulalia')
insert into Distrito values(8,5,2,'Escobal')
insert into Distrito values(1,6,2,'Naranjo')
insert into Distrito values(2,6,2,'San Miguel')
insert into Distrito values(3,6,2,'San José')
insert into Distrito values(4,6,2,'Cirrí Sur')
insert into Distrito values(5,6,2,'San Jerónimo')
insert into Distrito values(6,6,2,'San Juan')
insert into Distrito values(7,6,2,'El Rosario')
insert into Distrito values(8,6,2,'Palmitos')
insert into Distrito values(1,7,2,'Palmares')
insert into Distrito values(2,7,2,'Zaragoza')
insert into Distrito values(3,7,2,'Buenos Aires')
insert into Distrito values(4,7,2,'Santiago')
insert into Distrito values(5,7,2,'Candelaria')
insert into Distrito values(6,7,2,'Esquípulas')
insert into Distrito values(7,7,2,'La Granja')
insert into Distrito values(1,8,2,'San Pedro')
insert into Distrito values(2,8,2,'San Juan')
insert into Distrito values(3,8,2,'San Rafael')
insert into Distrito values(4,8,2,'Carrillos')
insert into Distrito values(5,8,2,'Sabana Redonda')
insert into Distrito values(1,9,2,'Orotina')
insert into Distrito values(2,9,2,'El Mastate')
insert into Distrito values(3,9,2,'Hacienda Vieja')
insert into Distrito values(4,9,2,'Coyolar')
insert into Distrito values(5,9,2,'La Ceiba')
insert into Distrito values(1,10,2,'Quesada')
insert into Distrito values(2,10,2,'Florencia')
insert into Distrito values(3,10,2,'Buenavista')
insert into Distrito values(4,10,2,'Aguas Zarcas')
insert into Distrito values(5,10,2,'Venecia')
insert into Distrito values(6,10,2,'Pital')
insert into Distrito values(7,10,2,'La Fortuna')
insert into Distrito values(8,10,2,'La Tigra')
insert into Distrito values(9,10,2,'La Palmera')
insert into Distrito values(10,10,2,'Venado')
insert into Distrito values(11,10,2,'Cutris')
insert into Distrito values(12,10,2,'Monterrey')
insert into Distrito values(13,10,2,'Pocosol')
insert into Distrito values(1,11,2,'Zarcero')
insert into Distrito values(2,11,2,'Laguna')
insert into Distrito values(4,11,2,'Guadalupe')
insert into Distrito values(5,11,2,'Palmira')
insert into Distrito values(6,11,2,'Zapote')
insert into Distrito values(7,11,2,'Brisas')
insert into Distrito values(1,12,2,'Sarchí Norte')
insert into Distrito values(2,12,2,'Sarchí Sur')
insert into Distrito values(3,12,2,'Toro Amarillo')
insert into Distrito values(4,12,2,'San Pedro')
insert into Distrito values(5,12,2,'Rodríguez')
insert into Distrito values(1,13,2,'Upala')
insert into Distrito values(2,13,2,'Aguas Claras')
insert into Distrito values(3,13,2,'San José O Pizote')
insert into Distrito values(4,13,2,'Bijagua')
insert into Distrito values(5,13,2,'Delicias')
insert into Distrito values(6,13,2,'Dos Ríos')
insert into Distrito values(7,13,2,'Yolillal')
insert into Distrito values(8,13,2,'Canalete')
insert into Distrito values(1,14,2,'Los Chiles')
insert into Distrito values(2,14,2,'Caño Negro')
insert into Distrito values(3,14,2,'El Amparo')
insert into Distrito values(4,14,2,'San Jorge')
insert into Distrito values(2,15,2,'Buenavista')
insert into Distrito values(3,15,2,'Cote')
insert into Distrito values(4,15,2,'Katira')
insert into Distrito values(1,1,3,'Oriental')
insert into Distrito values(2,1,3,'Occidental')
insert into Distrito values(3,1,3,'Carmen')
insert into Distrito values(4,1,3,'San Nicolás')
insert into Distrito values(5,1,3,'Aguacaliente O San Francisco')
insert into Distrito values(6,1,3,'Guadalupe O Arenilla')
insert into Distrito values(7,1,3,'Corralillo')
insert into Distrito values(8,1,3,'Tierra Blanca')
insert into Distrito values(9,1,3,'Dulce Nombre')
insert into Distrito values(10,1,3,'Llano Grande')
insert into Distrito values(11,1,3,'Quebradilla')
insert into Distrito values(1,2,3,'Paraíso')
insert into Distrito values(2,2,3,'Santiago')
insert into Distrito values(3,2,3,'Orosi')
insert into Distrito values(4,2,3,'Cachí')
insert into Distrito values(5,2,3,'Llanos De Santa Lucía')
insert into Distrito values(1,3,3,'Tres Ríos')
insert into Distrito values(2,3,3,'San Diego')
insert into Distrito values(3,3,3,'San Juan')
insert into Distrito values(4,3,3,'San Rafael')
insert into Distrito values(5,3,3,'Concepción')
insert into Distrito values(6,3,3,'Dulce Nombre')
insert into Distrito values(7,3,3,'San Ramón')
insert into Distrito values(8,3,3,'Río Azul')
insert into Distrito values(1,4,3,'Juan Viñas')
insert into Distrito values(2,4,3,'Tucurrique')
insert into Distrito values(3,4,3,'Pejibaye')
insert into Distrito values(1,5,3,'Turrialba')
insert into Distrito values(2,5,3,'La Suiza')
insert into Distrito values(3,5,3,'Peralta')
insert into Distrito values(4,5,3,'Santa Cruz')
insert into Distrito values(5,5,3,'Santa Teresita')
insert into Distrito values(6,5,3,'Pavones')
insert into Distrito values(7,5,3,'Tuis')
insert into Distrito values(8,5,3,'Tayutic')
insert into Distrito values(9,5,3,'Santa Rosa')
insert into Distrito values(10,5,3,'Tres Equis')
insert into Distrito values(11,5,3,'La Isabel')
insert into Distrito values(12,5,3,'Chirripó')
insert into Distrito values(1,6,3,'Pacayas')
insert into Distrito values(2,6,3,'Cervantes')
insert into Distrito values(3,6,3,'Capellades')
insert into Distrito values(1,7,3,'San Rafael')
insert into Distrito values(2,7,3,'Cot')
insert into Distrito values(3,7,3,'Potrero Cerrado')
insert into Distrito values(4,7,3,'Cipreses')
insert into Distrito values(5,7,3,'Santa Rosa')
insert into Distrito values(1,8,3,'El Tejar')
insert into Distrito values(2,8,3,'San Isidro')
insert into Distrito values(3,8,3,'Tobosi')
insert into Distrito values(4,8,3,'Patio De Agua')
insert into Distrito values(1,1,4,'Heredia')
insert into Distrito values(2,1,4,'Mercedes')
insert into Distrito values(3,1,4,'San Francisco')
insert into Distrito values(4,1,4,'Ulloa')
insert into Distrito values(5,1,4,'Varablanca')
insert into Distrito values(1,2,4,'Barva')
insert into Distrito values(2,2,4,'San Pedro')
insert into Distrito values(3,2,4,'San Pablo')
insert into Distrito values(4,2,4,'San Roque')
insert into Distrito values(5,2,4,'Santa Lucía')
insert into Distrito values(6,2,4,'San José De La Montaña')
insert into Distrito values(2,3,4,'San Vicente')
insert into Distrito values(3,3,4,'San Miguel')
insert into Distrito values(4,3,4,'Paracito')
insert into Distrito values(5,3,4,'Santo Tomás')
insert into Distrito values(6,3,4,'Santa Rosa')
insert into Distrito values(7,3,4,'Tures')
insert into Distrito values(8,3,4,'Pará')
insert into Distrito values(1,4,4,'Santa Bárbara')
insert into Distrito values(2,4,4,'San Pedro')
insert into Distrito values(3,4,4,'San Juan')
insert into Distrito values(4,4,4,'Jesús')
insert into Distrito values(5,4,4,'Santo Domingo')
insert into Distrito values(6,4,4,'Purabá')
insert into Distrito values(1,5,4,'San Rafael')
insert into Distrito values(2,5,4,'San Josecito')
insert into Distrito values(3,5,4,'Santiago')
insert into Distrito values(4,5,4,'Ángeles')
insert into Distrito values(5,5,4,'Concepción')
insert into Distrito values(1,6,4,'San Isidro')
insert into Distrito values(2,6,4,'San José')
insert into Distrito values(3,6,4,'Concepción')
insert into Distrito values(4,6,4,'San Francisco')
insert into Distrito values(1,7,4,'San Antonio')
insert into Distrito values(2,7,4,'La Ribera')
insert into Distrito values(3,7,4,'La Asunción')
insert into Distrito values(1,8,4,'San Joaquín')
insert into Distrito values(2,8,4,'Barrantes')
insert into Distrito values(3,8,4,'Llorente')
insert into Distrito values(1,9,4,'San Pablo')
insert into Distrito values(1,10,4,'Puerto Viejo')
insert into Distrito values(2,10,4,'La Virgen')
insert into Distrito values(3,10,4,'Las Horquetas')
insert into Distrito values(4,10,4,'Llanuras Del Gaspar')
insert into Distrito values(5,10,4,'Cureña')
insert into Distrito values(1,1,5,'Liberia')
insert into Distrito values(2,1,5,'Cañas Dulces')
insert into Distrito values(3,1,5,'Mayorga')
insert into Distrito values(4,1,5,'Nacascolo')
insert into Distrito values(5,1,5,'Curubandé')
insert into Distrito values(1,2,5,'Nicoya')
insert into Distrito values(2,2,5,'Mansión')
insert into Distrito values(3,2,5,'San Antonio')
insert into Distrito values(4,2,5,'Quebrada Honda')
insert into Distrito values(5,2,5,'Sámara')
insert into Distrito values(6,2,5,'Nosara')
insert into Distrito values(7,2,5,'Belén De Nosarita')
insert into Distrito values(1,3,5,'Santa Cruz')
insert into Distrito values(2,3,5,'Bolsón')
insert into Distrito values(3,3,5,'Veintisiete De Abril')
insert into Distrito values(4,3,5,'Tempate')
insert into Distrito values(5,3,5,'Cartagena')
insert into Distrito values(6,3,5,'Cuajiniquil')
insert into Distrito values(7,3,5,'Diriá')
insert into Distrito values(8,3,5,'Cabo Velas')
insert into Distrito values(9,3,5,'Tamarindo')
insert into Distrito values(1,4,5,'Bagaces')
insert into Distrito values(2,4,5,'La Fortuna')
insert into Distrito values(3,4,5,'Mogote')
insert into Distrito values(4,4,5,'Río Naranjo')
insert into Distrito values(1,5,5,'Filadelfia')
insert into Distrito values(2,5,5,'Palmira')
insert into Distrito values(3,5,5,'Sardinal')
insert into Distrito values(4,5,5,'Belén')
insert into Distrito values(1,6,5,'Cañas')
insert into Distrito values(2,6,5,'Palmira')
insert into Distrito values(3,6,5,'San Miguel')
insert into Distrito values(4,6,5,'Bebedero')
insert into Distrito values(5,6,5,'Porozal')
insert into Distrito values(1,7,5,'Las Juntas')
insert into Distrito values(2,7,5,'Sierra')
insert into Distrito values(3,7,5,'San Juan')
insert into Distrito values(4,7,5,'Colorado')
insert into Distrito values(1,8,5,'Tilarán')
insert into Distrito values(2,8,5,'Quebrada Grande')
insert into Distrito values(3,8,5,'Tronadora')
insert into Distrito values(4,8,5,'Santa Rosa')
insert into Distrito values(5,8,5,'Líbano')
insert into Distrito values(6,8,5,'Tierras Morenas')
insert into Distrito values(7,8,5,'Arenal')
insert into Distrito values(1,9,5,'Carmona')
insert into Distrito values(2,9,5,'Santa Rita')
insert into Distrito values(3,9,5,'Zapotal')
insert into Distrito values(4,9,5,'San Pablo')
insert into Distrito values(5,9,5,'Porvenir')
insert into Distrito values(6,9,5,'Bejuco')
insert into Distrito values(1,10,5,'La Cruz')
insert into Distrito values(2,10,5,'Santa Cecilia')
insert into Distrito values(3,10,5,'La Garita')
insert into Distrito values(4,10,5,'Santa Elena')
insert into Distrito values(1,11,5,'Hojancha')
insert into Distrito values(2,11,5,'Monte Romo')
insert into Distrito values(3,11,5,'Puerto Carrillo')
insert into Distrito values(4,11,5,'Huacas')
insert into Distrito values(1,1,6,'Puntarenas')
insert into Distrito values(2,1,6,'Pitahaya')
insert into Distrito values(3,1,6,'Chomes')
insert into Distrito values(4,1,6,'Lepanto')
insert into Distrito values(5,1,6,'Paquera')
insert into Distrito values(6,1,6,'Manzanillo')
insert into Distrito values(7,1,6,'Guacimal')
insert into Distrito values(8,1,6,'Barranca')
insert into Distrito values(9,1,6,'Monte Verde')
insert into Distrito values(11,1,6,'Cóbano')
insert into Distrito values(12,1,6,'Chacarita')
insert into Distrito values(13,1,6,'Chira')
insert into Distrito values(14,1,6,'Acapulco')
insert into Distrito values(15,1,6,'El Roble')
insert into Distrito values(16,1,6,'Arancibia')
insert into Distrito values(1,2,6,'Espíritu Santo')
insert into Distrito values(2,2,6,'San Juan Grande')
insert into Distrito values(3,2,6,'Macacona')
insert into Distrito values(4,2,6,'San Rafael')
insert into Distrito values(5,2,6,'San Jerónimo')
insert into Distrito values(6,2,6,'Caldera')
insert into Distrito values(1,3,6,'Buenos Aires')
insert into Distrito values(2,3,6,'Volcán')
insert into Distrito values(3,3,6,'Potrero Grande')
insert into Distrito values(4,3,6,'Boruca')
insert into Distrito values(5,3,6,'Pilas')
insert into Distrito values(6,3,6,'Colinas')
insert into Distrito values(7,3,6,'Chánguena')
insert into Distrito values(8,3,6,'Biolley')
insert into Distrito values(9,3,6,'Brunka')
insert into Distrito values(1,4,6,'Miramar')
insert into Distrito values(2,4,6,'La Unión')
insert into Distrito values(3,4,6,'San Isidro')
insert into Distrito values(1,5,6,'Puerto Cortés')
insert into Distrito values(2,5,6,'Palmar')
insert into Distrito values(3,5,6,'Sierpe')
insert into Distrito values(4,5,6,'Bahía Ballena')
insert into Distrito values(5,5,6,'Piedras Blancas')
insert into Distrito values(6,5,6,'Bahía Drake')
insert into Distrito values(1,6,6,'Quepos')
insert into Distrito values(2,6,6,'Savegre')
insert into Distrito values(3,6,6,'Naranjito')
insert into Distrito values(1,7,6,'Golfito')
insert into Distrito values(2,7,6,'Puerto Jiménez')
insert into Distrito values(3,7,6,'Guaycará')
insert into Distrito values(4,7,6,'Pavón')
insert into Distrito values(1,8,6,'San Vito')
insert into Distrito values(2,8,6,'Sabalito')
insert into Distrito values(3,8,6,'Aguabuena')
insert into Distrito values(4,8,6,'Limoncito')
insert into Distrito values(5,8,6,'Pittier')
insert into Distrito values(6,8,6,'Gutierrez Braun')
insert into Distrito values(1,9,6,'Parrita')
insert into Distrito values(1,10,6,'Corredor')
insert into Distrito values(2,10,6,'La Cuesta')
insert into Distrito values(3,10,6,'Canoas')
insert into Distrito values(4,10,6,'Laurel')
insert into Distrito values(1,11,6,'Jacó')
insert into Distrito values(2,11,6,'Tárcoles')
insert into Distrito values(1,1,7,'Limón')
insert into Distrito values(2,1,7,'Valle La Estrella')
insert into Distrito values(4,1,7,'Matama')
insert into Distrito values(1,2,7,'Guápiles')
insert into Distrito values(2,2,7,'Jiménez')
insert into Distrito values(3,2,7,'Rita')
insert into Distrito values(4,2,7,'Roxana')
insert into Distrito values(5,2,7,'Cariari')
insert into Distrito values(6,2,7,'Colorado')
insert into Distrito values(7,2,7,'La Colonia')
insert into Distrito values(1,3,7,'Siquirres')
insert into Distrito values(2,3,7,'Pacuarito')
insert into Distrito values(3,3,7,'Florida')
insert into Distrito values(4,3,7,'Germania')
insert into Distrito values(5,3,7,'El Cairo')
insert into Distrito values(6,3,7,'Alegría')
insert into Distrito values(1,4,7,'Bratsi')
insert into Distrito values(2,4,7,'Sixaola')
insert into Distrito values(3,4,7,'Cahuita')
insert into Distrito values(4,4,7,'Telire')
insert into Distrito values(1,5,7,'Matina')
insert into Distrito values(2,5,7,'Batán')
insert into Distrito values(3,5,7,'Carrandi')
insert into Distrito values(1,6,7,'Guácimo')
insert into Distrito values(2,6,7,'Mercedes')
insert into Distrito values(3,6,7,'Pocora')
insert into Distrito values(4,6,7,'Río Jiménez')
insert into Distrito values(5,6,7,'Duacarí')

insert into Genero values('-','No indica')
insert into Genero values('M','Masculino')
insert into Genero values('F','Femenino')

select * from Estado
select * from Usuario
select * from Sede
select * from Departamento
select * from Genero
select * from Empleado
select * from TipoVehiculo
select * from Proveedor
select * from Vehiculo
select * from EstadoCampana
select * from TipoCampana
select * from Campana
select * from EstadoCotizacion
select * from EncabezadoCotizacion
select * from DetalleCotizacion
select * from Provincia
select * from Canton
select * from Distrito
select * from Ocupacion
select * from EstadoCliente
select * from TipoCliente
select * from Cliente
select * from EstadoModificacion
select * from Bitacora