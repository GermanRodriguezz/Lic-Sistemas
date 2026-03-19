program PuntoDos;
const valorAlto : -1;
type
	asistente = record
		nro : integer;
		apeynom : string;
		email : string;
		tel : integer;
		dni : integer;
	end;
	
archivo = file of asistente;

procedure leer(var a: archivo; var reg: asistente);
begin
	if not eof(a) then
		read(a,reg)
	else
		reg.nro := valorAlto;
end;

procedure ingresarDatos(var reg: asistente);
begin
	writeln('Ingrese nro de asistente');
	readln(reg.nro);
	writeln('Ingrese apellido y nombre sin espacios');
	readln(reg.apeynom);
	writeln('Ingrese email');
	readln(reg.email);
	writeln('Ingrese telefono');
	readln(reg.tel);
	writeln('Ingrese dni');
	readln(reg.dni);
end;

procedure cargarDatos(var a:archivo);
var reg: asistente;
begin
	assign(a,'ArchivoDos');
	rewrite(a);
	ingresarDatos(reg);
	while reg.nro <> valorAlto do begin
		write(archivo,reg);
		ingresarDatos(reg);
	end;
end;

procedure EliminarDatos(var a:archivo);
var  aux,reg: asistente;
begin
	reset(a);
	leer(a,reg);
	while reg.nro <> valorAlto do begin
		if reg.nro < 1000 then begin
			aux := reg;
			aux.apeynom:= '#' + reg.apeynom;
			seek(a,filepos(a)-1);
			write(a,aux);
		end;
		leer(a,reg);
	end;
	close(a);
end;

var
arch : archivo;
begin
cargarDatos(arch);
EliminarDatos(arch);
end.
