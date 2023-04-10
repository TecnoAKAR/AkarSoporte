use AKAR;
drop procedure if exists sp_Registro;
drop procedure if exists sp_asis;
drop procedure if exists sp_Login;
drop procedure if exists sp_Registromenordeedad;
drop procedure if exists sp_ActualizarUsuario;
drop procedure if exists sp_ActualizarContrasena;
drop procedure if exists sp_asignarToken;
drop procedure if exists sp_recDatosToken;
drop procedure if exists sp_MsjForo;
drop procedure if exists sp_getMsjF;
drop procedure if exists sp_getMsjF;
drop procedure if exists sp_soporte;
drop procedure if exists sp_mantenimiento;
drop procedure if exists sp_GerenteSopIng;
drop procedure if exists sp_GerenteSopMan;
drop procedure if exists sp_GerenteManSop;
drop procedure if exists sp_GerenteManIng;
drop procedure if exists sp_addReporte;
delimiter //

create procedure sp_Registro( in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), fecha date, correo nvarchar(50),contrasena nvarchar (50), usuario nvarchar(50),tipo int)
begin
declare xIdPersona int;
declare xIdTipo int;
declare existe int;
declare xMsj nvarchar(50);
	set existe=(select count(*) from usuario where Usuario.Correo=correo or Usuario.NomUsuario = usuario);
    if (existe=0) then
		insert into Usuario( Nombre, ApellidoP, ApellidoM, Correo, Contrasena, NomUsuario, Fecha)
		values (nom, pat, mat, correo, sha(contrasena), usuario, fecha);
		set xIdPersona=( select idUsuario from Usuario where Nombre= nom and ApellidoP= pat);
		set xIdTipo= tipo;
		insert into RelTipoUsuario( idUsuario, idTipo) values (xIdPersona,xIdTipo);
        select RelTipoUsuario.idRelTipoUsuario, 
    RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre, Usuario.ApellidoP, 
    Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario  from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
	else
		if(existe>0)then
		set xMsj="Usuario o correo en uso";
        select xMsj;
end if;
end if;
end; //

create procedure sp_Login(in nomU nvarchar(50),contrasenaP nvarchar(50))
begin
declare xidPersona int;
declare existe int;
declare xMsj nvarchar(50);
declare xContraSha nvarchar(200);
set xContraSha =(select sha(contrasenaP));
		set existe=(select count(*) from Usuario where NomUsuario=nomU and Contrasena=xContraSha);
        if(existe=0) then
			set xMsj="No existe usuario";
        else
			if(existe = 1)then
				set xidPersona=(select idUsuario from Usuario where NomUsuario=nomU and Contrasena = xContraSha );
				select RelTipoUsuario.idRelTipoUsuario, RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre,Usuario.ApellidoP, Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
		end if;
        end if;
end; //

create procedure sp_Registromenordeedad ( in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), fecha date, correo nvarchar(50),contrasena nvarchar (50), usuario nvarchar(50), tipo int, correo2 nvarchar(50))
begin
declare xIdPersona int;
declare xIdPersona2 int;
declare xIdTipo int;
declare existe int;
declare menorexist int;
declare tutorexist int;
declare xMsj nvarchar(50);
    set tutorexist = (select count(*) from Usuario where Usuario.Correo=correo2);
    set menorexist = (select count(*) from Usuario where Usuario.Correo=correo or Usuario.NomUsuario = usuario);
			if(tutorexist>0 and menorexist=0)then
			insert into Usuario( Nombre, ApellidoP, ApellidoM, Correo, Contrasena, NomUsuario, Fecha)
			values (nom, pat, mat, correo, sha(contrasena), usuario, fecha);
			set xIdPersona=( select idUsuario from Usuario where NomUsuario = usuario and Usuario.Correo = correo);
			set xIdPersona2=( select idUsuario from Usuario where Usuario.Correo = correo2);
			set xIdTipo= tipo;
			insert into RelTipoUsuario( idUsuario, idTipo) values (xIdPersona,xIdTipo);
			insert into RelTutorUCSA ( idUsuario1, idUsuario2) values( xIdPersona,xIdPersona2);
			select RelTipoUsuario.idRelTipoUsuario, RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre,Usuario.ApellidoP, Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
			else
				if(tutorexist=0)then
					set xMsj= "El tutor no existe";
					select xMsj;
                    end if;
				if(menorexist=1)then
					set xMsj= "El usuario ya existe";
					select xMsj;
end if;
end if;  
end; //


