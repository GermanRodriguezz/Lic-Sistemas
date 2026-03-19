program parcial;
type rangodias = 1..7;
alquiler = record
	dni: integer;
	numChasis: integer;
	cantDias: rangodias;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : alquiler;
	hi : arbol;
	hd : arbol;
end;

vectorAlquiler = array [rangodias] of arbol;

procedure leerAlquiler(var al: alquiler);
begin
	al.numChasis := random(250);
	if (al.numChasis <> 0) then begin
		al.dni := random(2000);
		al.cantDias := random(7)+1;
	end;
end;

procedure insertar(var a:arbol; al:alquiler);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := al;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.numChasis > al.numChasis) then
			insertar(a^.hi,al)
		else
			insertar(a^.hd,al);
end;

procedure cargarVector(var va:vectorAlquiler);
var al:alquiler;
begin
	leerAlquiler(al);
	while (al.numChasis <> 0) do begin
		insertar(va[al.cantDias],al);
		leerAlquiler(al);
	end;
end;

procedure imprimirOrdA(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrdA(a^.hi);
		writeln('dni ', a^.dato.dni, ' num chasis ', a^.dato.numChasis);
		imprimirOrdA(a^.hd);
	end;
end;

procedure imprimirV(v:vectorAlquiler);
var i: integer;
begin
	for i := 1 to 7 do begin
		writeln('IMPRIMIRA LOS ALQUILERES DEL DIA ',i);
		imprimirOrdA(v[i]);
	end;
end;

procedure buscaDni(a:arbol; dni: integer; var c: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.dni = dni) then
			c := c + 1;
		buscaDni(a^.hi,dni,c);
		buscaDni(a^.hd,dni,c);
	end;
end;

procedure moduloB(v:vectorAlquiler; dni: integer;var cant: integer);
var i : integer;
begin
	for i := 1 to 7 do begin
		buscaDni(v[i],dni,cant)
	end;
end;

procedure moduloC(a:arbol ; n1,n2: integer; var cant: integer);
begin
	if (a <> nil) then begin
		if (n1 <= a^.dato.numChasis) then
			if (n2 >= a^.dato.numChasis) then begin
				cant := cant + 1;
				moduloC(a^.hi,n1,n2,cant);
				moduloC(a^.hd,n1,n2,cant);
			end
			else
				moduloC(a^.hi,n1,n2,cant)
		else
			moduloC(a^.hd,n1,n2,cant)
	end;
end;

var
v: vectorAlquiler;
i: integer;
cantidad,dni,n1,n2,dia: integer;
begin
randomize;
for i := 1 to 7 do
	v[i] := nil;

cargarVector(v);
writeln('IMPRIMIRA LOS DATOS DEL VECTOR	');
imprimirV(v);

writeln('ingrese un dni');
readln(dni);
cantidad:=0;
moduloB(v,dni,cantidad);
writeln('la cantidad de alquileres realizados por el dni ', dni , ' fueron ', cantidad);


writeln('ingrese un dia');
readln(dia);
writeln('ingrese n1 y n2');
readln(n1);
readln(n2);
cantidad:=0;
moduloC(v[dia],n1,n2,cantidad);
writeln('los alquileres realizados en el dia ', dia, ' de los chasis entre ',n1, ' y ', n2, ' fueron ', cantidad);
end.
