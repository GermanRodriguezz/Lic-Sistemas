program cinco;
const valorAlto = 9999;
type
cant = 30;

infomaestro = record
	codprod : integer;
	nombre : string;
	descrip : string;
	stockD : integer;
	stockM : integer;
	precio : real;
end;

infodetalle = record
	cod : integer;
	cantvendida : integer;
end;

maestro = file of producto;
detalle = file of infodetalle;

vectorDetalle = array [1..30] of detalle;
vectorRegistros = array [1..30] of infodetalle;

procedure leerDet(var det: detalle; var reg: infodetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.det := valorAlto;
end;

{modulo donde saco el minimo codigo}
procedure minimo(var vec: vectorRegistros; var pos:integer);
var i,min : integer;
begin
	min := valorAlto;
	for i := 1 to cant do begin
		if vec[i].cod < min then begin
			min := vec[i].cod;
			pos := i;
		end;
	end;
end;

procedure actualizarMaestro(var mae:maestro; var det: vectorDetalle);
var vec : vectorRegistros; i,pos, vendida : integer; 
begin
	reset(mae);
	for i := 1 to cant do begin
		reset(det[i]);
		leerDet(det[i],vec[i]);
	end;
	read(mae,regmae);
	minimo(vec,pos);
	while vec[pos].cod <> valorAlto do begin
		codAct := vec[pos].cod;
		while regmae.codprod < codAct do 
			read(mae,regmae);
		while vec[pos].cod = codAct do begin
			vendida := vendida + vec[pos].cantvendida;
			{leo denuevo sobre el mismo detalle donde encontre el minimo}
			leerDet(det[pos],vec[pos]);
			{aca encuentro donde esta el minimo siguiente}
			minimo(vec,pos);
		end;
		regmae.stockD := regmae.stockD - vendida;
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
	end;
	close(mae);
	for i: 1 to cant do
		close(det[i]);
end;

var
begin
end.
