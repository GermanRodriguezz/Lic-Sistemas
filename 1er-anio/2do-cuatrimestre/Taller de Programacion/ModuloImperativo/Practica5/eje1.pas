program uno;
type oficina = record
		codiden : integer;
		dni : integer;
		valorexp : real;
end;

vector = array [1..300] of oficina;

procedure leerofi(var o: oficina);
begin
	writeln('ingrese codigo de identificacion'); readln(o.codiden);
	if o.codiden <> 0 then begin
		o.dni := random(1000)+1;
		writeln('el dni del propietario es ', o.dni);
		o.valorexp := 200 + random(100)+1;
		writeln('el valor de la expensa es ',o.valorexp:2:2);
	end;
end;

procedure cargarvec(var v: vector; var diml: integer);
var
	o: oficina;
begin
	leerofi(o);
	while (o.codiden <> 0) and (diml <= 300) do begin
			diml := diml +1;
			v[diml] := o;
			leerofi(o);
	end;
		
end;

procedure seleccion(var v: vector; diml: integer);
var
	j,pos,i: integer; item: oficina;
begin
	for i := 1 to diml-1 do begin
		pos := i;
		for j := i+1 to diml do 
			if v[j].codiden < v[pos].codiden then pos := j;
		item := v[pos];
		v[pos]:= v[i];
		v[i]:= item
	end;
end;

procedure montototal(v: vector; diml: integer; var monto: real);
begin
	if diml > 0 then begin
		monto := monto + v[diml].valorexp;
		montototal(v,diml-1,monto);
	end;
end;

var
	v: vector;
	diml: integer;
	monto: real;
begin

diml:= 0;
cargarvec(v,diml);

seleccion(v,diml);

monto:= 0;
montototal(v,diml,monto);
writeln('el monto total del vector es de ', monto:2:2);
end.
