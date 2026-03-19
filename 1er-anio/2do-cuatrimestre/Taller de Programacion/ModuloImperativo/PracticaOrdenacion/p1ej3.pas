program ejercicio3;
const dimf = 8;
type
rangoGeneros = 1..dimf;

pelicula = record
	codpeli : integer;
	codgen : rangoGeneros;
	puntajeProm : real;
	end;

lista = ^nodo;

nodo = record
	dato : pelicula;
	sig : lista;
	end;
vector = array [rangoGeneros] of lista;
vector2 = array [rangoGeneros] of pelicula;

procedure inicializarListas(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 8 do
		v[i]:= nil;
end;
	
procedure leerPelicula(var p: pelicula);
begin
	writeln('Ingrese un codigo de pelicula!'); readln(p.codpeli);
	writeln('Ingrese un codigo de genero!'); readln(p.codgen);
	writeln('Ingrese un puntaje promedio!');readln(p.puntajeProm);
end;

procedure agregarAdelante(var l: lista; p: pelicula);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := p;
	nue^.sig := l;
	l := nue;
end;

procedure CargarVec(var v: vector);
var
	p:pelicula;
begin
	leerPelicula(p);
	while p.codpeli <> -1 do begin
		agregarAdelante(v[p.codgen],p);
		leerPelicula(p);
		end;
end;
procedure BuscarMax(l:lista; var codMax: pelicula);
var
	max:real;
begin
max:=-1;
	while(l<>nil)do begin
		if(l^.dato.puntajeProm > max)then begin
			max := l^.dato.puntajeProm;
			codMax := l^.dato;
		end;
		l:= l^.sig;
	end;
end;

procedure procesarVec(v: vector; var v2: vector2);
var
	codMax: pelicula;
	i: integer;
begin
	for i := 1 to 8 do begin
		buscarMax(v[i],codMax);
		writeln('El codigo de pelicula con mayor puntaje fue ', codMax.codpeli);
		v2[i] := codMax;
	end;
end;

procedure seleccion(var v2: vector2; diml: rangoGeneros);
var
	j,pos,i: rangoGeneros; item : pelicula;
begin
	for i := 1 to diml-1 do begin
		pos:=i;
		for j := i+1 to diml do 
			if v2[j].puntajeProm > v2[pos].puntajeProm then pos:= j;
		item:= v2[pos];
		v2[pos]:= v2[i];
		v2[i]:= item;
	end;
end;

procedure maxYmin(v2: vector2);
var
	i: integer;
	max,min: real;
	genMax,genMin: integer;
	codMax,codMin: integer;
begin
max:= -1; min:= 99999;
	for i := 1 to 8 do begin
		if v2[i].puntajeProm > max then begin
			max:= v2[i].puntajeProm;
			codMax:= v2[i].codpeli;
			genMax := i;
		end;
		if v2[i].puntajeProm < min then begin
			min:= v2[i].puntajeProm;
			codMin:= v2[i].codpeli;
			genMin := i;
		end;
	end;
		writeln('El cod max del genero ' ,genMax, 'es ' ,codMax);
		writeln('El cod min del genero ' ,genMin, 'es ' ,codMin);
end;

var
v: vector;
v2: vector2;
diml: rangoGeneros;
begin
inicializarListas(v);

cargarVec(v);

procesarVec(v,v2);

diml := 8;
seleccion(v2,diml);

maxYmin(v2);

end.
