program PuntoSeis;
const valorAlto: 9999;
type
cantMaquinas = 5;
fec = record
	dia : rangodias;
	mes : rangomes;
	anio : integer;
end;

infoDetalle = record
	cod_usuario : integer;
	fecha : fec;
	tiempo_sesion : integer;
end;

infoMaestro = record
	cod_usu: integer;
	fecha : fec;
	tiempo_total_de_sesiones_abiertas : integer;
end;

Maestro = file of infoMaestro;
Detalle = file of infoDetalle;
vectorDetalles = array [1..cantMaquinas] of Detalle;  {cada maquina tiene su archivo detalle}
vectorRegistros = array [1..cantMaquinas] of infoDetalle;

procedure leer(var det: vectorDetalles; var reg: infoDetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.cod_usuario := valorAlto;
end;


procedure minimo(var vector: vectorDetalles; var vecReg:vectorRegistros; var min:infoDetalle; pos: integer);
var i: integer;
begin
	min.cod_usuario := valorAlto;
	for i:= 1 to cantMaquinas do begin {recorro mis detalles}
		if vecReg[i].cod_usuario < min.cod_usuario then	begin {voy comparando sus primeros registros}
			min := vecReg[i];
			pos := i;
		end;
		if min.cod_usuario <> valorAlto then
			leer(vector[pos],vecReg[pos]); {aca voy a buscar al detalle minimo su primer registro para ubicarlo en el merge}
	end;
end;

procedure crearMaestro(var mae:Maestro; var vecDetalles: vectorDetalles);
var regM: infoMaestro; vecReg: infoDetalle;
begin
	assign(maestro,'AchivoMaestro6');
	rewrite(maestro);
	for i := 1 to cantMaquinas do begin {abro los n detalles con el for y leo su primer registro}
		reset(vecDetalles[i]);
		leer(vecDetalles[i],vecReg[i]);
	end;
	minimo(vecDetalles, vecReg, min, pos); {busco el reg minimo de los detalles}
	while min.cod_usuario <> valorAlto do begin
		usu_actual := vecReg.cod_usuario;
		fecha_actual := vecReg.fecha;
		while min.cod_usuario <> vecReg.cod_usuario do
			read(mae,regM);
		while vecReg.cod_usuario = usu_actual do begin
			while vecReg.cod_usuario = usu_actual and vecReg.fecha.anio = fecha_actual.anio and vecReg.fecha.mes = and vecReg.fecha.dia = fecha_actual.dia do begin
				sesion_abierta := sesion_abierta + vecReg.tiempo_sesion; {acumulo los tiempos del codigo que recibo y su fecha}
				minimo(vecDetalles,vecReg,min,pos); {busco otro reg en el mismo detalle de donde lo encontre}
			end;
			read(mae,regM);{salgo cuando cambio el codigo de usuario,entonces me traigo el registro del maestro para actualizarle los datos}
			seek(mae,filepos(mae)-1);
			regM.tiemp_total_de_sesiones_abiertas := sesion_abierta;
			write(mae,regM); {escribo el registro modificado}
		end;
		close(mae);
		writeln('Se actualizo el maestro');
		for i:= 1 to cantMaquinas do
			close(vecDetalles[i]);
	end;
end;

var
begin
crearMaestro(mae,vecDetalles);
end.
