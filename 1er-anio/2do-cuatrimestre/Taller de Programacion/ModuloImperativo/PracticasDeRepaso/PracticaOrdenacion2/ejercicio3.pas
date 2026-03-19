program ejer3;
type rangoGen = 1..8;

pelicula = record
		codPeli: integer;
		codGen: rangoGen;
		puntajeProm: real;
	end;
	
lista = ^nodo;

nodo = record
	dato: pelicula;
	sig: lista;
end;

vectorGen = array [rangoGen] of lista;
vectorMaximos = array [rangoGen] of integer;
procedure leerPelicula(var p:pelicula);
begin
	write('cod pelicula');
	read(p.codPeli);
	write('cod genero');
	read(p.codGen);
	write('puntaje');
	read(p.puntajeProm);
	writeln('');
end;

procedure inicializarListas(var v:vectorGen);
var i:integer;
begin
	for i:= 1 to 8 do begin
		v[i]:= nil;
	end;
end;

procedure agregar(var l:lista; p :pelicula);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l := nue;
end;

procedure cargarVector(var v:vectorGen);
var
	p:pelicula; 
begin
	leerPelicula(p);
	while (p.codPeli <> -1 ) do begin 
		agregar(v[p.codGen],p);
		leerPelicula(p);
	end;
end;

procedure sacarUnMax(l:lista; var maxCod:integer);
var maxP:real;
begin
	maxP:= -1;
		while (l <> nil) do begin
			if (l^.dato.puntajeProm > maxP) then begin
				maxP:= l^.dato.puntajeProm;
				maxCod:= l^.dato.codPeli;
			end;
		l:= l^.sig;
		end;
end;

procedure sacarMaxPuntajes(v: vectorGen; var vm:vectorMaximos);
var
	i:integer; maxPeli: integer;
begin
	for i := 1 to 8 do begin
		sacarUnMax(v[i],maxPeli);
		writeln('el max cod del gen ', i , ' es ' , maxPeli);
		vm[i]:= maxPeli;
	end;
end;

procedure ordenar(var vm: vectorMaximos);
var
	i,j,pos:integer; item: integer;
begin
	for i:= 1 to 8-1 do begin
		pos := i;
		for j:= i+1 to 8 do
			if (vm[j] < vm[pos]) then
				pos:= j;
		item := vm[pos];
		vm[pos] := vm[i];
		vm[i] := item;
	end;
end;

procedure maxmin(v:vectorMaximos; var cmx,cmn:integer);
var
	i:integer; mx,mn: real;
begin
	mx:= -1;
	mn:= 9999;
	for i:= 1 to 8 do begin
		if (v[i] > mx) then begin
			mx:= v[i];
			cmx:= v[i];
		end;
		if (v[i] < mn) then begin
			mn := v[i];
			cmn := v[i];
		end;
	end;
end;

var
vg:vectorGen;
vm:vectorMaximos;
m1,m2: integer;
begin
inicializarListas(vg);
cargarVector(vg);
sacarMaxPuntajes(vg,vm);
ordenar(vm);
maxmin(vm,m1,m2);
writeln('el cod max es ',m1);
writeln('el cod min es ',m2);
end.
