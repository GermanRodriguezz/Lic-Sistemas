program PuntoDoce;
const valorAlto: 9999;
type
rangomes : 1..12;
rangodia : 1..31;
informacion = record
	anio : integer;
	mes : rangomes:
	dia : rangodia;
	idUsuario: integer;
	tiempoAcceso : integer;
end;

maestro = file of informacion;

procedure leer(var mae:maestro; var reg:informacion);
begin
	if not eof(mae) then
		read(mae,reg)
	else	
		reg.anio := valorAlto;
end;

procedure procesarInformacion(var mae:maestro);
var 
	anio,anioAct,mesAct,diaAct,idAct : integer;
	tiempoDelUsuario, tiempoDelDia, tiempoDelMes, tiempoDelAnio: integer;
begin
	reset(mae);
	writeln('ingrese el anio en el que quiere sacar informacion');
	readln(anio);
	leer(mae,reg);
	while reg.anio <> valorAlto and reg.anio < anio do
		read(mae,reg);
	while reg.anio <> valorAlto and reg.anio = anio do begin
		anioAct := reg.anio;
		writeln('Anio ',idAnio);
		tiempoDelAnio := 0;
		while anioAct = reg.anio do begin
			mesAct := reg.mes;
			writeln('Mes ',mesAct);
			tiempoDelMes := 0;
			while anioAct = reg.anio and mesAct = reg.mes do begin
				diaAct := reg.dia;
				writeln('Dia ',diaAct);
				tiempoDelDia := 0;
				while anioAct = reg.anio and mesAct = reg.mes and diaAct = reg.dia do begin
					idAct := reg.idUsuario;
					writeln('Usuario ',idAct);
					tiempoDelUsuario := 0;
					while anioAct = reg.anio and mesAct = reg.mes and diaAct = reg.dia and idAct = reg.idUsuario do begin
						tiempoDelUsuario := tiempoDelUsuario + reg.tiempoAcceso; {acumulo el tiempo de acceso por usuario}
						leer(mae,reg);
					end;
					{cambie de usuario}
					writeln('Tiempo del usuario ', idAct , ' en el dia ',diaAct, ' mes : ',mesAct);
					tiempoDelDia := tiempoDelDia + tiempoDelUsuario;
				end;
				{cambie de dia}
				writeln('tiempo total acceso dia ',diaAct, ' mes ',mesAct, ' = ',tiempoDelDia);
				tiempoDelMes := tiempoDelMes + tiempoDelDia;
			end;
			{cambie de mes}
			writeln('tiempo total acceso del mes ',mesAct,' = ',tiempoDelMes);
			tiempoDelAnio :=: tiempoDelAnio + tiempoDelMes;
		end;
		writeln('tiempo total de acceso en el anio ',anioAct, ' = ',tiempoDelAnio);
	end;
	close(mae);
end;

var
begin
end.
