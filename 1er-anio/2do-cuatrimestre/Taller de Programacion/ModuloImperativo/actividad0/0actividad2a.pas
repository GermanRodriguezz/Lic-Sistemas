program actividad2a;
const dimF = 50;
type subrango = 1..dimf;
vector = array [subrango] of integer;

procedure inicializar(var v :vector);
var
	i: integer;
begin
	for i := 1 to 50 do
		v[i]:=0;
end;

procedure cargarVec (var v:vector;var diml: integer;max,min: integer);
var
	n: integer;
begin
	n := min + random(max-min+1);
while (n <> 0)and(diml+1 < 50) do begin
	diml := diml +1;
	v[diml] := n;
	n := min + random(max-min+1);
	writeln('se genero el numero ',n);
	end;
end;

procedure imprimirVec(v: vector; diml: integer);
var
	i: integer;
begin
	for i := 1 to diml do
		writeln(v[i]);
end;


var 
	v: vector; 
	min,max: integer; 
	diml: integer;
begin
	randomize;
	inicializar(v);
	writeln('ingrese un minimo'); readln(min);
	writeln('ingrese un maximo'); readln(max);
	diml:= 0;
	cargarVec(v,diml,max,min);
	imprimirVec(v,diml)
end.
