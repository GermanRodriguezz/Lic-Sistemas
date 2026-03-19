program dos;
const valorAlto = 9999;
type
asistente = record
	nroasistente : integer;
	apellido : string;
	nombre : string[20];
	email : string[20];
	telefono : integer;
	dni : integer;
end;

archivo = file of asistente;

procedure leerAsistente(var a: asistente);
begin
	writeln('Ingresar numero asistente');
	readln(a.nroasistente);
	if a.nroasistente <> valorAlto then begin
		readln(a.apellido);
		readln(a.nombre);
		readln(a.email);
		readln(a.telefono);
		readln(a.dni);
	end;
end;

procedure leerMae(var mae:archivo; var reg:asistente);
begin
	if not eof(mar)then
		read(mae,reg)
	else
		reg.nroasistente := valorAlto;
end;

procedure cargarMaestro(var mae:archivo);
var
begin
	reset(mae);
	leerAsistente(regmae);
	while regmae.nroasistente <> valorAlto do begin
		write(mae,regmae);
		leerAsistente(regmae);
	end;
	close(mae);
end;

procedure eliminar(var mae:archivo);
var
begin
	reset(mae);
	leerMae(mae,regmae);
	while regmae.nroasistente <> valorAlto do begin
		if regmae.nroasistente < 1000 then begin
			regmae.apellido := #+regmae.apellido;
		end;
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
		leerMae(mae,regmae);
	end;
end;

var
begin
end.
