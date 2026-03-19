const
dimf = 300;
type
oficinas = 1..dimf;

oficina = record
	cod: integer;
	dniPropietario: integer;
	valorExpensa: real;
	end;
	
tipoelem = oficina;
vector = array [oficinas] of tipoelem;

procedure leerofi(var o:tipoelem);
begin
	writeln('Ingrese un codigo!'); readln(o.cod);
	writeln('Iingrese un dni!'); readln(o.dniPropietario);
	writeln('Ingrese el valor'); readln(o.valorExpensa);
end;

procedure cargarVec( var v: vector; var diml: integer);
var
	o: tipoelem;
begin
	leerofi(o);
	diml:= 0;
	while (o.cod <> -1) and (diml<dimf) do begin
		diml:= diml+1;
		v[diml]:= o;
		leerofi(o);
		end;
end;

procedure insercion(var v: vector; diml: oficinas);
var
	i,j : integer;
	actual : oficina;
begin
	for i:= 2 to diml do begin
	actual:= v[i];
	j:= i-1;
		while (j>0) and (v[j].cod < actual.cod) do begin
			v[j+1]:=v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;

procedure seleccion(var v: vector; diml:oficinas);
var
	pos,j,i: oficinas; item: tipoelem;
begin
	for i:= 1 to diml-1 do begin
		pos:= i;
		for j:= i+1 to diml do begin
			if v[j].cod < v[pos].cod then
			 pos:= j;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
		end;
	end;
end;

var
v: vector;
diml: oficinas;
begin
cargarVec(v,diml);
insercion(v,diml);
seleccion(v,diml);
end.
