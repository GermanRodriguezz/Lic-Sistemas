program siete;
{● Si un alumno aprueba una cursada, 
se incrementa en uno la cantidad de cursadas 
aprobadas. 
● Si un alumno aprueba un examen final (nota >= 4), 
se incrementa en uno la cantidad 
de materias con final aprobado.}
const valorAlto := 9999;
type
infomaestro = record
	codalumno : integer;
	apeynom : string[40];
	cantcursadasA : integer;
	cantmateriasF : integer;
end;

infocursada = record
	codigo : integer;
	codigomat : integer;
	anio : integer;
	resultado : boolean;
end;

infofinal = record
	codigo : integer;
	codigomat : integer;
	fecha : integer;
	nota : integer;
end;

maestro = file of infomaestro;
detalleC = file of infocursada;
detalleF = file of infofinal;

procedure leerMae(var m : maestro; var reg: infomaestro);
begin
	if not eof(m) then
		read(mae,reg)
	else
		reg.codalumno := valorAlto;
end;

procedure leerC(var det: detalleC; var reg: infocursada);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.codigo := valorAlto;
end;

procedure leerF(var det: detalleF var reg: infofinal);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.codigo := valorAlto;
end;

procedure actualizarMaestro(var mae: maestro; var ac: detalleC; var af: detalleF);
var finales,cursadas,codAct : integer;<
begin
	reset(mae);
	reset(ac);
	reset(af);
	
	leerC(ac,regc);
	leerF(af,regf);
	{si tengo datos en alguno de los 2 archivos entra}
	while regc.codigo <> valorAlto or regf.codigo <> valorAlto do begin
		{saco el minimo de la siguiente manera}
		if regc.codigo < regf.codigo then
			codAct := regc.codigo
		else
			codAct := regf.codigo;
		{leo el primer reg del maestro y busco el codigo del detalle en el maestro}
		leerMae(mae,regmae);
		while regmae.codalumno <> codAct do
			leerMae(mae,regmae);
		cursadas := 0;
		finales := 0;
		{mientras sea el mismo codigo de alumno sumo}
		while regmae.codalumno = codAct do begin
			{si el codigo actual es del archivo cursada sumo cursadas aprobadas}
			if codAct = regc.codigo then begin
				if regc.resultado then begin
					cursadas := cursadas + 1;
				leerC(ac,regc);
				end;
			end
			else begin
				{sino quiere decir que el codigo actual es del archivo de finales, sumo los finales aprobados}
				if codAct = regf.codigo then begin
					if regf.nota > 3 then begin
						finales := finales + 1;
					leerF(af,regf);
					end;
				end;
			end;
		end;
		{actualizo en el maestro}
		seek(mae,filepos(mae)-1);
		regmae.cantcursadasA := regmae.cantcursadasA + cursadas;
		regmae.cantmateriasF := regmae.cantmateriasF + finales;
		write(mae,regmae);
	end;
	close(mae);
	close(ac);
	close(af);
end;

var
begin
end.
