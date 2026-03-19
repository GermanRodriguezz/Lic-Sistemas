program seis;
const valorAlto = 9999;
type
prenda = record
	codprendra : integer;
	descrip : string;
	colores : integer;
	tipoprenda : string;
	stock : integer;
	preciounitario : real;
end;

archivo = file of prendra;

archivoParaBajas = file of integer;

procedure leerMae(var mae: archivo; var reg: archivoParaBajas);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.codprenda := valorAlto;
end;

procedure leerArchivo(var ar: archivoParaBajas; var num:integer);
begin
	if not eof(ar) then
		read(ar,num);
	else
		num := valorAlto;
end;

procedure bajas(var mae:archivo; var arch: archivoParaBajas);
var num: integer; reg,cabecera: prenda;
begin
	reset(mae);
	reset(arch);
	leerArchivo(arch,num);
	leerMae(mae,cabecera);
	while num <> valorAlto do begin
		leerMae(mae,reg);
		while reg.codprenda <> valorAlto do begin
			if reg.codprenda = cod then begin
				reg.stock := -reg.stock;
				seek(mae,filepos(mae)-1);
				write(mae,reg);
				leerArchivo(arch,num);
			end
			else
				leerMae(mae,reg);
		end;
	end;
	close(mae);
	close(arch);
end;

var
begin
end.
