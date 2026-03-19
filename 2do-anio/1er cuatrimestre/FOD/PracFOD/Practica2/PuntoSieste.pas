program puntoSiete;
const valorAlto = 999;
type
infoMaestro = record
	cod_alumno : integer;
	apeynom : string;
	cant_cursadas_ap : integer;
	cant_mat_final_ap : integer;
end;

infoDetalleCursada = record
	codalu: integer;
	cod_materia : integer;
	anio_cursada : integer;
	resultado : integer;
end;

infoDetalleFinal = record
	codalu: integer;
	cod_materia: integer;
	fecha_examen: integer;
	nota: integer;
end;

Maestro = file of infoMaestro;
DetalleCursada = file of infoDetalleCursada;
DetalleFinal = file of infoDetalleFinal;

crearDetalleC(var detC: detalleCursada);{se dispone}
crearDetalleF(var detF: detalleFinal); {se dispone}
crearMaestro(var mae:Maestro); {se dispone}
procedure leerCursada(var archivo: detalleCursada; var reg: infoDetalleCursada);
begin
	if not eof(archivo) then
		read(archivo,reg)
	else
		reg.codalu := valorAlto;
end;

procedure leerFinal(var archivo: DetalleFinal; var reg:infoDetalleFinal);
begin
	if not eof(archivo) then
		read(archivo,reg)
	else
		reg.codalu := valorAlto;
end;

procedure minimo(var DC: DetalleCursada; var DF: DetalleFinal; var minC: infoDetalleCursada; var minF: infoDetallaFinal);
var regC: infoDetalleCursada; regF: infoDetalleFinal;
begin
	read(DC,regC);
	read(DF,regF);
	if regC.codalu <> valorAlto and regF.codalu <> valorAlto then begin
		if regC.codalu < regF.codalu then
			if regC.codmateria < regF.codmateria then begin
				minC := regC;
				minF.codalu := -1;
				leerCursada(DC,regC)
			end
		else
			if regF.codmateria < regC.codmateria then begin
				minF := regF;
				minC.codalu := -1;
				leerFinal(DF,regF);
			end;
	end;
end;

procedure actualizarMaestro(var mae: Maestro; var DC: infoDetalleCursada; var DF: infoDetalleFinal);
var regM: infoMaestro; minC: infoDetalleCursada; regF: infoDetalleFinal;
begin
	assign(DC,'ArchivoCursada');
	assign(DF,'ArchivoFinal');
	assign(mae,'ArchivoMaestro7');
	rewrite(mae);
	reset(DC);
	reset(DF);
	leerCursada(DC,regC);
	leerFinal(DF,regF);
	minimo(DC,DF,minC,minF);
	while minC.codalu <> valorAlto or minF.codalu <> valorAlto do begin
		if minC.codalu <> -1 then begin
			codactual := minC.codalu;
			while minC.codalu = codactual do begin
				if minC.resultado > 3 then begin
					cant_aprobada := cant_aprobada + 1;
					minimo(DC,DF,minC,minF);
				end;
			end;
			while minC.codalu <> codactual do
				read(mae,regM);
			read(mae,regM);
			seek(mae,filespos(mae)-1);
			regM.cant_cursadas_ap := regM.cant_cursadas_ap + cant_aprobada;
			write(mae,regM);
		end
		else begin
			if minF.codalu <> -1 then begin
				codactual := minF.codalu;
				while minF.codalu = codactual do begin
					if minF.nota > 3 then begin
						cant_aprobada := cant_aprobada + 1;
						minimo(DC,DF,minC,minF);
					end;
				end;
				while minF.codalu <> codactual do
					read(mae,regM);
				read(mae,regM);
				seek(mae,filepos(mae)-1);
				regM.cant_mat_final_ap := regM.cant_mat_final_ap + cant_aprobada;
				write(mae,regM);
			end;
		end;
	end;
	close(mae);
	close(DC);
	close(DF);
end;

var
begin
crearDetalleC(DC);
crearDetalleF(DF);
crearMaestro(mae);
actualizarMaestro(mae,DC,DF);
end.
