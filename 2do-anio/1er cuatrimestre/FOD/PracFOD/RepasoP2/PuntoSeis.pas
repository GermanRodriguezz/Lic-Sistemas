program seis;
const valorAlto = 9999;
type
cant = 5;
informacioDetalle = record
	cod: integer;
	fecha : integer;
	tiempo: integer;
end;

informacionMaestro = record
	cod_usuario : integer;
	fecha : integer;
	tiempo_total_sesiones : integer;
end;

detalle = file of informacionDetalle;
maestro = file of informacionMaestro;

vectorDetalle = array [1..cant] of detalle;
vecReg = array [1..cant] of informacionDetalle;

procedure leerDet(var det: detalle; var reg: informacionDetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.cod := valorAlto;
end;

procedure minimo(var vecReg: vectorDetalle; var pos: integer);
var min,minf,i: integer;
begin
	min:= valorAlto;
	minf:= valorAlto;
	for i := 1 to cant do begin
		if vecReg[i].cod <> valorAlto then begin
			if vecReg[i].cod < min or vecReg[i].cod = min and vecReg[i].fecha < minf then begin
				min := vecReg[i].cod;
				minf := vecReg[i].fecha;
				pos := i;
			end;
		end;
	end;
end;

procedure actualizarMaestro(var mae:maestro; var det: vectorDetalle);
var vr : vecReg; i: integer; regmae: informacionMaestro; codAct,fechaAct,temp, tiempo_usuario : integer;
begin
	reset(mae);
	for i := 1 to cant do begin
		reset(det[i]);
		leerDet(det[i],vr[i]);
	end;
	read(mae,regmae);
	minimo(vr,pos);
	while regmae.cod_usuario <> valorAlto do begin
		tiempo_usuario := 0;
		codAct := regmae.cod_usuario;
		while codAct <> vr[pos].cod do
			read(mae,regmae);
		while codAct = vr[pos].cod do begin
			fechaAct := vr[pos].fecha;
			temp := 0;
			while codAct = vr[pos].cod and fechaAct = vr[pos].fecha do begin
				temp := temp + vr[pos].tiempo;
				leerDet(det[pos],vecReg[pos]);
				minimo(vr,pos);
			end;
			{sali porque cambio la fecha o el usuario}
			tiempo_usuario := tiempo_usuario + temp;
		end;
		{cambio el usuario por eso}
		regmae.total_sesiones_usuario := regmae.total_sesiones_usuario + tiempo_usuario;
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
		read(mae,regmae);
	end;
	close(mae);
	for i := 1 to cant do
		close(det[i]);
end;

var
begin
end.
