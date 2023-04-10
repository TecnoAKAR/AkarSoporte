drop database if exists AKAR;
create database AKAR;
use AKAR;
create table Usuario(
idUsuario int primary key auto_increment, Nombre varchar(40), 
 ApellidoP varchar(40), ApellidoM varchar(40), Correo varchar(40), Contrasena varchar(40),
 NomUsuario varchar(40), Fecha date
);


create table Reporte(
idReporte int primary key auto_increment, Problema varchar(1024),
Estatus varchar(40), Solucion varchar(1024), FechaI datetime, FechaF datetime);

create table ReporteCambios(
idReporteCambios int primary key auto_increment,
idUsuario int, idReporte int, FechaCambio datetime,
EstatusI varchar(40), EstatusF varchar(40), 
foreign key (idUsuario) references Usuario(idUsuario),
foreign key (idReporte) references Reporte(idReporte));

create table RelReporteEncargado(
idRelReporteEncargado int primary key auto_increment,
idEncargado int, idReporte int,
foreign key (idEncargado) references Usuario(idUsuario),
foreign key (idReporte) references Reporte(idReporte));

create table RelReporteUsuario(
idRelReporteUsuario int primary key auto_increment,
idUsuario int, idReporte int, 
foreign key (idUsuario) references Usuario(idUsuario),
foreign key (idReporte) references Reporte(idReporte));	


create table TipoUsuario(
idTipo int primary key auto_increment,
Tipo varchar(40));

create table RelTipoUsuario(
idRelTipoUsuario int primary key auto_increment,
idUsuario int, idTipo int,
foreign key (idUsuario) references Usuario(idUsuario),
foreign key (idTipo) references TipoUsuario(idTipo)
);

create table Juego(
idJuego int primary key auto_increment,
NombreJuego varchar(40));

create table RelJuegoUsuario(
idRelJuegoUsuario int primary key auto_increment,
idJuego int,idUsuario int,puntaje int,
foreign key (idJuego) references Juego(idJuego),
foreign key (idUsuario) references Usuario(idUsuario));

create table msjForo(
idMensaje int primary key auto_increment,
idAutor int,
Mensaje  varchar(300),
Hora datetime,
foreign key(idAutor) references Usuario(idUsuario) );

create table Chat(
idChat int primary key auto_increment,
idUsuario1 int, idUsuario2 int,
foreign key (idUsuario1) references Usuario(idUsuario),
foreign key (idUsuario2) references Usuario(idUsuario));


create table RelChatMensaje(
idRelChatMensaje int primary key auto_increment,
idChat int, idMensaje int,
foreign key(idChat) references Chat(idChat),
foreign key(idMensaje) references msjForo(idMensaje));

create table RelTutorUCSA(
idRelTutorUCSA int primary key auto_increment,
idUsuario1 int, idUsuario2 int,
foreign key (idUsuario1) references Usuario(idUsuario),
foreign key (idUsuario2) references Usuario(idUsuario));

create table resPass(
	idToken int primary key auto_increment,
    token varchar(43) not null,
    exp timestamp not null
);

create table RelUsuarioResPass(
	idRelUsRess int primary key auto_increment,
    idUsuario int,
    idResPass int,
    foreign key(idUsuario) references Usuario(idUsuario),
    foreign key(idResPass) references resPass(idToken)
);

insert into TipoUsuario (Tipo) values ('Psicólogo'), ('UCSA'),('Tutor'),('Externo'),
('Asistente'),('Gerente de Soporte'),('Ingeniero de Soporte'),('Gerente de Mantenimiento'),('Ingeniero de Mantenimiento'), ('Administrador');







