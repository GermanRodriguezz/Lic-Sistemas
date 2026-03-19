program ejer2;
const
	dimF = 300;
type oficina = record
		codID: integer;
		dniProp: integer;
		valorExp: real;
		end;
vector = array [1..dimF] of oficina;

procedure leerOfi(var o:oficina);
begin
	write('cod :');
	read(o.codID);
	write('dni : ');
	read(o.dniProp);
	write('valor : ');
	read(o.valorExp);
	writeln('');
end;

procedure cargarVector(var v:vector;var diml: integer);
var
	o:oficina;
begin
	diml:= 0;
	leerOfi(o);
	while (o.codID <> -1) and (diml < dimF) do begin
		diml := diml + 1;
		v[diml]:= o;
		leerOfi(o);
	end;
end;

procedure insercion(var v:vector; diml:integer);
var
	j,i:integer; actual:oficina;
begin
	for i := 2 to diml do begin
		actual := v[i];
		j:= i-1;
		while (j > 0) and (v[j].codID > actual.codID) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual;
	end;
end;

procedure impVec(v:vector; diml:integer);
var i:integer;
begin
	for i:= 1 to diml do begin
		writeln(v[i].codID);
		writeln(v[i].dniProp);
		writeln(v[i].valorExp);
	end;
end;

var
	v:vector;
	diml:integer;
begin
cargarVector(v,diml);
impVec(v,diml);
insercion(v,diml);
impVec(v,diml);
end.
