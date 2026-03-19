program PuntoSeis;
type
celular = record
	cod: integer;
	nombre : string;
	descrip: string;
	marca : string;
	stockM : integer;
	stockD : integer;
end;

archivo = file of celular;

procedure anadirCelular(var ab: archivo);
var c : celular;
begin
	reset(ab);
	writeln('ingresar datos de celular a agregar');
	writeln('insertar codigo'); readln(c.cod);
	writeln('insertar nombre'); readln(c.nombre);
	writeln('insertar descrip'); readln(c.descrip);
	writeln('insertar marca'); readln(c.marca);
	writeln('insertar stock Minimo'); readln(c.stockM);
	writeln('insertar stock Disponible'); readln(c.stockD);
	seek(ab, filesize(ab));
	write(ab, c);
	close(ab);
	writeln('se agrego un nuevo celular al archivo');
end;

procedure modificarStock(var a: archivo);
var
	sn: integer; c: celular; nombre : string;
begin
	writeln('ingrese nombre de celular a buscar para modificar su stock');
	readln(nombre);
	reset(a);
	read(a, c);
	while not eof(a) and (c.nombre <> nombre) do begin
		write(a, c);
		write(c.nombre);
	end;
	if not eof(a) and (c.nombre = nombre) then begin
		writeln('stock disponible :', c.stockD);
		writeln('se encontro el celular,se modificara el stock');
		writeln('stock nuevo :');
		readln(sn);
		c.stockD := sn;
		seek(a,(filesize(a)-1));
		write(a,c);
	end;
	close(a);
end;

procedure Exportar(var a: archivo);
var c: celular; asn: Text;
begin
	assign(asn,'SinStock.txt');
	rewrite(asn);
	reset(a);
	while not eof(a) do
		read(a ,c);
		if c.stockD = 0 then 
			writeln(asn, c.nombre, '-', c. cod, '-', c.descrip, '-', c.marca, '-', c.stockD);
	close(asn);
	close(a);
end;

procedure MenuNuevo(var ab: archivo);
var opc : integer;
begin
	writeln('ingrese nueva operacion a realizar');
	writeln('');
	writeln('Ingrese 1 si quiere agregar un celular');
	writeln('Ingrese 2 si quiere modificar el stock de un celuar en particular');
	writeln('ingrese 3 si quiere exportar del archivo binario a uno de texto aquellos celular que no tengan stock');
	readln(opc);
	repeat
		case opc of 
			1 : anadirCelular(ab);
			2 : modificarStock(ab);
			3 : Exportar(ab);
		end;
		writeln('Ingrese 1 si quiere agregar un celular');
		writeln('Ingrese 2 si quiere modificar el stock de un celuar en particular');
		writeln('ingrese 3 si quiere exportar del archivo binario a uno de texto aquellos celular que no tengan stock');
			readln(opc);
	until(opc = 0);
end;
var
ab: archivo;
begin
assign(ab, 'nomArch');
MenuNuevo(ab);

end.
