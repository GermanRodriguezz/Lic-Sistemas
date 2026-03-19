program cuatro; 
type
rubros = 1..8;
cantidad = 1..30;

producto = record
cod: integer;
codrubro: rubros;
precio: real;
end;

lista = ^nodo;

nodo = record
dato: producto;
sig: lista;
end;

vector = array [rubros] of lista;
vector30 = array [cantidad] of producto;

procedure inicializarListas(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 8 do
		v[i]:= nil;
end;

procedure leer (var p: producto);
begin
	writeln('Ingrese un codigo'); readln(p.cod);
	writeln('Ingrese un rubro'); readln(p.codrubro);
	writeln('Ingrese un precio');readln(p.precio);
end;

procedure insert(var l: lista; p: producto);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.dato := p;
	act := l;
	while (act <> nil) and (act^.dato.cod < p.cod) do begin
		ant:= act;
		act:= act^.sig;
		end;
	if act = l then
		l := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;
procedure cargarVector(var v: vector);
var
	p: producto;
begin 
	leer(p);
	while p.precio <> 0 do begin
		insert(v[p.codrubro],p);
		leer(p);
	end;
end;

procedure procesar (v: vector);
var
	i: integer;
begin
	for i:= 1 to 8 do begin
		while v[i] <> nil do begin
			writeln('El cod del producto del rubro' ,i,'es' ,v[i]^.dato.cod);
			v[i]:= v[i]^.sig;
		end;
	end;
end;

procedure cargarvec30(v: vector; var v30: vector30; var diml: integer);
begin
	diml := 0;
	while (v[3] <> nil) and (diml <= 30) do begin
		diml:= diml+1;
		v30[diml]:= v[3]^.dato;
		v[3]:= v[3]^.sig;
	end;
end;

procedure insercion (var v30: vector30; diml: integer);
var
	j,i: integer; actual: producto;
begin
	for i := 2 to diml do begin
	actual:= v30[i];
	j:= i-1;
	while (j >0) and (v30[j].precio > actual.precio) do begin
		v30[j+1] := v30[j];
		j:= j-1;
		end;
	v30[j+1] := actual;
	end;
end;

procedure imprimirVec(vn: vector30;diml: integer);
var
	i: integer;
begin
	for i := 1 to diml do
		writeln(vn[i].precio);
end;

procedure procesarvecnuevo(vn: vector30;diml:integer; var prom:real);
var
	cant: integer;
	i: integer; 
	total : real;
begin
	total := 0; cant:= 0;
	for i := 1 to diml do begin
		total := total + vn[i].precio;
		cant:= cant +1;
		writeln('el precio de este producto es' ,vn[i].precio);
		end;
	prom:= total/cant;
end;

var
v: vector;
vn: vector30;
diml: integer;
prom: real;

begin
inicializarListas(v);

cargarVector(v);

procesar(v);

cargarvec30(v,vn,diml);

insercion(vn,diml);

imprimirVec(vn,diml);

procesarvecnuevo(vn,diml,prom);
writeln('El promedio de los precios vector de 30 es ',prom);
end.
