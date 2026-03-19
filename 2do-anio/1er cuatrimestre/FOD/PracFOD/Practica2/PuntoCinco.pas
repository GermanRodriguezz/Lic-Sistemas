program PuntoCinco;
const valorAlto = 9999; dimF = 3;
type
producto = record
	codprod: integer;
	nombre: string;
	descripcion :string;
	stockDis: integer;
	stockMin : integer;
	precio : real;
end;

venta = record
	codigo : integer;
	cantidad : integer;
end;

Maestro = file of producto;
Detalle = file of venta;
vectorDetalles = array [1..dimF] of Detalle; {vector de detalles}
vectorRegistros = array [1..dimF] of venta; {vector de registros,necesario para poder llevar los registros actuales de los detalles que proceso}

procedure leer(var det:Detalle; var dato: venta);
begin
	if not eof(det) then
		read(det,dato)
	else
		dato.codigo := valorAlto;
end;
procedure leerDetalle(var det:Detalle); {procedimiento donde cargo un detalle del vector de detalles}
var detatxt: Text; v: venta; nombre : string;
begin
	writeln('ingrese el nombre del detalle');
	readln(nombre);
	assign(detatxt,nombre);
	writeln('ingrese un nombre para el archivo detalle');
	readln(nombre);
	reset(detatxt);
	assign(det, nombre);
	rewrite(det);
	while not eof(detatxt) do begin
		with v do begin
			readln(codigo,cantidad);
			write(det,v);
		end;
	end;
	writeln('Se creo el archivo binario!');
	close(det);
	close(detatxt);
end;
procedure cargarDetalles(var vd: VectorDetalles); {procedimiento donde cargo los detalles }
var i: integer; 
begin
	for i := 1 to dimF do
		leerDetalle(vd[i]);
end;
procedure cargarMaestro(var mae:Maestro);
var maetxt: Text; prod: producto;
begin
	assign(maetxt,'Maestro5.txt');
	reset(maetxt);
	assign(mae,'ArchivoMaestro5');
	rewrite(mae);
	while not eof(maetxt) do begin
		with prod do begin
			readln(maetxt, codprod, StockDis, StockMin,precio,nombre);
			readln(maetxt,descripcion);
			write(mae,prod);
		end;
	end;
	writeln('Se creo el archivo maestro!');
	close(mae);
	close(maetxt);
end;
procedure minimo(var vd: vectorDetalles;var vecReg: vectorRegistros; var min:venta);
var i,pos: integer;
begin
	min.codigo := valorAlto; {tomo como maximo para luego comparar}
	for i := 1 to dimF do begin {se va a repetir N archivo de veces}
		if vecReg[i].codigo < min.codigo then begin
			min := vecReg[i]; {me guardo el minimo en cada iteracion}
			pos := i; 		  {posicion del minimo registro}
		end;
		if (min.codigo <> valorAlto) then
			leer(vd[pos],vecReg[pos]); {si tengo un minimo,voy a volver a leer desde el archivo detalle de la posicion del registro minimo}
	end;
end;

procedure crearReporte(var mae:Maestro);
var regM: producto; reporte: Text;
begin
	assign(reporte,'reporte.txt');
	rewrite(reporte);
	reset(mae);
	while not eof(mae) do begin
		read(mae,regM);
		if regM.stockDis < regM.stockMin then begin
			writeln(reporte,regM.stockDis,regM.precio,regM.nombre);
			writeln(reporte,regM.descripcion);
		end;
	end;
	close(mae);
	close(reporte);
end;

procedure actualizarMaestro(var mae:Maestro; var det:vectorDetalles);
var i,cant_vendida,cod_act: integer; vecReg: vectorRegistros; min: venta;
begin
	reset(mae);
	for i := 1 to dimF do begin
		reset(det[i]); {recorro y abro mi vector de detalles}
		leer(det[i],vecReg[i]); {aca mando cada detalle a que se lean los primeros archivos}
	end;
	minimo(det,vecReg,min); {mande el vector de detalles abierto para que se busque el codigo minimo}
	while min.codigo <> valorAlto do begin
		cant_vendida := 0;
		cod_act := min.codigo; {este es el codigo minimo y actual}
		while cod_act = min.codigo do begin {acumulo todas las cantidades de productos vendidas por el mismo codigo}
			cant_vendida := cant_vendida + min.cantidad;
			minimo(det,vecReg,min); {vuelvo a buscar el minimo entre los archivos,pero ahora apuntan a la siguiente posicion}
		end;
		read(mae,regM); {me traigo el primer registro del archivo maestro}
		while regM.codprod <> cod_act do {si es codigo del primer registro del maestro, es distinto al codigo minimo de los archivos detalles}
			read(mae,regM);
		seek(mae,filepos(mae)-1);
		regM.StockDis := regM.stockDis - cant_vendida;
		write(mae,regM);
	end;
	crearReporte(mae);
	close(mae);
	for i:= 1 to dimF do
		close(det[i]);
end;

procedure imprimirMae(var mae:Maestro);
begin
	reset(mae);
	while not eof(mae) do begin
		read(mae,p);
		writeln('Codigo = ',p.codprod, ' StockDisponible = ',p.sotckDis,' StockMinimo = ',p.stockMin,' Precio = ',p.precio, ' Nombre = ',p.nombre,' Descripcion = ',p.descripcion);
	end;
	close(mae);
end;
var
	det : Detalles;
	mae : Maestro;
begin
	cargarDetalles(det);
	cargarMaestro(mae);
	actualizarMaestro(mae,det);
	imprimirMae(mae);
end.
