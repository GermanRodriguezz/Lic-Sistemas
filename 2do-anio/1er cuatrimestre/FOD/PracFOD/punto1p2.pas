program cuatro
const valorAlto : 9999;
type

empleado = record
	codigo : integer;
	nombre : string;
	montocomision : real;
end;

archivo = file of empleado;

procedure leer(var a:archivo; var reg: empleado);
begin
	if not eof(a) then 
		read(a,reg)
	else
		reg.codigo := valorAlto;
end;

procedure minimo(var a:archivo; var reg,min: empleado);
begin
	if reg.codigo <> valorAlto then begin
		min.codigo := valorAlto;
		if reg.codigo < min.codigo then
			min := reg;
	end;
end;

procedure compactar(var a:archivo; var an:archivo);
var nue:empleado; actual : integer;
begin
	reset(a);
	assign(nuevo,'nuevo.dat');
	rewrite(nuevo);
	leer(a,reg);
	minimo(a,reg,min);
	while min.codigo <> valorAlto do begin
		actual := min.codigo;
		while min.codigo <> valorAlto and min.codigo = actual do begin
			comision := comision + min.montocomision;
			minimo(a,reg,min);
		end;
		nue.montocomison := comision;
		nue.codigo := actual;
		nue.nombre := min.nombre;
		write(an,nue);
	end;
	close(a);
	close(an);
end;

var
begin
end.
