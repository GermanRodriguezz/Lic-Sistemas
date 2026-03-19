program ejer3;
type
rangorub = 1..10;
prod = record
	cod : integer;
	rubro : rangorub;
	stock : integer;
	preciouni : real;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : prod;
	hi : arbol;
	hd : arbol;
end;

vector = array [rangorub] of arbol;

procedure leerProd(var p: prod);
begin
	p.cod := random(500);writeln(p.cod);
	p.rubro := random(10)+1;
	p.stock := 500 + random(1500);
	p.preciouni := 50 + random (200)+1;
end;

procedure insertar(var a:arbol; p:prod);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := p;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.cod > p.cod) then
			insertar(a^.hi,p)
		else
			insertar(a^.hd,p);
end;

procedure cargarVector(var v:vector);
var p: prod;
begin
	leerProd(p);
	while (p.cod <> 0) do begin
		insertar(v[p.rubro],p);
		leerProd(p);
	end;
end;

function buscarEnRubro(a:arbol; cod:integer): boolean;
begin
	if (a = nil) then 
		buscarEnRubro := false
	else if (a^.dato.cod = cod) then
			buscarEnRubro := true
		else if (a^.dato.cod > cod) then
				buscarEnRubro(a^.hi,cod)
			else
				buscarEnRubro(a^.hd,cod);
end;

procedure sacarMax(a: arbol; var cod:integer;var stock:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.cod > cod) then begin
			cod := a^.dato.cod;
			stock := a^.dato.stock;
		end;
		sacarMax(a^.hd,cod,stock);
	end;
end;

procedure maxCods(v:vector);
var i,codmax,stock: integer;
begin
	for i := 1 to 10 do begin
		if (v[i] <> nil) then begin
			sacarMax(v[i],codmax,stock);
			writeln('el cod mayor del rubro ',i, ' es : ',codmax,' y su stock es ',stock);
		end;
	end;
end;

procedure cantidad(a:arbol; v1,v2: integer; var cant: integer);
begin
	if (a <> nil) then begin
		if (v1 < a^.dato.cod) then
			if(v2 > a^.dato.cod) then begin
				cant:= cant + 1;
			cantidad(a^.hi,v1,v2,cant);
			cantidad(a^.hd,v1,v2,cant)
			end
			else
				cantidad(a^.hi,v1,v2,cant)
		else
			cantidad(a^.hd,v1,v2,cant);
	end;
end;

procedure cantidadProdsEntreValores(v:vector; v1,v2:integer);
var i,cant: integer;
begin
	for i := 1 to 10 do begin
		cantidad(v[i],v1,v2,cant);
		writeln('la cantidad de prods entre ',v1 ,' y ', v2, ' son : ', cant);
		writeln('');
	end;
end;

var
v: vector;
r,c: integer;
valor1,valor2 : integer;
ok: boolean;
begin
randomize;
cargarVector(v);

r:= random(10)+1;
c:= random(500);
writeln('codigo a buscar : ' , c , 'en el rubro ' , r);
ok:= buscarEnRubro(v[r],c);
if (ok) then
	writeln('se encuentra')
else
	writeln('no se encuentra');

maxCods(v);

write('ingresar los dos valores '); 
read(valor1); read(valor2);
cantidadProdsEntreValores(v,valor1,valor2);
end.
