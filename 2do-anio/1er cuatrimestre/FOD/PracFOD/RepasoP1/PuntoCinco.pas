program cinco;
const valorAlto = 9999;
type
celulares = record
	codcelular : integer;
	nombre : string;
	descripcion : string;
	marca : string;
	precio : real;
	stockMinimo : integer;
	stockDisponible: integer;
end;

archivo = file of celulares;

procedure leer(var arch:archivo; var c:celulares);
begin
	if not eof(arch) then
		read(arch,c)
	else
		c.codcelular := valorAlto;
end;

procedure CrearArchivo(var arch: archivo; archtxt: Text);
var c:celulares; nombre: string;
begin
	writeln('Ingrese nombre para el archivo binario');
	readln(nombre);
	assign(archtxt,'celulares.txt');
	reset(archtxt);
	assign(arch,nombre);
	rewrite(arch);
	while not eof(archtxt) do begin
		with c do begin
			readln(archtxt,codcelular, precio, marca);
			readln(archtxt,stockDisponible,stockMinimo,descripcion);
			readln(archtxt,nombre);
			write(arch,c);
		end;
	end;
	close(arch);
	close(archtxt);
end;

procedure ListarCelularesStockMenor(var arch:archivo);
var c:celulares;
begin
	reset(arch);
	leer(arch,c);
	while c.codcelular <> valorAlto do begin
		if c.stockDisponible < c.stockMinimo then
			writeln('Cod : ', c.codcelular, ' Nombre : ',c.nombre,' Marca : ',c.marca, ' Descripcion : ', c.descripcion);
		leer(arch,c);
	end;
	close(arch);
end;

procedure ListarCelularDescrip(var arch:archivo);
var c:celulares; cadena: string;
begin
	reset(arch);
	writeln('Ingrese cadena');
	readln(cadena);
	leer(arch,c);
	while c.codcelular <> valorAlto do begin
		if cadena = c.descripcion then
			writeln('Cod : ', c.codcelular, ' Nombre : ',c.nombre,' Marca : ',c.marca, ' Descripcion : ', c.descripcion);
		leer(arch,c);
	end;
	close(arch);
end;

procedure Exportar(var arch:archivo);
var c:celulares; celularestxt : Text;
begin
	assign(celularestxt,'celulares.txt');
	rewrite(celularestxt);
	reset(arch);
	leer(arch,c);
	while c.codcelular <> valorAlto do begin
		writeln(celularestxt,c.codcelular,' ',c.precio,' ',c.marca);
		writeln(celularestxt,c.stockDisponible,' ',c.stockMinimo,' ',c.descripcion);
		writeln(celularestxt,c.nombre);
		leer(arch,c);
	end;
	close(arch);
	close(celularestxt);
end;

var
	arch: archivo; archtxt : Text; opcion: integer;
begin
repeat
write('SELECCIONE UNA OPCION');
writeln('1 - Crear archivo');
writeln('2 - Listar celulares con stock menor al mínimo');
writeln('3 - Listar celulares cuya descripción contenga una cadena');
writeln('4 - Exportar archivo binario a "celulares.txt"');
writeln('0 - Cerrar programa');
readln(opcion);
	case opcion of
		1: CrearArchivo(arch,archtxt);
		2: ListarCelularesStockMenor(arch);
		3: ListarCelularDescrip(arch);
		4: Exportar(arch);
	end;
until (opcion = 0);
end.
