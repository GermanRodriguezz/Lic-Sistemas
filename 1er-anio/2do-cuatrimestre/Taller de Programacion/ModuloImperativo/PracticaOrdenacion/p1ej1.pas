const
dimF = 50;
type
rangoCod = 1..15;
rangoDia = 0..31;
rango = 1..dimF;
rangoCant = 1..99;

venta = record
		dia : rangoDia;
		cod : rangoCod;
		cant : rangoCant;
		end;

vectorProductos = array [rango] of venta;

procedure leerVenta(var v: venta);
begin
	writeln('Ingrese un dia'); readln(v.dia);
	v.cod := random(99); writeln('Se genero el codigo ',v.cod);
	writeln('Ingrese una cantidad'); readln(v.cant);
end;

procedure cargarVecVenta(var v: vectorProductos; var dimL: integer);
var
	ven: venta;
begin
	leerVenta(ven);
	dimL:=0;
	while (ven.dia <> 0) and (dimL<=dimF) do begin
		dimL:= dimL+1;
		v[dimL]:= ven;
		leerVenta(ven);
		end;
end;
///inciso A///
procedure incisoBmostrarA( v: vectorProductos; dimL: integer);
var
	i: integer;
begin
	for i := 1 to dimL do begin
		writeln(v[i].dia);
		writeln(v[i].cod);
		writeln(v[i].cant);
		end;
end;
///inciso B///
procedure incisoC (var v: vectorProductos; dimL: integer);
var
	i,j,pos: integer; item: venta;
begin
	for i := 1 to dimL-1 do begin
		pos := i;
		for j:= i+1 to dimL do begin
			if v[j].cod < v[pos].cod then pos:= j;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
		end;
	end;
end;
///inciso C///
procedure incisoDmostrarC (v: vectorProductos; dimL: integer);
var
	i: rango;
begin
	for i := 1 to dimL do begin
		writeln(v[i].dia);
		writeln(v[i].cod);
		writeln(v[i].cant);
	end;
end;
///inciso D///
procedure incisoE(var v:vectorProductos; var dimL: integer; x,y: integer);
var
	i,ini,fin: integer;
begin
	if (x > 0) and (x < 50) and (y > 0) and (y < 50) then begin
		if x < y then begin
			ini := x;
			fin := y;
			end
		else begin
			ini := y;
			fin := x;
		end;
	end;
	for i := ini to fin do begin
		v[ini]:= v[ini+1];
		dimL:= dimL-1
	end;
end;
///inciso E///
procedure incisoFmostrarE(v: vectorProductos;dimL: rango);
var
	i: rango;
begin
	for i := 1 to dimL do begin
		writeln(v[i].dia);
		writeln(v[i].cod);
		writeln(v[i].cant);
		end;
end;
///inciso F///

procedure incisoG(ve:vectorProductos; dimL:rango);
var
	i: rango;
begin
	for i := 1 to dimL do begin
		if (ve[i].cod mod 2=0) then
			writeln ('el codigo se vendio ', ve[i].cant ,'veces' );
	end;
end;

var
v: vectorProductos;
dimL: integer;
x,y: integer;
begin
randomize;

cargarVecVenta(v,dimL);

incisoBmostrarA(v,dimL);

incisoC(v,dimL);

incisoDmostrarC(v,dimL);

writeln('Ingresar un numero inicial '); readln(x); 
writeln('Ingresar otro numero final'); readln(y);
incisoE(v,dimL,x,y);

incisoFmostrarE(v,dimL);

incisoG(v,dimL);
end.
