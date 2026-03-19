program nueve;
const valorAlto = 9999;
type
informacion = record
	codprov: integer;
	codlocalidad : integer;
	numeromesa : integer;
	cantvotos : integer;
end;

archivo : file of informacion;

procedure leerMae(var mae:archivo; var reg:informacion);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codprov := valorAlto;
end;

procedure leerInfo(var reg: informacion);
begin
	writeln('Ingrese cod prov');
	readln(reg.codprov);
	if reg.codprov <> valorAlto then begin
		writeln('Ingrese cod localidad');
		readln(reg.codlocalidad);
		writeln('Ingrese numero mesa');
		readln(reg.numeromesa);
		writeln('Ingrese cantidad de votos');
		readln(reg.cantvotos);
	end;
end;

procedure cargarMaestro(var mae:archivo);
var reg: informacion;
begin
	rewrite(mae);
	leerInfo(reg);
	while reg.codprov <> valorAlto do begin
		write(mae,reg);
		leerInfo(reg);
	end;
end;

procedure informar(var mae: archivo);
var reg: informacion;
begin
	reset(mae);
	leerMae(mae,reg);
	votosGenerales := 0;
	while reg.codprov <> valorAlto do begin
		provAct := regcodprov;
		writeln('Codigo de provincia ',provAct);
		while provAct = reg.codprov do begin
			locAct := reg.codlocalidad;
			votosLoc := 0;
			writeln('Codio de localidad ',locAct);
			while provAct = reg.codprov and locAct = reg.codlocalidad do begin
				mesaAct := reg.numeromesa;
				votosMesa := 0;
				while provAct = reg.codprov and locAct = reg.codlocalidad and mesaAct = reg.numeromesa do begin
					votosMesa := votosMesa + reg.cantvotos;
					leerMae(mae,reg);
				end;
				{aca cambio de mesa pero sigue en la misma localidad y prov}
				votosLoc := votosLoc + votos;
			end;
			writeln('Total de votos de la localidad ',votosLoc);
			votosProv := votosProv + votosLoc;
		end;
		writeln('Total de votos de provincia ',votosProv);
		votosGenerales := votosGenerales + votosProv;
	end;
	writeln('Total de votos generales ',votosGenerales);
	close(mae);
end;

var mae: archivo;
begin
assign(mae,'ArchivoMaestroNueve');
cargarMaestro(mae);
informar(mae);
end.
