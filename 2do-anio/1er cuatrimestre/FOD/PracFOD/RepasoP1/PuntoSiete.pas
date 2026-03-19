program siete;
const valorAlto = 9999;
type
novela = record
	codigo : integer;
	nombre : string;
	genero : string;
	precio : real;
end;

archivo : file of novela;

procedure leer(var arch: archivo; var n:novela);
begin
	if not eof(arch) then
		read(arch,n)
	else
		n.codigo := valorAlto;
end;

procedure LeerNovela(var n:novela);
begin
	writeln('Ingrese codigo de la novela');
	readln(n.codigo);
	writeln('Ingrese nombre de la novela');
	readln(n.nombre);
	writeln('Ingrese genero de la novela');
	readln(n.genero);
	writeln('Ingrese precio de la novela');
	readln(n.precio);
end;

procedure CrearArchivo(var arch: archivo);
var n: novela;
begin
	assign(novtxt,'novela.txt');
	reset(novtxt);
	writeln('Ingrese nombre para el archivo binario');
	readln(nombre);
	assign(arch,nombre);
	rewrite(arch);
	while not eof(novtxt)do begin
		with n do begin
			readln(novtxt,n.codigo,n.precio,n.genero);
			readln(novtxt,n.nombre);
			write(arch,n);
		end;
	end;
	close(arch);
	close(novtxt);
end;

procedure AgregarNovela(var arch:archivo);
var n: novela;
begin
	reset(arch);
		seek(arch,filesize(arch));
		LeerNovela(n);
		write(arch,n);
	close(arch);
end;

procedure ModificarNovela(var arch:archivo);
var codigo : integer; n: novela; regnuevo: novela;
begin
	writeln('Ingrese codigo de novela a modificar');
	readln(codigo);
	reset(arch);
	leer(arch,n);
	while n.codigo <> valorAlto do begin
		if n.codigo <> codigo then
			leer(arch,n)
		else begin
			writeln('Ingresar datos a modificar');
			readln(regnuevo.nombre);
			readln(regnuevo.codigo);
			readln(regnuevo.precio);
			readln(regnuevo.genero);
			seek(arch,filepos(arch)-1);
			write(arch,regnuevo);
			break
			writeln('Encontre el codigo y modifique sus datos');
		end;
	end;
	writeln('No se encontro el codigo');
end;

procedure Actualizar(var arch:archivo);
var opcion: integer; 
begin
	writeln('Seleccione una opcion');
	writeln('1 - Agregar una novela');
	writeln('2 - Modificar una novela');
	writeln('0 - Cerrar programa');
	readln(opcion);
	repeat
		case opcion of:
			1: AgregarNovela(arch);
			2: ModificarNovela(arch);
		end
		writeln('Seleccione una opcion');
		writeln('1 - Agregar una novela');
		writeln('2 - Modificar una novela');
		writeln('0 - Cerrar programa');
		readln(opcion);
	until (opcion = 0);
end;

var  arch: archivo;
begin
CrearArchivo(arch);
Actualizar(arch);
end.
