program act2a;
const dimF = 50;

type vector = array [1..dimF] of integer;

procedure cargarVector(var v:vector; var diml:integer;inf,sup:integer);
var n:integer;
begin
n:= inf + random(sup - inf);
	while (n <> 0) and (diml < 50)do begin
		diml:= diml + 1;
		v[dimL]:= n;
		n:= inf + random(sup - inf);
	end;
end;

procedure imprimirVector(v:vector;diml:integer);
var i: integer;
begin
	for i := 1 to diml do
		writeln(v[i]);
end;

var
	v: vector;
	diml,i:integer;
	inf,sup:integer;
begin
randomize;
diml:= 0;
for i := 1 to 50 do
	v[i]:=0;
writeln('ingrese inf');
readln(inf);
writeln('ingrese sup');
readln(sup);
cargarVector(v,diml,inf,sup);
imprimirVector(v,diml);
writeln('el vector tiene ', diml , ' elementos');
end.