create procedure sp_ActualizarUsuario(in nom nvarchar(50), pat nvarchar(50),
mat nvarchar(50), usuario nvarchar(50), idpersona varchar(50))
begin
declare xIdPersona int;
declare xContraSha nvarchar(200);
	set xIdPersona= idpersona;	
	update Usuario set Nombre=nom , ApellidoP = pat, ApellidoM = mat , NomUsuario= usuario where idUsuario=xIdPersona;
        select RelTipoUsuario.idRelTipoUsuario, RelTipoUsuario.idUsuario, RelTipoUsuario.idTipo, Usuario.Nombre,Usuario.ApellidoP, Usuario.ApellidoM, Usuario.Correo, Usuario.NomUsuario from RelTipoUsuario inner join Usuario  on RelTipoUsuario.idUsuario = Usuario.idUsuario inner join TipoUsuario on RelTipoUsuario.idTipo = TipoUsuario.idTipo where RelTipoUsuario.idUsuario = xidPersona;
end;//

create procedure sp_ActualizarContrasena(in correo nvarchar(200), contrasena nvarchar (50))
begin
declare xIdUsuario nvarchar(200);
declare xContraSha nvarchar(200);
	set xIdUsuario = (select IdUsuario from usuario where Usuario.correo = correo);
	set xContraSha =(select sha(contrasena));
	update Usuario set Contrasena = xContraSha where Usuario.IdUsuario = xIdUsuario;
end;//

create procedure sp_asignarToken(in correo nvarchar(200), token nvarchar(43), creacion timestamp)
begin
declare xIdUsuario int;
declare xIdToken int;
declare xExp timestamp;
 set xIdUsuario = (select idUsuario from usuario where Usuario.Correo = correo);
 set xIdToken = (select ifnull(max(idToken), 0)+1 from resPass);
 set xExp = (select timestamp(creacion, '24:00:00'));
 insert into resPass values(xIdToken, token, xExp);
 insert into RelUsuarioResPass(idUsuario, idResPass) values(xIdUsuario, xIdToken);
end;//

create procedure sp_recDatosToken(token nvarchar(43))
begin
declare xIdToken int;
set xIdToken = (select idToken from ResPass where ResPass.Token = token);
select Usuario.correo, respass.token, respass.exp from relusuariorespass inner join usuario on relusuariorespass.idUsuario = usuario.idUsuario inner join resPass on relusuariorespass.idResPass = respass.idToken where relusuariorespass.idResPass = xIdToken;
end;//

create procedure sp_MsjForo(in msj nvarchar(300), idAutor int, fecha datetime)
begin
declare xIdMensaje int;
set xIdMensaje = (select ifnull(max(idMensaje), 0)+1 from msjForo);
insert into msjForo values(xIdMensaje, idAutor, msj, fecha);
end;//

create procedure sp_getMsjF()
begin
select Usuario.NomUsuario, msjForo.idMensaje, msjForo.Mensaje, msjForo.Hora from msjForo inner join usuario on msjForo.idAutor = usuario.idUsuario order by msjForo.idMensaje;
end;//

create procedure sp_GerenteSopIng(in problema nvarchar(1024), estatus nvarchar(40), nomEncargado nvarchar(40))
begin
declare xdIdEncargado int;
declare xdIdReporte int;
set xdIdEncargado=(select idUsuario from Usuario where Usuario.NomUsuario = nomEncargado);
set xdIdReporte=(select idReporte from Reporte where Reporte.Problema = problema);
insert into RelReporteEncargado(idEncargado, idReporte) values (xdIdEncargado, xdIdReporte);
insert into ReporteCambios(idUsuario, idReporte, FechaCambio, EstatusI, EstatusF) values (2, xdIdReporte, now(), 'Abierto', estatus);
update Reporte set Reporte.Estatus = estatus where idReporte = xdIdReporte; 
end;//   

create procedure sp_GerenteSopMan(in problema nvarchar(1024), estatus nvarchar(40), solucion nvarchar(1024), nomEncargado nvarchar(40))
begin
declare xdIdEncargado int;
declare xdIdReporte int;
set xdIdEncargado=(select idUsuario from Usuario where Usuario.NomUsuario=nomEncargado);
set xdIdReporte=(select idReporte from Reporte where Reporte.Problema=problema);
insert into RelReporteEncargado(idEncargado, idReporte) values (xdIdEncargado,xdIdReporte);
insert into ReporteCambios(idUsuario, idReporte, FechaCambio, EstatusI, EstatusF) values (2, xdIdReporte, now(), 'Abierto', estatus);
update Reporte set Reporte.Estatus=estatus where Reporte.idReporte = xdIdReporte; 
end;//   


create procedure sp_soporte(in idR int, idIng int, estatI nvarchar(20), estat nvarchar(20), sol nvarchar(1024), fFinal datetime, fCambio datetime)
begin
declare xIdRepCam int;
set xIdRepCam = (select ifnull(max(idReporteCambios), 0)+1 from ReporteCambios);
update Reporte set estatus = estat, solucion = sol, FechaF = fFinal where idReporte = idR;
insert into ReporteCambios values(xIdRepCam, idIng, idR, fCambio, estatI, estat);
end;//

