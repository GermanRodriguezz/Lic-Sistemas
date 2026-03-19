program PuntoCinco;
const valorAlto : 9999;
type
reg_flor = record
	nombre : string[45];
	codigo : integer;
end;

tArchFlores = file of reg_flor;

procedure leer(var arch:tArchFlores; var reg:reg_flor);
begin
	if not eof(arch) then
		read(arch,reg)
	else
		reg.codigo := valorAlto;
end;
procedure eliminarFlor(var arch: tArchFlores; flor: reg_flor);
var reg,cab: reg_flor; pos: integer;
begin
	reset(arch);
	leer(arch,cab);
	leer(arch,reg);
	while reg.codigo <> valorAlto do begin
		if reg.codigo = flor.codigo then begin
			pos := filepos(arch)-1;
			seek(arch,pos);
			reg.codigo := cab.codigo; {me guardo la primera posicion disponible}
			write(arch,reg);
			
			cab.codigo := -pos; {en esta posicion ahora está la ANTERIOR POSICION DISPONIBLE}
			seek(arch,0);
			write(arch,cab);
			
		end;
	end;
	close(arch);
end;

var
	arch: tArchFlores; reg: reg_flor;
begin
assign(arch,'archivoFlores');
writeln('ingrese nombre y codigo de flor');
readln(reg.nombre);
readln(reg.codigo);
eliminarFlor(arch,reg);
end.
