program parcial;
type
compra = record
	codcomida: integer;
	codcliente: integer;
	categoria: integer;
end;

comida = record
	categoriaComida : string;
	cant : integer;
end;

vectorComida = array [1..5] of comida;

info = record
	cod: integer;
	cantEntregas: integer;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato: info;
	hi : arbol;
	hd : arbol;
end;

procedure leerCompra(var c:compra);
begin
	c.codcliente := random(500);
	if (c.codcliente <> 0) then begin
		c.categoria := random(5) + 1;
		c.codcomida := random(200) + 100;
	end;
end;

procedure inicializarVector(var vc: vectorComida);
var i:integer; v: array [1..5] of string = ('Full','Super','Media', 'Normal', 'Basica');
begin
	for i := 1 to 5 do begin
		vc[i].categoriaComida := v[i];
		vc[i].cant := 0;
	end;
end;

procedure insertar(var a:arbol; c:compra);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.cod := c.codcomida;
		a^.dato.cantEntregas := 1;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.cod = c.codcomida) then
			a^.dato.cantEntregas := a^.dato.cantEntregas + 1
		else if (a^.dato.cod > c.codcomida) then
				insertar(a^.hi,c)
			else
				insertar(a^.hd,c);
end;

procedure cargarArbol(var a:arbol; var vc:vectorComida);
var c:compra;
begin
	leerCompra(c);
	while (c.codcliente <> 0) do begin
		insertar(a,c);
		vc[c.categoria].cant := vc[c.categoria].cant + 1;
		leerCompra(c);
	end;
end;

procedure imprimirOrdA(a:arbol);
begin
	if (a <> nil)then begin
		imprimirOrdA(a^.hi);
		writeln('la comida ', a^.dato.cod, ' tiene ', a^.dato.cantEntregas, 'entregas');
		writeln('');
		imprimirOrdA(a^.hd);
	end;
end;

procedure moduloB(a:arbol; codigo :integer; var cantEntregas:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.cod = codigo) then
			cantEntregas := a^.dato.cantEntregas
		else
			if (a^.dato.cod > codigo) then
				moduloB(a^.hi,codigo,cantEntregas)
			else
				moduloB(a^.hd,codigo,cantEntregas);
	end;
end;

procedure moduloC(var vc: vectorComida; var max:string);
var i,j,pos: integer; item: comida;
begin
	for i := 1 to 4 do begin
		pos := i;
		for j := i+1 to 5 do
			if (vc[j].cant < vc[pos].cant) then
				pos := j;
		item := vc[pos];
		vc[pos] := vc[i];
		vc[i] := item;
	end;
	max := vc[5].categoriaComida;
end;

procedure imprimirV(vc:vectorComida);
var i:integer;
begin
	for i := 1 to 5 do begin
		writeln('la categoria ', vc[i].categoriaComida ,' tiene ', vc[i].cant);
	end;
end;

var
a:arbol;
vc: vectorComida;
codigo: integer;
cantidad: integer;
max: string;
begin
randomize;
a := nil;

inicializarVector(vc);

cargarArbol(a,vc);
writeln('imprimira arbol ordenado');
imprimirOrdA(a);

writeln('ingresar codigo de comida');
readln(codigo);
moduloB(a,codigo,cantidad);
writeln('la cantidad de entregas al codigo ', codigo, ' fueron ', cantidad);

imprimirV(vc);
moduloC(vc,max);
imprimirV(vc);
writeln('la categoria con mas entregas fue ', max);
end.
