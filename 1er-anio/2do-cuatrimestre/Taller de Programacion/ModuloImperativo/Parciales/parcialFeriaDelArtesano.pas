program parcial;
type 
rangomaterial = 1..8;
artesania = record
	numIden: integer;
	dniartesano: integer;
	codmaterialbase : rangomaterial;
end;

reg = record
	cant : integer;
	tipo : string;
end;

vectorMaterial = array [rangomaterial] of reg;

info = record
	dni : integer;
	cant: integer;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : info;
	hi : arbol;
	hd : arbol;
end;

procedure leerArtesania(var ar:artesania);
begin
	ar.dniartesano := random(50);
	if (ar.dniartesano <> 0) then begin
		ar.numIden := random(100) + 200;
		ar.codmaterialbase := random(8) + 1; 
	end;
end;

procedure insertar(var a:arbol; art:artesania);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.dni := art.dniartesano;
		a^.dato.cant := 1;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.dni = art.dniartesano)then
			a^.dato.cant := a^.dato.cant + 1
		else
			if (a^.dato.dni > art.dniartesano) then
				insertar(a^.hi,art)
			else
				insertar(a^.hd,art);
end;

procedure inicializarVector(var vm:vectorMaterial);
var i:integer; v: array [1..8] of string =('madera','yeso','ceramica','vidrio','acero','porcelana','lana','carton');
begin
	for i := 1 to 8 do begin
		vm[i].tipo := v[i];
		vm[i].cant := 0;
		end;
end;

procedure cargarArbol(var a:arbol;var vm:vectorMaterial);
var ar:artesania;
begin
	leerArtesania(ar);
	while (ar.dniartesano <> 0) do begin
		insertar(a,ar);
		vm[ar.codmaterialbase].cant := vm[ar.codmaterialbase].cant + 1;
		leerArtesania(ar);
	end;
end;

procedure imprimirOrdA(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrdA(a^.hi);
		writeln(a^.dato.dni);
		imprimirOrdA(a^.hd);
	end;
end;

procedure moduloB(a:arbol;dni:integer;var cant:integer);
begin
	if (a <> nil)then begin
		if (dni > a^.dato.dni) then begin
			cant := cant + 1;
			moduloB(a^.hd,dni,cant);
			moduloB(a^.hi,dni,cant);
		end
		else
			moduloB(a^.hi,dni,cant);
	end;
end;

procedure moduloC(vm:vectorMaterial;var matMax: string);
var i,j,pos:rangomaterial; item: reg;
begin
	for i := 1 to 7 do begin
		pos := i;
		for j := i+1 to 8 do
			if (vm[j].cant < vm[pos].cant) then
				pos := j;
			item := vm[pos];
			vm[pos] := vm[i];
			vm[i] := item;
	end;
	
	matMax := vm[8].tipo;
end;

procedure imprimirOrdV(vm:vectorMaterial);
var i:integer;
begin
	for i := 1 to 8 do 
		writeln('la cantidad del tipo ', vm[i].tipo , ' es ' , vm[i].cant);
end;

var
a: arbol;
vm: vectorMaterial;
dni: integer;
cant: integer;
nombrematerial : string;
begin
randomize;
a := nil;
inicializarVector(vm);
cargarArbol(a,vm);
writeln('imprimira arbol ordenado');
imprimirOrdA(a);


writeln('ingrese dni ');
readln(dni);
cant := 0;
moduloB(a,dni,cant);
writeln('la cantidad menor que el dni ', dni, ' son ', cant);

moduloC(vm,nombrematerial);
imprimirOrdV(vm);
writeln('el nombre del material basse con mayor cantidad de artesanias es ', nombrematerial);
end.
