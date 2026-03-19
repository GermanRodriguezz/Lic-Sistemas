program parcial;
type rangomes = 1..12;
atencion = record
	matricula : integer;
	dniPaciente: integer;
	mes: rangomes;
	diagnostico : string;
end;

info = record
	dni : integer;
	diag : string;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : info;
	hi : arbol;
	hd : arbol;
end;

vector = array [rangomes] of arbol;

procedure leerAtencion(var at:atencion);
var v : array [1..5] of string = ('L','M','N','O','P');
begin
	at.matricula := random(50);
	if (at.matricula <> 0) then begin
		at.dniPaciente := random(2000);
		at.mes := random(12)+1;
		at.diagnostico := v[random(5)+1];
	end;
end;

procedure insertar(var a:arbol; at:atencion);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.dni := at.dniPaciente;
		a^.dato.diag := at.diagnostico;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.dni > at.dniPaciente) then
			insertar(a^.hi,at)
		else
			insertar(a^.hd,at);
end;

procedure cargarVector(var v:vector);
var at:atencion;
begin
	leerAtencion(at);
	while (at.matricula <> 0) do begin
		insertar(v[at.mes],at);
		leerAtencion(at);
	end;
end;

procedure imprimirOrdA(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrdA(a^.hi);
		writeln('dni paciente ', a^.dato.dni, ' diagnostico ', a^.dato.diag);
		imprimirOrdA(a^.hd);
	end;
end;

procedure imprimirVector(v:vector);
var i: integer;
begin
	for i := 1 to 12 do begin
		writeln('IMPRIMIRA EL ARBOL DEL MES ', i);
		imprimirOrdA(v[i]);
		writeln('');
	end;
end;

procedure sacarMax(a:arbol; var cant:integer);
begin
	if (a <> nil) then begin
		cant := cant + 1;
		sacarMax(a^.hi,cant);
		sacarMax(a^.hd,cant);
	end;
end;

procedure moduloB(v:vector;var cantAtencionesMax:integer;var m: integer;pos:integer);
var cant : integer;
begin
	cant := 0;
	if (pos <= 12) then begin
		sacarMax(v[pos],cant);
		writeln('las atenciones del mes ', pos , ' fueron ', cant);
		if (cant > cantAtencionesMax) then begin
			cantAtencionesMax := cant;
			m := pos;
		end;
		moduloB(v,cantAtencionesMax,m,pos+1);
	end;
end;

procedure busca(a:arbol; dni:integer; var ok:boolean);
begin
	if (a = nil) then
		ok := false
	else begin
		if (a^.dato.dni = dni) then
			ok := true
		else if (a^.dato.dni > dni) then begin
				busca(a^.hi,dni,ok);
				busca(a^.hd,dni,ok);
			end
			else
				busca(a^.hd,dni,ok);
	end;
end;

procedure moduloC(v:vector;dni: integer; var ok:boolean);
var i:integer;
begin
	i := 1;
	while (i <= 12) and (ok = false) do begin
		busca(v[i],dni,ok);
		i := i + 1;
	end;
end;

var
v: vector;
i: integer;
posicion,cantidad,mes : integer;
dni: integer;
pude: boolean;
begin
randomize;

for i := 1 to 12 do
	v[i]:= nil;

cargarVector(v);
imprimirVector(v);

posicion := 1;
cantidad := -1;
moduloB(v,cantidad,mes,posicion);
writeln('el mes con con mayor cantidad de atenciones fue ', mes);

writeln('ingrese dni a buscar');
readln(dni);
moduloC(v,dni,pude);
if (pude) then
	writeln('se atendio al paciente con el dni ', dni)
else
	writeln('no se atendio al paciente con el dni ',dni);
end.














































var
begin
end.
