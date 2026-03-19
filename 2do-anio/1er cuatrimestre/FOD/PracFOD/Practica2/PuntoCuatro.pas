program puntoCuatro;
const valorAlto = '9999';
type
informacionMaestro = record
	nomProv : string;
	cant_personas_alfab : integer;
	total_encuestados : integer;
end;

informacionDetalle = record
	nombre_provincia : string;
	codigo_localidad : integer;
	cant_alfab : integer;
	cant_encuestados : integer;
end;

Detalle = file of informacionDetalle;
Maestro = file of informacionMaestro;

procedure leer(var archivo: Detalle; var dato: informacionDetalle);
begin
	if not eof(archivo) then
		read(archivo,dato)
	else
		dato.nombre_provincia := valorAlto;
end;

procedure cargarMaestro(var mae:Maestro; var maetxt:Text);
var regm: informacionMaestro;
begin
	reset(maetxt);
	assign(mae,'ArchivoMaestro4');
	rewrite(mae);
	while not eof(maetxt) do begin
		with regm do begin
			readln(maetxt, cant_personas_alfab,total_encuestados,nomProv );
			end;
		write(mae,regm);
	end;
	writeln('Se cargo el Archivo Maestro');
	close(mae);
	close(maetxt);
end;

procedure cargarDetalle(var det:Detalle; var dettxt:Text);
var regd: informacionDetalle;
begin
	reset(dettxt);
	assign(det,'ArchivoDetalle4');
	rewrite(det);
	while not eof(dettxt) do begin
		with regd do begin
			readln(dettxt,codigo_localidad,cant_alfab,cant_encuestados,nombre_provincia);
		end;
		write(det,regd);
	end;
	writeln('Se cargo el Archivo Detalle');
	close(det);
	close(dettxt);
end;

procedure minimo(var det1,det2: Detalle; var regd1,regd2,min:informacionDetalle);
var pos: integer;
begin
	if (regd1.nombre_provincia < regd2.nombre_provincia) then begin
		min := regd1;
		leer(det1,regd1);
	end
	else begin
		min := regd2;
		leer(det2,regd2);
	end;
end;

procedure actualizarMaestro(var mae:Maestro;var det1,det2: Detalle);
var auxM: informacionMaestro; reg1,reg2,min: informacionDetalle;
begin
	reset(mae);
	reset(det1);
	reset(det2);
	leer(det1,reg1);
	leer(det2,reg2);
	minimo(det1,det2,reg1,reg2,min);
	while (min.nombre_provincia <> valorAlto) do begin
		read(mae,auxM);
		while (min.nombre_provincia <> auxM.nomProv) do 
			read(mae,auxM);
			while (min.nombre_provincia = auxM.nomProv) do begin
				auxM.cant_personas_alfab := auxM.cant_personas_alfab + min.cant_encuestados;
				auxM.total_encuestados := auxM.total_encuestados + min.cant_alfab;
				minimo(det1,det2,reg1,reg2,min);
			end;
		seek(mae,filepos(mae)-1);
		write(mae,auxM);
	end;
	writeln('Se actualizo el Archivo Maestro');
	close(mae);
	close(det1);
	close(det2);
end;

procedure imprimirMae(var mae:Maestro);
var regm: informacionMaestro;
begin
	reset(mae);
	while not eof(mae) do begin
		read(mae,regm);
		writeln('Provincia = ',regm.nomProv, ', Alfabetizados = ',regm.cant_personas_alfab,', Encuestados = ',regm.total_encuestados);
	end;
	close(mae);
end;

var
mae: Maestro;
det1,det2: Detalle;
dettxt1,dettxt2,maetxt: Text;

begin	
assign(maetxt,'Maestro4.txt');
assign(dettxt1,'Detalle1.txt');
assign(dettxt2,'Detalle2.txt');
cargarMaestro(mae,maetxt);
cargarDetalle(det1,dettxt1);
cargarDetalle(det2,dettxt2);
writeln('se imprimira maestro por defecto');
imprimirMae(mae);
writeln('se imprimira el maestro actualizado');
actualizarMaestro(mae,det1,det2);
imprimirMae(mae);

end.

