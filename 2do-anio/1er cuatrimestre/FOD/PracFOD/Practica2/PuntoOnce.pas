program PuntoOnce;
const valorAlto : '9999'; 
type
subrango = 1..15;
empleado = record
	departamento : string;
	division: integer;
	num_empleado : integer;
	categoria : subrango;
	cant_horas_extras : integer;
end;

maestro = file of empleado;

vector = array [subrango] of real;
{en este vector tengo cargados los montos x categoria de empleado}
procedure cargarMontoCategoria(var vec: vector);
var cat: subrango; monto: real;
begin
	assign(costos, 'CostosDeCategoria.txt');
	reset(costos);
	while not eof(costos) do begin
		readln(costos, cat,monto);
		vec[cat] := monto;
	end;
	close(costos);
end;

procedure leer(var mae:maestro; var e: empleado);
begin
	if not eof(mae) then
		read(mae,e)
	else
		e.departamento := valorAlto;
end;

{aca cargo desde un txt maestro,un binario maestro}
procedure crearMaestro(var mae: maestro);
var emp: empleado;
begin
	assign(maetxt,'Maestro11.txt');
	reset(maetxt);
	assign(mae,'MaestroOnce');
	rewrite(mae);
	while not eof(maetxt) do begin
		with emp do begin
			readln(maetxt, division,num_empleado,categoria,cant_horas_extras);
		end;
	end;
	close(mae);
	close(maetxt);
end;

procedure procesarInformacion(var mae:maestro; vec:vector);
var e:empleado; divActual,depActual: integer; horas_div,monto_div,horas_depa,monto_depa: integer;
begin
	reset(mae);
	leer(mae,e);
	while (e.departamento <> valorAlto) do begin
		depActual := e.departamento;
		while (depActual = e.departamento) do begin
			divActual := e.division;
			horas_div := 0; monto_div := 0;
			while (divActual = e.division) do begin
				importe := (vec[e.categoria] * e.cant_horas_extras);
				writeln('Numero de Empleado ',e.num_empleado,' Total de hs ',e.cant_horas_extras, ' Importe a cobrar ', importe);
				horas_div := horas_div + e.cant_horas_extras;
				monto_div := monto_div + importe;
			end;
			writeln('Total de horas division',horas_div);
			writeln('Total de monto division',monto_div);
			horas_depa := horas_depa + horas_div;
			monto_depa := monto_depa + monto_div;
		end;
		writeln('Total de horas departamento',horas_depa);
		writeln('Total de monto departamento',monto_depa);
	end;
end;

var
	mae: maestro;
	vec: vector;
begin
	crearMaestro(mae);
	cargarMontoCategoria(vec);
	procesarInformacion(mae,vec);
end.
