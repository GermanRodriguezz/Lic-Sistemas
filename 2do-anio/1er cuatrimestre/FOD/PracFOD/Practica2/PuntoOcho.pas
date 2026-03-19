program PuntoOcho;
const valorAlto = 9999; dimF = 5;
type
infoMaestro = record
	cod_provincia: integer;
	nombre_prov: string;
	cant_habitantes : integer;
	cant_kilos_consumidos : integer;
end;

infoDetalle = record
	cod_prov : integer;
	cant_kilos: integer;
	
end;

Maestro = file of infoMaestro;
Detalle = file of infoDetalle;

vectorDetalles = array [1..dimF] of Detalle;
vectorRegistros = array [1..dimF] if infoDetalle;

procedure leer(var det: Detalle; var reg; infoDetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.cod_prov := valorAlto;
end;

{procedure minimo(var vecDet: vectorDetalles; var vecReg: vectorRegistros; var min: infoDetalle; var pos: integer);
var
begin
	min.cod_prov := valorAlto;
	for i := 1 to 5 do begin
		if vecReg[i].cod_prov < min.cod_prov then begin
			min := vecReg[i];
			pos := i;
		end;
		if min.cod_prov <> valorAlto then
			leer(vecDet[pos],vecReg[pos]);
	end;
end;}

procedure minimo (var vecDet: vectorDetalles; var vecReg: vectorRegistros;var min:infoDetalle );
var
	i,pos: integer;
begin
	min.cod_prov:= valorAlto;
	for i:= 1 to dimF do begin
		if(vecReg[i].cod_prov<min.cod_prov)then begin
			pos:= i;
			min:= vecReg[i];
		end;
	end;
	leer(vecDet[pos],vecReg[pos]);
end;	
	

procedure crearMaestro(var mae: Maestro);
var regM: infoMaestro;
begin
	assign(maetxt,'detalle7txt');
	reset(maetxt);
	assig(mae,'Maestro7');
	rewrite(mae);
	while not eof(maetxt) do begin
		with regM do begin
			readln(maetxt,cod_provincia,cant_habitantes,cant_kilos_consumidos, nom_prov);
			write(mae,regM);
		end;
	end;
	writeln('Se creo el archivo binario maestro');
	close(mae);
	close(maetxt);
end;

procedure crearUnDetalle(var archivo: Detalle);
var regD: infoDetalle;
begin
	writeln('ingrese la ruta del detalle ');
	readln(nombre);
	assign(detatxt,nombre);
	reset(detatxt);
	writeln('ingrese nombre de archivo binario del detalle');
	readln(nombre);
	assign(mae,nombre);
	rewrite(mae)
	while not eof(detatxt) do begin
		with regD do begin
			readln(detatxt,cod_prov,cant_kilos);
			write(archivo,regD);
		end;
	end;
	writeln('se creo el archivo binario de detalle');
	close(archivo);
	close(detatxt);
end;

procedure crearDetalles(var vecDet:vectorDetalles);
var
begin
	for i 1 to dimF do begin
		crearUnDetalle(vecDet[i]);
		writeln('Se creo el detalle n°',i);
		end;
end;

procedure actualizar(var mae:Maestro; var vecDet: vectorDetalles);
var 
	vecReg,min: infoDetalle; regM:infoMaestro;
	cant_yerba: integer;
begin
	reset(mae);
	read(mae);
	 for i := 1 to dimF do begin
		reset(vecDet[i]);
		leer(vecDet[i],vecReg[i]);
	end;
	while min.cod_prov <> valorAlto do begin
		prov_actual := vecReg[i].cod_prov;
		cant_yerba:=0;
		while(prov_actual=min.cod_prov)do begin
			cant_yerba := cant_yerba + min.cant_kilos;
			minimo(vecDet,vecReg,min);
		end;
		while(regMae.cod_prov<>prov_actual)do 
			read(mae,regMae);
		regMae.cant_kilos_consumidos:= regMae.cant_kilos_consumidos + cant_yerba;
		seek(mae,filepos(mae)-1);
		write(mae,regMae);
		if regM.cant_kilos_consumidos > 10000 then begin
			writeln('El nombre y cod de la provincia que superan los 10.000 kilos son :', regM.nombre_prov ' - ' , regM.cod_provincia);
			writeln('El promedio de yerba consumido por habitante es : '(regM.cant_kilos_consumidos/ regM.cant_habitantes));
		end;
	end;
	close(vecDet[i]);
end;
	close(mae);
	writeln('Se actualizo el maestro');
end;

var mae: Maestro; vecDetalle: vectorDetalles;
begin
crearMaestro(mae);
crearDetalles(vecDetalle);
end.
