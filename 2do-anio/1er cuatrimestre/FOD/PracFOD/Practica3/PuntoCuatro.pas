program PuntoCuatro;
const valorAlto = 9999;
type
reg_flor = record
	nombre : string[45];
	codigo : integer;
end;

tArchFlores = file of reg_flor;

procedure leer(var arch: tArchFlores; var reg:reg_flor);
begin
	if not eof(arch) then
		read(arch,reg)
	else
		reg.codigo := valorAlto;
end;

procedure cargarDatos(var arch:tArchFlores);
var reg: reg_flor;
begin
	assign(texto,'archivoTexto');
	reset(texto);
	assign(arch,'archivoFlores');
	rewrite(arch);
	reg.codigo := 0;
	write(arch,reg);
	while not eof(texto) do begin
		with reg do begin
			readln(texto,codigo,nombre);
			write(arch,reg);
		end;
	end;
	close(arch);
	close(texto);
end;

procedure agregarFlor(var arch: tAtchFlores; nombre: string; codigo: integer);
var reg, cab,nuevo: reg_flor; pos: integer;
begin
	reset(arch);
	leer(arch,cab); {leo el primer registro que sera la cabecera y me lo traigo}
	leer(arch,reg);
	nuevo.nombre := nombre;
	nuevo.codigo := codigo;
	while reg.codigo <> valorAlto do begin
		if cab.codigo < 0 then begin
			{la cabecera tiene una posicion,por eso entra}
			pos := -cab.codigo; {voy a tener que ir allí}
			seek(arch,pos); {me ubico en la posicion que tiene la cabecera}
			read(arch,cab); {me copio lo que tiene esa posicion}
			{puede tener otro indice negativo(la prox pos disponible)}
			{la proxima vez que quiera agregar lo hare en esa pos que contenga la cabecera}
			seek(arch,0);
			{me ubique en la cabecera}
			write(arch,cab);
			{copie en la cabecera los datos que tenia el reg que estaba disponible}
			seek(arch,pos);
			{voy a esa posicion libre}
			write(arch,nuevo);
			{copio los nuevos datos}
		end
		else begin
			seek(arch,filesize(arch));
			write(arch,nuevo);
		end;
	end;
	close(arch);
end;

var
arch : tArchFlores;
begin
cargarDatos(arch):
writeln('ingrese nombre y codigo');
readln(nombre);
readln(codigo);
agregarFlor(arch,nombre,codigo);
end.
