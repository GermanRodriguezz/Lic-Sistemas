program catorce;
const valorAlto = '9999';
type

infomaestro = record
	destino : string[30];
	fecha : integer;
	horasalida : integer;
	cantasientos : integer;
end;

infodetalle = record
	destino : string[30];
	fecha : integer;
	horasalida : integer;
	cantasientoscomprados : integer;
end;

listado = ^nodo;
nodo = record
	dato : infomaestro;
	sig : listado;
end;

maestro = file of infomaestro;
detalle = file of infodetalle;

procedure leerMae(var mae: maestro; var reg: infomaestro);
begin
	if not eof(mae) then
		read(mae,reg)
	else
		reg.destino := valorAlto;
end;

procedure leerDet(var det:detalle;var reg: infodetalle);
begin
	if not eof(det) then
		read(det,reg)
	else
		reg.destino := valorAlto;
end;

procedure minimo(var det1,det2: detalle; var reg1,reg2,min : infodetalle);
begin
	if (reg1.destino < reg2.destino) or 
	((reg1.destino = reg2.destino) and (reg1.fecha < reg2.fecha)) or 
	((reg1.destino = reg2.destino) and (reg1.fecha = reg2.fecha) and (reg1.horasalida < reg2.horasalida)) then begin
		min := reg1;
		leerDet(det1,reg1);
	end
	else begin
		min := reg2;
		leerDet(det2,reg2);
	end;
end;

procedure agregarEnLista(var l:listado; reg: infomaestro);
var nue: listado;
begin
	new(nue);
	nue^.dato := reg;
	nue^.sig := l;
	l := nue;
end;
procedure actualizarMaestro(var mae: maestro; var det1,det2: detalle; var lista: listado);
var asientos,compradas,fechaAct,salidaAct : integer; actdest : string; 
regmae: infomaestro; reg1,reg2,min : infodetalle;
begin
	reset(mae);
	reset(det1);
	reset(det2);
	
	leerDet(det1,reg1);
	leerDet(det2,reg2);
	
	minimo(det1,det2,reg1,reg2,min);
	writeln('Ingrese cantidad especifica de asientos');
	readln(asientos);
	while min.destino <> valorAlto do begin
		actdest := min.destino;
		while actdest = min.destino do begin
			fechaAct := min.fecha;
			while actdest = min.destino and fechaAct = min.fecha do begin
				salidaAct := min.horasalida;
				compradas := 0;
				while actdest = min.destino and fechaAct = min.fecha and salidaAct = min.horasalida do begin
					compradas := compradas + min.cantasientoscomprados;
					minimo(det1,det2,reg1,reg2,min);
				end;
				leerMae(mae,regmae);
				while regmae.destino <> actdest or regmae.fecha <> fechaAct or regmae.horasalida <> regmae.salidaAct do
					leerMae(mae,regmae);
				regmae.cantasientos := regmae.cantasientos - compradas;
				seek(mae,filepos(mae)-1);
				write(mae,regmae);
				if regmae.cantasientos < asientos then
					agregarEnLista(lista,regmae);
			end;
		end;
	end;
end;

var
begin
end;
