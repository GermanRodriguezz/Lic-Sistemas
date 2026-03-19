program ejercicioSiete;
const valorAlto = 9999;
type
novela = record
	cod: integer;
	precio : real;
	genero: string;
	nombre: string;
end;

Maestro = file of novela;
Detalle = Text;

procedure leer(var r: novela);
begin
	writeln('ingrese la informacion de la novela');
	writeln('codigo : '); readln(r.cod);
	if (r.cod <> valorAlto) then begin
		writeln('precio : '); readln(r.precio);
		writeln('genero : '); readln(r.genero);
		writeln('nombre : '); readln(r.nombre);
	end
	else
		r.cod := valorAlto;
end;

procedure CrearArchivoTexto(var det : Detalle);
var r: novela;
begin
	leer(r);
	assign(det, 'novelas.txt');
	rewrite(det);
	while (r.cod <> valorAlto) do begin
		writeln(det,r.cod,' ',r.precio,' ',r.genero);
		writeln(det,r.nombre);
		leer(r);
	end;
	close(det);
	writeln('Se cargo el archivo de texto con exito!');
end;

procedure CrearArchivoBinario(var det: Detalle; var mae: Maestro);
var nov : novela; nomMae: string;
begin
	reset(det);
	writeln('Ingrese nombre de Archivo Binario');
	readln(nomMae);
	assign(mae, nomMae);
	rewrite(mae);
	while not eof(det) do begin
		readln(det,nov.cod, nov.precio, nov.genero);
		readln(det, nov.nombre);
		write(mae, nov);
	end;
	writeln('Se cargo correctamente el archivo binario con el archivo de texto');
	close(det);
	close(mae);
end;

procedure Agregar(var mae: Maestro; var nov: novela);
begin
	reset(mae);
	if nov.cod <> valorAlto then begin
		seek(mae,filesize(mae));
		write(mae,nov);
	end;
	close(mae);
end;

procedure Modificar(var mae: Maestro);
var nov,novNueva: novela; encontre: boolean;
begin
	encontre := false;
	writeln('Ingrese informacion de novela a modificar');
	leer(NovNueva);
	reset(mae);
	while not eof(mae) and (not encontre) do begin
		read(mae,nov);
		if (nov.cod = NovNueva.cod) then begin
			seek(mae, (filePos(mae)-1));
			write(mae,novNueva);
			writeln('Encontre un codigo de novela existente y actualize datos');
			encontre := True;
		end;
	end;
	close(mae);
	if (not encontre) then
		writeln('No se encontro el codigo en el archivo, se lo agregara!');
		Agregar(mae, novNueva);
end;

procedure menu(var det: Detalle; var mae:Maestro);
var opcion: byte;
begin
	repeat
		writeln('Ingresar accion a realizar');
		writeln('');
		writeln(' opcion 1 : Crear Archivo de Texto');
		writeln(' opcion 2 : Crear Archivo Binario');
		writeln(' opcion 3 : Modificar/Agregar novela');
		readln(opcion);
		case opcion of
			1 : CrearArchivoTexto(det);
			2 : CrearArchivoBinario(det,mae);
			3 : Modificar(mae);
			0 : writeln('Termino el programa');
		else
			writeln('opcion invalida!')
		end;
	until (opcion = 0);
end;
var
mae : Maestro;
det : Detalle;
begin
menu(det,mae);
end.