create procedure sp_mantenimiento(in idR int, idIng int, estatI nvarchar(40), estat nvarchar(40), sol nvarchar(1024), fCambio datetime)
begin
declare xIdRepCam int;
set xIdRepCam = (select ifnull(max(idReporteCambios), 0)+1 from ReporteCambios);
update Reporte set estatus = estat, solucion = sol where idReporte = idR;
insert into ReporteCambios values(xIdRepCam, idIng, idR, fCambio, estatI, estat);
end;//


create procedure sp_GerenteManIng(in problema nvarchar(1024), estatus nvarchar(40), nomEncargado nvarchar(40))
begin
declare xdIdEncargado int;
declare xdIdReporte int;
set xdIdEncargado=(select idUsuario from Usuario where Usuario.NomUsuario=nomEncargado);
set xdIdReporte=(select idReporte from Reporte where Reporte.Problema=problema);
insert into RelReporteEncargado(idEncargado, idReporte) values (xdIdEncargado, xdIdReporte);
insert into ReporteCambios(idUsuario, idReporte, FechaCambio, EstatusI, EstatusF) values (4, xdIdReporte, now(), 'A Mantenimiento', estatus);
update Reporte set Reporte.Estatus=estatus where Reporte.idReporte=xdIdReporte; 
end;//   

create procedure sp_GerenteManSop(in problema nvarchar(1024), estatus nvarchar(40), solucion nvarchar(1024), nomEncargado nvarchar(40))
begin
declare xdIdEncargado int;
declare xdIdReporte int;
set xdIdEncargado=(select idUsuario from Usuario where Usuario.NomUsuario=nomEncargado);
set xdIdReporte=(select idReporte from Reporte where Reporte.Problema=problema);
insert into RelReporteEncargado(idEncargado, idReporte) values (xdIdEncargado,xdIdReporte);
insert into ReporteCambios(idUsuario, idReporte, FechaCambio, EstatusI, EstatusF) values (4, xdIdReporte, now(), 'En Mantenimiento', estatus);
update Reporte set Reporte.Estatus=estatus where Reporte.idReporte=xdIdReporte; 
end;//



create procedure sp_asis(in nomuser varchar(40), correouser varchar(40), problema varchar(1024), estatus varchar(40))
begin
declare xIdPersona int; 
declare xIdUsuario int;
declare xIdEncargado int;
insert into Reporte (Problema, Estatus, Solucion, FechaI, FechaF) values (problema, estatus, ' ', now(), ' ');
end;//

create procedure sp_addReporte(in prob nvarchar(200), est nvarchar(40), fI date, usuC nvarchar(200))
begin
declare xIdUsuario int;
declare xIdReo int;
set xIdUsuario = (select idUsuario from usuario where correo = usuC);
set xIdReo = (select ifnull(max(idReporte), 0)+1 from Reporte);
insert into Reporte(idReporte,Problema,Estatus,FechaI) values(xIdReo ,prob, est, fI);
insert into RelReporteUsuario(idUsuario, idReporte) values(xIdUsuario, xIdReo);
end;//

delimiter ;

call sp_Registro('Aranza Paulina', 'Labra','Garcia', '2004-05-24','aranza@gmail.com','asistente','ARANZA',5); 
call sp_Registro('Kalid', 'Avila','Ponce', '2004-07-24','kalid@gmail.com','gerentedesoporte','KALID',6);
call sp_Registro('Luis Axel', 'Zarate','Lozano', '2004-06-11','luis@gmail.com','ingenierodesoporte','LUIS AXEL',7);
call sp_Registro('Alexander', 'Avila','Ponce', '2004-07-24','alexander@gmail.com','gerentedemantenimiento','ALEXANDER',8);
call sp_Registro('Rodrigo Vidal', 'Ramirez','Aguilar', '2004-05-24','rodrigo@gmail.com','ingenierodemantenimiento','RODRIGO VIDAL',9);
call sp_Registro('Usuario', 'Super','Super', '2004-05-24','superusuario@gmail.com','superusuario','Super Usuario',10);
call sp_Registro('Test', 'Test','Test', '2000-01-01','root@gmail.com','n0m3l0','Root', 4);
call sp_Registro('Luis', 'Zarate','Lozano', '2000-01-02','zarate.lozano.luis.axel@gmail.com','luisin','LuisAPP', 4);
call sp_Registro('Rodri', 'Ramirez','Aguilar', '2000-01-03','rodri@gmail.com','rodri','Rodri', 4);