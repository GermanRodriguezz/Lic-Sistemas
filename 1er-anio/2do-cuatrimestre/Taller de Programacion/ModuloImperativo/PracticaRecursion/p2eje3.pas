program tres;

type
diml = 1..20;
tipoelem = integer;
vector = array [diml] of tipoelem;

procedure armarvec(var v: vector; dl:integer; min,max:integer);
var 
	n: integer;
begin
	n:= min + random(max-min)+1;
	writeln('el numero generado es ',n);
	if  (dl <= 20) then begin
		v[dl]:= n;
		armarvec(v,(dl+1),min,max);
	end;
end;

procedure seleccion(var v:vector; diml: integer);
var
	j,pos,i: integer; item: integer;
begin
	for i := 1 to diml-1 do begin
		pos := i;
		for j := i+1 to diml do
			if v[j] > v[pos] then pos := j;
		item := v[pos];
		v[pos] := v[j];
		v[i] := item;
	end;
end;

procedure busquedaDicRecursiva(v:vector; ini,fin: integer; dato:integer; var pos:integer);
begin
	pos := (ini+fin)div 2;
	if (dato = v[pos]) or (ini < fin) then begin
		if dato = v[pos] then
			writeln('encontre el numero en la posicion ',pos)
		else
			pos := -1
	end
	else if dato < v[pos] then begin
		fin := pos +1;
		busquedaDicRecursiva(v,ini,fin,dato,pos);
		end
		else begin
			ini := pos +1;
			busquedaDicRecursiva(v,ini,fin,dato,pos);
		end;
end;

var
v: vector;
min,max,dl,dato : integer;
ini,fin : diml;
pos : integer;
begin
randomize;

min := 300; max := 1550;
dl := 1;
armarvec(v,dl,min,max);

seleccion(v,dl);

writeln('ingrese un dato a buscar'); readln(dato);
writeln('ingrese un numero inicial '); readln(ini);
writeln('ingrese un numero final'); readln(fin);
busquedaDicRecursiva(v,ini,fin,dato,pos);
end.
