program PuntoDiez;
const valorAlto = 9999;
type

informacion = record
	cod_provincia: integer;
	cod_localidad : integer;
	num_mesa : integer;
	cant_votos_mesa : integer;
end;

maestro = file of informacion;

procedure leer(var archivo: maestro; var reg: informacion);
begin
	if not eof(archivo) then
		read(archivo,reg)
	else
		reg.cod_provincia := valorAlto;
end;

procedure crearMaestro(var mae: maestro);
var maetxt: Text; reg: informacion;
begin
	assign(maetxt,'maestroTexto');
	reset(maetxt);
	assign(mae, 'ArchivoMaestroDiez');
	rewrite(mae);
	while not eof(maetxt) do begin
		with reg do begin
			readln(maetxt, cod_provincia, cod_localidad, num_mesa, cant_votos_mesa);
		end;
		write(mae, reg);
	end;
	close(mae);
	close(maetxt);
end;

procedure procesarInformacion(var archivo:maestro);
var reg: informacion; provActual, localidadActual, votos_generales,total_votos_loc,total_votos_prov : integer;
begin
	reset(archivo);
	leer(archivo,reg);
	votos_generales := 0;
	while (reg.cod_provincia <> valorAlto) do begin
		provActual := reg.cod_provincia;
		total_votos_prov := 0;
		writeln('Provincia__',provActual);
		while (provActual = reg.cod_provincia) do begin
			localidadActual := reg.cod_localidad;
			total_votos_loc := 0;
			writeln('Localidad__', localidadActual);
			while (provActual = reg.cod_provincia) and (localidadActual = reg.cod_localidad) do begin
				total_votos_loc := total_votos_loc + reg.cant_votos_mesa;
				leer(archivo,reg);
			end;
			total_votos_prov := total_votos_prov + total_votos_loc;
		end;
		writeln('TOTAL DE VOTOS PROVINCIA :' ,total_votos_prov);
		votos_generales := votos_generales + total_votos_prov;
	end;
	writeln('Total de votos :___',votos_generales);
	close(archivo);
end;

var
archivo : maestro;
begin
crearMaestro(archivo);
procesarInformacion(archivo);
end.
