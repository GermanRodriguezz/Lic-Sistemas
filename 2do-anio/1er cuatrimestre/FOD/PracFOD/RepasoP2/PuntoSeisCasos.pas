program seis;
const valorAlto = 9999;
type
cant = 10;
informacionDetalle = record
	codlocalidad : integer;
	codcepa : integer;
	cantcasosact : integer;
	cantcasosnew : integer;
	cantcasosrec : integer;
	cantcasosfall : integer;
end;

informacionMaestro = record
	localidad : integer;
	nombreloc : string[30];
	codigocepa : integer;
	nombrecepa : string[30];
	casosact : integer;
	casosnuevos : integer;
	casosrecu : integer;
	casosfallecidos : integer;
end;

detalle = file of informacionDetalle;
vecdet = array [1..cant] of detalle;
vecreg = array [1..cant] of informacionDetalle;
maestro = file of informacionMaestro;

procedure leerDet(var det: detalle; var reg: informacionDetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.codlocalidad := valorAlto;
end;

procedure leerMae(var mae: maestro; var reg: informacionMaestro);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.localidad := valorAlto;
end;
{recibo LOS DETALLES, el VECTOR DE REGISTROS donde tengo la informacion, y devulevo en min el reg que voy a usar en el actualizar}
procedure minimo(var det : vecdet; var reg: vecreg; var min : informacionDetalle);
var pos : integer; min : informacionDetalle;
begin
	min.codlocalidad := valorAlto;
	min.codcepa := valorAlto;
	for i := 1 to cant do begin
		if reg[i].codlocalidad < min.codlocalidad or reg[i].codlocalidad = min.codlocalidad and reg[i].codcepa < min.codcepa then begin
			min := vec[i];
			pos := i;
		end;
	end;
	leerDet(det[pos],reg[pos]);
end;

procedure actualizarMaestro(var mae:maestro; var vec: vecdet);
var regdet : vecreg; actual := informacionMaestro;
begin
	reset(mae);
	leerMae(mae,actual);
	for i:= 1 to cant do begin
		reset(vec[i]);
		leerDet(vec[i],regdet[i]);
	end;
	minimo(vec,regdet,min);
	localidadMas50 := 0;
	while actual.localidad <> valorAlto do begin	
		localidadAct := actual.localidad;
		activosTotales := 0;
		while localidadAct <> min.localidad do 
			leerMae(mae,actual);
		while localidadAct = min.localidad do begin
			cepaAct := actual.codigocepa;
			fallecidos := 0; recuperados := 0; activos := 0; nuevos := 0;
			while localidadAct = min.localidad and cepaAct = min.codcepa do begin
				fallecidos := fallecidos + min.cantcasosfall;
				recuperados := recuperados + min.cantcasosrec;
				activos := min.cantcasosact;
				nuevos := min.cantcasosnew;
				minimo(vec,regdet,min);
				leerMae(mae,actual);
			end;
			activosTotales := activosTotales + activos;
			seek(mae,filepos(mae)-1);
			actual.casosfallecidos := fallecidos;
			actual.casosrecu := recuperados;
			actual.casosact := activos;
			actual.casosnuevos := nuevos;
			write(mae,actual);
		end;
		if activosTotales > 50 then
			localidadMas50 := localidadMas50 + 1;
	end;
	writeln('La cantidad de localidades que superan los 50 casos activos son ',localidadMas50);
end;	


















var
begin
end.
