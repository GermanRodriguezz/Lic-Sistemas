program uno;
const valorAlto = 9999;
type
alumno = record
	codalumno : integer;
	apellido : string;
	nombre : string;
	cant_mat_ap_sin_final : integer;
	cant_mat_ap_con_final : integer;
end;

regdet = record
	codigo : integer;
	aprobo : boolean;
end;

archivoMaestro : file of alumno;

archivoDetalle : file of regdet;

procedure leerMae(var mae:archivoMaestro; var reg: alumno);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codalumno := valorAlto;
end;

procedure leerDet(var a:archivoDetalle; var reg: regdet);
begin
	if not eof(a)then
		read(a,reg)
	else
		reg.codigo := valorAlto;
end;
procedure actualizarMaestro(var mae: archivoMaestro; var det: archivoDetalle);
var regdeta: regdet; regmae: alumno; cant_sin_final,cant_con_final : integer;
begin
	reset(mae);
	reset(det);
	leerMae(mae,regmae);
	leerDet(det,regdeta);
	while regdeta.codigo <> valorAlto do begin
		while regdeta.codigo <> regmae.codalumno do
			leerMae(mae,regmae);
		cant_sin_final := 0;
		cant_con_final := 0;
		while regdeta.codigo = regmae.codalumno do begin
			if regdeta.aprobo then begin
				regmae.cant_mat_ap_con_final := regmae.cant_mat_ap_con_final + 1;
				regmae.cant_mat_ap_sin_final := regmae.cant_mat_ap_sin_final - 1;
			end
			else
				regmae.cant_mat_ap_sin_final := regmae.cant_mat_ap_sin_final + 1;
			leerDet(det,regdeta);
		end;
		seek(mae,filepos(mae)-1);
		write(mae,regmae);
	end;
	close(mae);
	close(det);
end;

procedure Listar(var mae: archivoMaestro);
var regmae: alumno;
begin
	reset(mae);
	leerMae(mae,regmae);
	writeln('Alumnos con mas finales aprobados que materias sin finales aprobados');
	while regmae.codalumno <> valorAlto do begin
		if regmae.cant_mat_ap_con_final > regmae.cant_mat_ap_sin_final then begin
			writeln('Codigo Alumno : ',regmae.codalumno, ' Apellido y Nombre : ',regmae.apellido,' ',regmae.nombre);
		end;
		leerMae(mae,regmae);
	end;
	close(mae);
end;

var mae: archivoMaestro; det: archivoDetalle;
begin
assign(mae,'ArchivoMaestroDos');
assign(det,'ArchivoDetalleDos');
actualizarMaestro(mae,det);
Listar(mae);
end.
