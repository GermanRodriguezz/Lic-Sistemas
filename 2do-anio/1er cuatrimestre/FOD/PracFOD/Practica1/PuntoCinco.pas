program PuntoCinco;
type

celular = record
	codcelular: integer;
	nombre : string;
	descripcion : string;
	marca : string;
	stockMin : integer;
	stockDis : integer;
end;

celulares = Text;
A_celulares = file of celular;

procedure leerCelular(var c:celular);
begin
		write('Codigo celular : '); readln(c.codcelular);
		if c.codcelular <> 999 then begin
			write('Stock Minimo : '); readln(c.StockMin);
			write('Stock Disponible : '); readln(c.StockDis);
			write('Nombre : '); readln(c.nombre);
			write('Descripcion : '); readln(c.descripcion);
			write('Marca : '); readln(c.marca);
		end;
end;

procedure crearArchivoTexto(var at: celulares);
 var c: celular; 
begin
	assign(at,'ArchivoCelularesTexto');
	rewrite(at);
	leerCelular(c);
	while (c.codcelular <> 999) do begin
		writeln(at, c.codcelular ,' ',c.StockMin,' ',c.StockDis,' ',c.nombre);
		writeln(at, c.descripcion,' ');
		writeln(at, c.marca,' ');
		leerCelular(c);
	end;
	close(at);
	writeln('Ya se cargo el archivo de texto');
end;

procedure crearArchivoBinario(var at: celulares;var ab:A_celulares);
var celu: celular; 
begin
	reset(at);
	assign(ab, 'nomArch');
	writeln('Se creo el archivo binario');
	rewrite(ab);
	while not eof(at) do begin
		readln(at,celu.codcelular,celu.stockMin,celu.stockDis,celu.nombre);{ME TRAIGO LA INFORMACION DE LA PRIMER LINEA DEL aRCHIVO tEXTO EN LA VARIABLE}
		readln(at,celu.descripcion);
		readln(at,celu.marca);
		write(ab,celu);
	end;
	writeln('se cargo el archivo binario');
	close(at);
	close(ab);
end;

procedure incisoB(var a:A_celulares);
var c:celular;
begin
	reset(a);
	while not eof(a) do begin
		read(a, c);
		if c.StockDis < c.StockMin then
			writeln('El celular ',c.nombre, ' de la marca ', c.marca, ' tiene el stock disponible menor al stock minimo!');
	end;
	close(a);
end;

procedure incisoC(var a:A_celulares);
var cadena,descAct : string; reg: celular;
begin
	descAct := '';
	writeln('Ingrese una descripcion!');
	readln(cadena);
	reset(a);
	while (not eof(a)) do begin
		read(a,reg);
		descAct := reg.descripcion;
		if (descAct = cadena) then begin
			write(reg.nombre);
			write(reg.marca);
		end;
	end;
	close(a);
end;

procedure MenuOpciones(var at: celulares; var ab: A_celulares);
var opcion : integer;
begin
	writeln('MENU DE OPCIONES');
	writeln('');
	writeln('ingrese un numero dependiendo la operacion a realizar');
	writeln('Ingrese 1 si quiere crear un archivo de texto');
	writeln('Ingrese 2 si quiere crear un arhivo binario a raiz del archivo de texto creado anteriormente');
	writeln('Ingrese 3 si quieren listar los celulares con stock menor al stock minimo');
	writeln('Ingresando 4 obtendra una la impresion de los celulares con descripcion igual al que usted ingrese');
	writeln('');
	repeat
		readln(opcion);
		case opcion of 
			1 : crearArchivoTexto(at);
			2 : crearArchivoBinario(at,ab);
			3 : incisoB(ab);
			4 : incisoC(ab);
		end;
		writeln('ingrese un numero dependiendo la operacion a realizar');
		writeln('Ingrese 1 si quiere crear un archivo de texto');
		writeln('Ingrese 2 si quiere crear un arhivo binario a raiz del archivo de texto creado anteriormente');
		writeln('Ingrese 3 si quieren listar los celulares con stock menor al stock minimo');
		writeln('Ingresando 4 obtendra una la impresion de los celulares con descripcion igual al que usted ingrese');
		writeln('');
	until (opcion = 0);
end;

var
archivoTexto : Text;
archivoBinario: A_celulares;
begin
MenuOpciones(archivoTexto,archivoBinario);

end.
