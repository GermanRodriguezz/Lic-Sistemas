program ejer1;
const
	dimF = 30;
type 
oficina = record
	codId : integer;
	dnipropietario: integer;
	valorexp : real;
end;


vector = array [1..dimF] of oficina;

procedure leeroficina(var o: oficina);
begin
	o.codId := random(50);
		o.dnipropietario := random(1000+1)+1000;
		o.valorexp := 200 + random(500-200)+1;
end;

procedure cargarVector(var v:vector;var diml:integer);
var o:oficina;
begin
	leeroficina(o);
	while (o.codId <> 0) and (diml < dimF) do begin
		diml := diml + 1;
		v[diml] := o;
		leeroficina(o);
	end;
end;

procedure ordenarVec(var v:vector; diml: integer);
var i,j:integer; actual : oficina;
begin
	for i := 2 to diml do begin
		actual := v[i];
		j := i-1;
		while (j > 0) and (v[j].codId > actual.codId) do begin
			v[j+1] := v[j];
			j := j - 1;
		end;
		v[j+1] := actual;
	end;
end;

procedure busquedaDicotomica(v:vector; ini,fin: integer; var pos:integer;cod:integer);
var mid:integer;
begin
	mid := (ini + fin) div 2;
	if (ini <= fin) then begin
		if (v[mid].codId = cod) then
			pos := mid
		else 
			if (v[mid].codId > cod) then
				busquedaDicotomica(v,ini,mid-1,pos,cod)
			else
				busquedaDicotomica(v,ini,mid+1,pos,cod);
	end
	else pos := 0;
end;

procedure montoTotal(v:vector; diml:integer;var monto:real;pos:integer);
begin
	if (pos < diml) then begin
		monto := monto + v[pos].valorexp;
		montoTotal(v,diml,monto,pos+1);
	end;
end;

procedure imprimirOrd(v:vector; diml:integer);
var i:integer;
begin
	for i:= 1 to diml do
		writeln(v[i].codId);
end;

var
v:vector;
diml: integer;
codigoOf: integer;
pos:integer;
monto: real;
begin
randomize;
diml:=0;
cargarVector(v,diml);
ordenarVec(v,diml);
writeln('imprimira el vector ordenado!');
imprimirOrd(v,diml);
writeln('');

writeln('ingrese codigo de oficina a buscar');
readln(codigoOf);
busquedaDicotomica(v,1,diml,pos,codigoOf);
if (pos <> 0) then
	writeln('el dni del propietario es : ' , v[pos].dnipropietario)
else
	writeln('no se encontro la oficina');

pos:= 1; monto := 0;
montoTotal(v,diml,monto,pos);
writeln('el monto total de las expensas son : ' , monto:2:2);
end.
