program PuntoCatorce;
const valorAlto = '9999'
type
vuelo = record
	destino : string;
	fecha : integer;
	horaSalida : integer;
	cantidadAsientosDis: integer;
end;

infoDetalle = record
	destino : string;
	fecha : integer;
	horaSalida : integer;
	cantidadAsientosCom : integer;
end;

Maestro = file of vuelo; {el que tengo que ir actualizando}
Detalle = file of infoDetalle; {de este voy a tener dos por dia}

procedure leerMae(var mae:Maestro; var reg: vuelo);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.destino := valorAlto;
end;

procedure leer(var det:Detalle; var reg: infoDetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.destino := valorAlto;
end;

procedure minimo(var det1,det2: Detalle; var reg1,,reg2,min : infoDetalle);
var 
begin
	if reg1.destino < reg2.destino and reg1.fecha < reg2.fecha and reg1.horaSalida < reg2.horaSalida then begin
		min = reg1;
		leer(det1,reg1)
	end
	else 
		if reg2.destino < reg1.destino and reg2.fecha < reg1.fecha and reg2.horaSalida < reg2.horaSalida then begin
			min := reg2;
			leer(det2,reg2);
		end;
end;

procedure crearMaestro(var mae:Maestro);
var maeTxt : Text; reg: vuelo;
begin
	assign(maeTxt,'Maestro.txt');
	reset(maeTxt);
	assign(mae,'Maestro.dat');
	rewrite(mae);
	while not eof(maeTxt) do begin
		with reg do begin
			readln(maeTxt, fecha,horaSalida,cantAsientosDis, destino);
			write(mae,reg);
		end;
	end;
	writeln('se cargo el binario del maestro');
	close(mae);
	close(maeTxt);
end;

procedure cargarDetalles(var det1,det2: Detalle);
var reg: infoDetalle;
begin
	assign(detatxt,'Detalle1.txt');
	reset(detatxt);
	assign(det1,'detalle1');
	rewrite(det1);
	while not eof(detatxt) do begin
		with reg do begin
			readln(detatxt, fecha, horaSalida,cantAsientosCom, destino);
			write(det1,reg);
		end;
	end;
	close(det1);
	close(detatxt);
	
	assign(detatxt,'Detalle2.txt');
	reset(detatxt);
	assign(det2,'detalle2');
	rewrite(det2);
	while not eof(detatxt) do begin
		with reg do begin
			readln(detatxt, fecha, horaSalida, cantAsientosCom, destino);
			write(det2,reg);
		end;
	end;
	close(det2);
	close(detatxt);
end;

procedure actualizarMaestro(var mae:Maestro; var det1,det2: Detalle);
var
begin
	reset(mae);
	reset(de1);
	reset(det2);
	leer(det1,reg1);
	leer(det2,reg2);
	leerMae(mae,regm);
	minimo(det1,det2,reg1,reg2,min);
	while min.destino <> valorAlto do begin
		while regm.destino <> min.destino and regm.fecha <> min.fecha and regm.horaSalida <> min.horaSalida do
			read(mae,reg);
		destinoAct := min.destino;
		while destinoAct := min.destino do begin
			fechaAct := min.fecha;
			while destinoAct := min.destino and fechaAct = min.fecha do begin
				horaAct := min.horaSalida;
				while destinoAct := min.destino and fechaAct = min.fecha and horaAct = min.horaSalida do begin
					asientosComprados := asientosComprados + min.cantAsientosCom;
					minimo(det1,det2,reg1,reg2,min);
				end;
			end;
		end;
		writeln('ingrese un numero de asientos disponibles para el vuelo');
		readln(asientos);
		read(mae,regm);
		seek(mae,filepos(mae)-1);
		regm.cantAsientosDis := regm.cantAsientosDis - asientosComprados;
		if regm.cantAsientosDis < asientos then
			VuelosListados(lista,regm);
		write(mae,regm);
	end;
	close(mae);
	close(det1);
	close(det2);
end;



var
begin
end.
