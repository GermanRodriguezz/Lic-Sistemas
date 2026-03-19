program ejer3;
const
	dimF = 20;
type vector = array [1..20] of integer;
subrango = 1..dimF;

procedure cargarVector(var v:vector; i:integer);
var n:integer;
begin
	if (i < 21) then begin
		n := 300 + random(1550-300) + 1;
		writeln('se genero el num ' ,n);
		v[i]:= n;
		cargarVector(v,i+1);
	end;
end;

procedure ordenar (var v:vector);
var pos,i,j:subrango; item:integer;
begin
	for i := 1 to dimF-1 do begin
		pos := i;
		for j := i+1 to dimF do
			if (v[j] < v[i]) then
				pos := j;
		item := v[pos];
		v[pos] := v[i];
		v[i] := item;
	end;
end;

procedure busquedaDicotomica(v:vector;ini,fin:subrango;dato:integer;var pos:integer);
var mid: integer;
begin
	mid := (ini + fin) div 2;
	if (ini <= fin) then begin
		if (v[mid] = dato) then
			pos := mid
		else
			if (v[mid] > dato) then
				busquedaDicotomica(v,ini,mid-1,dato,pos)
			else
				busquedaDicotomica(v,ini,mid+1,dato,pos);
	end
	else
		pos := -1
end;

var
v:vector;
i:subrango;
dato,pos:integer;
begin
randomize;
i:= 1;
cargarVector(v,i);
writeln('vector ordenado..');
ordenar(v);
writeln('ingrese dato a buscar..');
readln(dato);
busquedaDicotomica(v,1,dimF,dato,pos);
if (pos <> -1) then
	writeln('se encontro el dato a buscar,esta en la pos ' ,pos)
else 
	writeln('no se encontro el dato en el vector');
end.
