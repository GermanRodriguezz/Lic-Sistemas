program tres;
const valorAlto = 9999;
type

producto = record
	codprod : integer;
	nombrecomercial : string;
	precio : real;
	stockActual : integer;
	stockMinimo : integer;
end;

venta = record
	cod : integer;
	cantUnidadesVendidas : integer;
end;

procedure leerDet(var det:archivoDetalle; var reg: venta);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.cod := valorAlto;
end;

procedure leerMae(var mae: archivoMaestro; var reg: producto);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codprod := valorAlto;
end;

archivoMaestro = file of producto;
archivoDetalle = file of venta;

procedure actualizarMaestro(var mae:archivoMaestro; var det:archivoDetalle);
var
begin
	reset(mae);
	reset(det);
	{leo los primeros registros de los archivos}
	leerDet(det,regdet); 
	leerMae(mae,regmae);
	while regmae.codprod <> valorAlto do begin {si todavia tengo registros en el archivo maestro}
		{si no encontre el codigo en el archivo maestro sigo leyendo}
		while regmae.codprod <> regdet.cod do 
			leerMae(mae,regmae);
			{sali del while de arriba porque encontre el mismo}
		while regmae.codprod = regdet.cod do begin
			regmae.stockActual:= regmae.stockActual - regdet.cantUnidadesVendidas;
			leerDet(det,regdet);
		end;
		{salgo de aca porque cambio el codigo de producto entonces actualizo en el maestro, y vuelvo al while mas grande}
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
	end;
	close(mae);
	close(det);
end;

procedure Listar(var mae:archivoMaestro);
var regmae: producto;
begin
	assign(archtxt,'stock_minimo.txt');
	rewrite(archtxt);
	reset(mae);
	leerMae(mae,regmae);
	while regmae.codprod <> valorAlto do begin
		if regmae.stockActual < regmae.stockMinimo then
			writeln(archtxt,regmae.codprod,' ',regmae.stockActual,' ',regmae.stockMinimo,' ',regmae.precio,' ',regmae.nombre);
		leerMae(mae,regmae);
	end;
	close(mae);
end;

var mae: archivoMaestro; det: archivoDetalle;
begin
assign(mae,'ArchivoMaestroTres');
assign(det,'ArchivoDetalleTres');}
actualizarMaestro(mae,det);
Listar(mae);
end.
