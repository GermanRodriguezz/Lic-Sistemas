Program PuntoTres;
const valorAlto = 9999;
type
novela = record
	codigo : integer;
	genero : string;
	nombre : string;
	duracion : integer;
	director : string;
	precio : real;
end;

archivo = file of novela;

procedure leer(var arch: archivo; var reg:novela);
begin
	if not eof(arch) then
		read(arch,reg)
	else
		reg.codigo := valorAlto;
end;

procedure ingresarDatos(var reg:novela);
begin
	writeln('ingrese codigo de novela');
	readln(reg.codigo);
	writeln('ingrese genero de novela');
	readln(reg.genero);
	writeln('ingrese nombre de novela');
	readln(reg.nombre);
	writeln('ingrese duracion de novela');
	readln(reg.duracion);
	writeln('ingrese director de novela');
	readln(reg.director);
	writeln('ingrese precio de novela');
	readln(reg.precio);
end;

procedure crearArchivoNovelas(var arch: archivo);
var
	reg : novela;
begin
	assign(arch,'ArchivoNovelas');
	rewrite(arch);
	reg.codigo := 0;
	write(arch,reg);
	ingresarDatos(reg);
	while reg.codigo <> valorAlto do begin
		write(arch,reg);
		ingresarDatos(reg);
	end;
	close(arch);
end;

procedure alta(var arch:archivo);
var 
	regNuevo,cabecera: novela;
	pos : integer;
begin
	writeln('Ingrese datos de novela a agregar');
	ingresarDatos(regNuevo);
	reset(arch);
	leer(arch,cabecera); {leo cabecera}
	if cabecera.codigo < 0 then begin
		pos := -cabecera.codigo; {este numero es el que esta libre}
		seek(arch,pos);{voy a esta posicion libre}
		read(arch,cabecera); {copio el registro de la posicion libre,donde tendre tambien la proxima posicion libre}
		
		seek(arch,0);{vuelvo al registro de cabecera y actualizo}
		write(arch,cabecera);
		
		seek(arch,pos);{voy a la posicion que esta libre}
		write(arch,regNuevo);{copio la nueva informacion}
	end
	else begin {si no hay lugar disponible agrego al final}
		seek(arch,filesize(arch));
		write(arch,regNuevo);
	end;
	close(arch);
end;

procedure cambiarValores(var reg:novela);
begin
	writeln('ingresar genero,nombre,duracion,director y precio nuevo');
	readln(reg.genero);
	readln(reg.nombre);
	readln(reg.duracion);
	readln(reg.director);
	readln(reg.precio);
end;

procedure modificar(var arch:archivo);
var reg,regNuevo: novela; codigo: integer;
begin
	writeln('Ingrese codigo de novela a modificar');
	readln(codigo);
	reset(arch);
	leer(arch,reg);
	while reg.codigo <> valorAlto  do begin
		if reg.codigo = codigo then begin
			cambiarValores(reg);
			seek(arch,filepos(arch)-1);
			write(arch,reg);
		end
		leer(arch,reg);
	end;
	close(arch);
end;

procedure baja(var arch:archivo);
var pos : integer; cab,reg: novela; codigo: integer;
begin
	reset(arch);
	writeln('ingrese codigo a eliminar');
	readln(codigo);
	leer(arch,cab);
	leer(arch,reg);
	while reg.codigo <> valorAlto do begin
		if reg.codigo = codigo then begin
			pos := filepos(arch)-1; {me guardo la posicion a eliminar}
			seek(arch,pos); {me posiciono en el lugar a eliminar}
			reg.codigo := cab.codigo; {es la posicion disponible que ya tenia la cabecera}
			{pase una posicion que tenia libre,para que quede en la posicion eliminada}
			write(arch,reg); {copio en la la posicion eliminada la siguiente posicion libre}
			
			cab.codigo := -pos; {esta es la posicion donde tengo la nueva posicion libre}
			seek(arch,0); {voy a la cabecera}
			write(arch,cab); {copio al ultimo eliminado,donde en esa posicion tengo al proximo espacio libre}
		end;
		leer(arch,reg);
	end;
	close(arch);
end;

var
	archNovelas : archivo; 
	opcion: integer;
begin
writeln('Ingrese opcion a realizar');
writeln('-------------------------');
readln(opcion);
writeln('1 - Crear un archivo de novela');
writeln('2 - Dar de alta novela ');
writeln('3 - Modificar datos de una novela');
writeln('4 - Dar de baja novela');
writeln('0 - Terminar programa');
repeat 
	case opcion of
		1 : crearArchivoNovelas(archNovelas);
		2 : alta(archNovelas);
		3 : modificar(archNovelas);
		4 : baja(archNovelas);
	end;
	writeln('1 - Crear un archivo de novela');
	writeln('2 - Dar de alta novela ');
	writeln('3 - Modificar datos de una novela');
	writeln('4 - Dar de baja novela');
	writeln('0 - Terminar programa');
	readln(opcion);
until (opcion = 0);
end.
