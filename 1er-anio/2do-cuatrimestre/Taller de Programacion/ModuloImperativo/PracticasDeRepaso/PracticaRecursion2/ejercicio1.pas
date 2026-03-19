program ejer1;
type 

vector = array [1..15] of integer;

procedure carVec(var v:vector; var diml: integer);
var n:integer;
begin
	n := 10 + random(155-10)+1;
	if (n <> 120) and (diml <= 15) then begin
		diml := diml + 1;
		v[diml]:= n;
		carVec(v,diml)
	end;
end;

procedure impVec(v:vector;diml:integer);
var i:integer;
begin
	for i := 1 to diml do
		writeln(v[i]);
end;
//pos debe iniciar en uno//
procedure impVecRec(v:vector; diml:integer; pos:integer);
begin
	if (pos <= diml) then begin
		writeln(v[pos]);
		impVecRec(v,diml,pos+1);
	end;
end;

procedure sacarMaxRec(v:vector; diml:integer; var max:integer;pos:integer);
begin
	if (pos <= diml) then begin
		if (v[pos] > max) then
			max := v[pos];
		sacarMaxRec(v,diml,max,pos+1);
	end;
end;

function buscarValor(v:vector;diml,pos,n:integer):boolean;
begin
	if (pos <= diml) then begin
		if (v[pos] = n) then
			buscarValor := true
		else
			buscarValor:= buscarValor(v,diml,pos+1,n);
	end;
end;

procedure descomponer(n:integer);
var dig: integer;
begin
	if (n <> 0) then begin
		dig := n mod 10;
		n:= n div 10;
		descomponer(n);
	writeln(dig);
	end;
end;

procedure imprimir(v:vector;diml,pos:integer);
var n:integer;
begin
	if (pos <= diml) then begin
		n := v[pos];
		descomponer(n);
		writeln('');
		imprimir(v,diml,pos+1);
	end;
end;

var
v:vector;
diml,pos,i,num,max:integer;
ok: boolean;
begin
randomize;
for i:= 1 to 15 do
		v[i]:= 0;
carVec(v,diml);
writeln('imprimira vector');
impVec(v,diml);
writeln('imprimira vec recursivo');
pos := 1;
impVecRec(v,diml,pos);
sacarMaxRec(v,diml,max,pos);
writeln('el num max del vector es : ',max);
writeln('ingrese num a buscar');
readln(num);
ok := buscarValor(v,diml,pos,num);
if (ok = true) then
	writeln('se encontro')
else
	writeln('no se encontro');
writeln('imprimira dig por dig');
imprimir(v,diml,pos);
end.
