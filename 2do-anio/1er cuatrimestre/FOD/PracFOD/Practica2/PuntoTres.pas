program puntotres;
const valorAlto = 9999;
type
producto = record
	codprod : integer;
	nomComercial: string;
	precioVenta: real;
	stockActual : integer;
	stockMinimo : integer;
end;

ventas = record
	codigoProducto : integer;
	cantUnidades : integer;
end;

Maestro = file of producto;
Detalle = file of ventas;

procedure leer(var archivo: Detalle; var dato: ventas);
begin
	if not eof(archivo) then
		read(archivo,dato)
	else
		dato.codigoProducto := valorAlto;
end;
procedure cargarMaestro(var mae:Maestro; var maetxt : Text);
var reg: producto;
begin
	assign(maetxt,'Maestro.txt');
	reset(maetxt);
	assign(mae,'ArchivoMaestroTres');
	rewrite(mae);
	while not eof(maetxt) do begin
		with reg do begin
			readln(maetxt, codprod, precioVenta, stockActual,stockMinimo, nomComercial);
		end;
		write(mae,reg);
	end;
	writeln('Se cargo el Binario Maestro');
	close(mae);
	close(maetxt);
end;

procedure cargarDetalle(var det: Detalle; var dettxt: Text);
var reg: ventas;
begin
	assign(dettxt,'Detalle.txt');
	reset(dettxt);
	assign(det,'ArchivoDetalleTres');
	rewrite(det);
	while not eof(dettxt) do begin
		with reg do begin
			readln(dettxt,codigoProducto,cantUnidades);
		end;
		write(det,reg);
	end;
	writeln('Ya se cargo el archivo detalle');
end;

procedure actualizarMaestro(var m:Maestro; var d:Detalle);
var regm: producto; regd: ventas;
begin
	reset(d);
	reset(m);
	leer(d,regd);
	while (regd.codigoProducto <> valorAlto) do begin
		read(m,regm);
		while regm.codprod <> regd.codigoProducto do begin
			read(m,regm);
		end;
		while (regm.codprod = regd.codigoProducto) do begin
			if regd.cantUnidades >= regm.stockActual then
				regm.stockActual := 0
			else
				regm.stockActual := regm.stockActual - regd.cantUnidades;
			leer(d,regd);
		end;
		seek(m,filepos(m)-1);
		write(m,regm);
	end;
	writeln('Se actualizo el maestro');
	close(m);
	close(d);
end;

procedure ListaStockMenor(var m:maestro; var lista:Text);
var regm: producto;
begin
	assign(lista,'stock_minimo.txt');
	rewrite(lista);
	reset(m);
	while not eof(m) do begin
		read(m,regm);
		if regm.stockMinimo > regm.stockActual then
			with regm do begin
				writeln(lista,'Codigo = ',codprod,' NombreComercial= ',nomComercial,' stockActual= ',stockActual,' stockMinimo = ',stockMinimo);
			end;
	end;
	writeln('Se enlistaron los productos con stock menores!');
	close(m);
	close(lista);
end;

procedure imprimirMae(var m:Maestro);
var regm: producto;
begin
	reset(m);
	while not eof(m) do begin
		read(m,regm);
		writeln('CODIGO = ', regm.codprod, 'NOMCOMERCIAL = ', regm.nomComercial,' STOCK ACTUAL = ',regm.stockActual);
	end;
end;

procedure imprimirLista(var l:Text);
var linea: string;

begin
	reset(l);
	while not eof(l) do begin
		readln(l,linea);
		writeln(linea);
	end;
end;

procedure Menu;
var m: Maestro; d: Detalle; opcion : integer; maetxt,dettxt,lista : Text;
begin
writeln('-----------MENU-----------');
writeln('');
writeln('1 = Crear archivo Maestro');
writeln('2 = Crear archivo Detalle');
writeln('3 = Actualizar archivo Maestro');
writeln('4 = Listar archivo de texto productos cuyo stock esten por debajo del stock Minimo');
writeln('0 = Terminar programa!');
repeat
	writeln('Ingrese opcion');
	readln(opcion);
	case opcion of
		1 : cargarMaestro(m,maetxt);
		2 : cargarDetalle(d,dettxt);
		3 : actualizarMaestro(m,d);
		4 : ListaStockMenor(m,lista);
		5 : imprimirMae(m);
		6 : imprimirLista(lista);
		end;
until (opcion = 0);
end;

begin
Menu;
end.
