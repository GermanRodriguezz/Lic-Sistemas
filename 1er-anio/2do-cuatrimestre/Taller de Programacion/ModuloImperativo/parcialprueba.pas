program parcial;

type compra = record
	cod : integer;
	dia: integer;
	mes : integer;
 end;
 
 reg = record
	dia: integer;
	mes: integer;
 end;
 
 listacompra= ^nodolista;
 nodolista = record
	dato : reg;
	sig: listacompra;
 end;

regar = record
	codigo: integer;
	lista: listacompra;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : regar;
	hi: arbol;
	hd: arbol;
end;

vector = array [1..12] of integer;

procedure leer(var c : compra);
begin
writeln('ingrese un codigo'); readln(c.cod);
	if c.cod <> 0 then begin
		c.dia := random(31)+1; writeln(c.dia);
		c.mes := random(12)+1; writeln(c.mes);
	end;
end;

procedure incializar(var v: vector);
begin
	for i := 1 to 12 do
		v[i] := 0;
end;

procedure agregarlista(var l:listacompra; r: reg);
var
	nue: listacompra;
begin
	new(nue);
	l^.dato := r;
	l^.sig := l;
	l := nue;
end;

procedure insertar(var a : arbol; c: compra);
var
	r: reg;
begin
	if a= nil then begin
		new(a);
		a^.dato.codigo := c.cod;
		a^.dato.lista := nil;
		r.dia := c.dia;
		r.mes := c.mes;
		agregarlista(a^.dato.lista,r);
		end
		else if a^.dato.codigo = c.cod then begin
					r.dia := c.dia;
					r.mes := c.mes;
					agregarlista(a^.dato.lista,r);
		end
			else if a^.dato.codigo > c.cod then
				insertar(a^.hi,c);
				else
					insertar(a^.hd,c);
end;

procedure cargararbol (var a: arbol; var v:vector);
var
	c: compra;
begin
	leer(c);
	while c.cod <> 0 do begin
		insertar(a,c);
		v[c.mes] := v[c.mes] + 1;
		leer(c);
		end;
end;

function contarcant(l:listacompra): integer;
var
	cantidad : integer;
begin
	cantidad := 0;
	while l <> nil do begin
		cantidad:= cantidad +1;
		l:= l^.sig;
		end;
		contarcant := cant;
end;

procedure comprasdecliente(a: arbol; cod: integer; var cant : integer);
begin
	if a <> nil then 
		if a^.dato.codigo = cod then 
			cant := contarcant(a^.dato.lista);
		else
			if a^.dato.codigo > cod then
				comprasdecliente(a^.hi,cod,cant);
				else
					comprasdecliente(a^.hd,cod,cant);
	end;
end;

procedure ordenar(var v: vector; diml: integer);
var
	pos,i,j: integer; item : integer;
begin
	for i := 1 to diml-1 do begin
		pos := i;
			for j := i+1 to diml do
				if v[j] > v[pos] then pos := j;
			item := v[pos];
			v[pos]:= v[i];
			v[i]:= item;
	end;
end;

var
a: arbol;
v: vector;
cod,cant,diml: integer;
begin
a:= nil;
inicializar(v);
cargararbol(a,v);

writeln('ingrese un codigo de cliente'); readln(cod);
cant := 0;
comprasdecliente(a,cod,cant); writeln(cant);

diml := 12;
ordenar(v,diml);
end;
