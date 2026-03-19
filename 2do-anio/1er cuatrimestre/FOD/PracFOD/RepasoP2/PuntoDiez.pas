program diez;
const valorAlto = 9999;
type
rango = 1..15;
empleado = record
	depto : integer;
	division : integer;
	numempleado: integer;
	cat : rango;
	canthoras : integer;
end;

extras = record
	precio : real;
end;

archivo = file of empleado;

vector = array [rango] of extras;

procedure cargarVector(var v: vector);
var i : integer; e: extras;
begin
	assign(txt,'Archivohoras.txt');
	reset(txt);
	while not eof(txt) do begin
		with e do begin
			read(txt,cat,' ',precio);
			v[cat] := precio;
		end;
	end;
	
end;

procedure leerReg(var reg: empleado);
begin
	writeln('Ingrese departamento');
	readln(reg.depto);
	if reg.depto <> valorAlto then begin
		writeln('Ingrese division');
		readln(reg.division);
		writeln('Ingrese numero empleado');
		readln(reg.numempleado);
		writeln('Ingrese categoria');
		readln(reg.cat);
		writeln('Ingrese cantidad de horas extras');
		readln(reg.canthoras);
	end;
end;

procedure leerMae(var mae: archivo; var reg:empleado);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.depto := valorAlto;
end;

procedure cargarMaestro(var mae:archivo);
var
begin
	rewrite(mae);
	leerReg(reg);
	while reg.depto <> valorAlto do begin
		write(mae,reg);
		leerReg(reg);
	end;
end;

procedure informar(var mae:archivo);
var v: vector; deptoAct, divAct,empleAct,horas, TotalHorasDiv,TotalHorasDepto: integer; monto, TotalMontoDiv,TotalMontoDepto: real; 
begin
	reset(mae);
	leerMae(mae,reg);
	while reg.depto <> valorAlto do begin
		deptoAct := reg.depto;
		writeln('DEPARTAMENTO ',deptoAct);
		while deptoAct = reg.depto do begin
			divAct := reg.division;
			writeln('DIVISION',divAct);
			while deptoAct = reg.depto and divAct = reg.division do begin
				empleAct := reg.numempleado;
				writeln('NUMERO DE EMPLEADO ',empleAct);
				while deptoAct = reg.depto and divAct = reg.division and empleAct = reg.numempleado do begin
					writeln('Total de Hs',reg.canthoras);
					monto := reg.canthoras  * v[reg.cat];
					horas := horas + reg.canthoras;
					writeln('IMPORTE A COBRAR',monto);
					leerMae(mae,reg);
				end;
				{cambio el empleado}
				TotalHorasDiv := TotalHorasDiv + horas;
				TotalMontoDiv := TotalMontoDiv + monto;
			end;
			writeln('Total de horas divion ',TotalHorasDiv);
			writeln('Monto total por division ',TotalMontoDiv);
			TotalHorasDepto := TotalHorasDepto + TotalHorasDiv;
			TotalMontoDepto := TotalMontoDepto + TotalMontoDiv;
		end;
		writeln('TOTAL HORAS DEPARTAMENTO',TotalHorasDepto);
		writeln('MONTO TOTAL DEPARTAMENTO',TotalMontoDepto);
	end;
	close(mae);
end;



















var
begin
end.
