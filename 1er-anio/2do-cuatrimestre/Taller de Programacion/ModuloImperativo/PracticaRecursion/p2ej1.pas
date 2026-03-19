program uno;
type

vector = array [1..15] of integer;

///incisoA///
procedure cargarVecREC(var v: vector;diml: integer ;min: integer; max: integer);
var
	n: integer;
begin
	n := min + random(max-min)+1;
	if (n <> 20) and (diml < 16) then begin
		v[diml]:= n;
		cargarVecREC(v,diml+1,min,max);
	end;
end;

procedure imprimirNO(v: vector; diml: integer);
var
	i: integer;
begin
	for i := 1 to diml do 
		writeln(i,'el valor es ',v[i]);
end;

procedure imprimirSI (v: vector;diml: integer);
begin
	if diml > 0 then begin
		writeln(v[diml]);
		imprimirSI(v,diml+1);
	end;
end;

procedure sumar(v: vector;diml:integer;var suma:integer);
begin
	if (diml > 0) and (v[diml] mod 2 = 0) then begin
		suma := suma + v[diml];
	end;
		sumar(v,(diml-1),suma);
end;

procedure maximo(v:vector; diml: integer;var max:integer);
begin
	if diml > 0 then begin
		if v[diml] > max then
			max:= v[diml];
		maximo(v,diml-1,max);
	end;
end;
procedure busqueda(v: vector;ini: integer; fin: integer; valor:integer; var pos: integer; var encontre: boolean);
var
	mid: integer;
begin
	if ini > fin then
		pos := -1
	else
	mid := ini + fin div 2;
	if valor = v[mid] then begin
		pos := mid;
		encontre := true
		end
		else begin 
			if valor > v[mid] then 
			busqueda(v,ini,mid-1,valor,pos,encontre)
			else
				busqueda(v,mid+1,fin,valor,pos,encontre)
			end;
	end;

var
diml,min,max,maximo,ini,fin,pos,valor: integer;
v: vector;
begin
randomize;
diml := 1;
min := 10;
max:= 155;
cargarVecREC(v,diml,min,max);

imprimirNO(v,diml);

imprimirSI(v,diml);

maximo:= -1;
maximo(v,diml,maximo);

ini:= 1;
fin:= 15;
pos:= -1;
writeln('ingrese un valor a buscar'); readln(valor);
busqueda(v,ini,fin,valor,pos,encontrado);

end.
