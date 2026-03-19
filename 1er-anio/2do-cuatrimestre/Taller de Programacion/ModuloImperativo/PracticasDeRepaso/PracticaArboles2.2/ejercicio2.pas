program ejer2;
type socio = record
		numSocio: integer;
		nombre : string;
		edad : integer;
	end;
	
arbol = ^nodoArbol;
nodoArbol = record
	dato : socio;
	hi: arbol;
	hd: arbol;
end;

procedure leerSocio(var s :socio);
var
  vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola');
begin
	s.numSocio := random(100);
	if (s.numSocio <> 0 ) then begin
		s.nombre := vNombres[random(10)];
		s.edad := 12 + random(79);
	end;
end;

procedure insertar(var a:arbol; s:socio);
begin
	if (a = nil) then begin
	new(a);
	a^.dato := s;
	a^.hi := nil;
	a^.hd := nil;
	end
	else
		if (s.numSocio < a^.dato.numSocio) then
			insertar(a^.hi,s)
		else
			insertar(a^.hd,s);
end;

procedure imprimirOrd(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.numSocio);
		imprimirOrd(a^.hd);
	end;
end;

procedure cargarArbol(var a: arbol);
var
	s:socio;
begin
	leerSocio(s);
	while (s.numSocio <> 0) do begin
		insertar(a,s);
		leerSocio(s);
	end;
end;

function numSocioGrande(a:arbol): integer;
begin
	if (a <> nil) then
		if (a^.hd <> nil) then
			numSocioGrande := numSocioGrande(a^.hd)
	else
		numSocioGrande := a^.dato.numSocio;
end;

function datosSocioChico(a:arbol):arbol ;
begin
	if (a <> nil) then
		if (a^.hi <> nil) then
			datosSocioChico := datosSocioChico(a^.hi)
	else
		datosSocioChico := a;
end;

function buscarSocio(a:arbol; num:integer): boolean;
var existe:boolean;
begin
	if (a = nil) then
		buscarSocio := false
	else if (a^.dato.numSocio = num) then
			buscarSocio := true
			else begin
				existe := buscarSocio(a^.hi,num);
				if (not existe) then
					existe := buscarSocio(a^.hd,num);
				buscarSocio := existe;
			end;
end;

procedure cantidadSocioEntre(a:arbol; p1,p2:integer; var cant: integer);
begin
	if (a <> nil) then
		if (p1 < a^.dato.numSocio)then 
			if (p2 > a^.dato.numSocio) then begin
				cant := cant + 1;
				cantidadSocioEntre(a^.hi,p1,p2,cant);
				cantidadSocioEntre(a^.hd,p1,p2,cant);
			end
			else
				cantidadSocioEntre(a^.hi,p1,p2,cant)
		else
			cantidadSocioEntre(a^.hd,p1,p2,cant);
end;

var
a,datos:arbol;
ok : boolean;
numero,cant: integer;
begin
randomize;
a := nil;
cargarArbol(a);
writeln('arbol cargado!');


writeln('imprimira ordenado');
imprimirOrd(a);

writeln('el numero de socio mas grande es: ' , numSocioGrande(a));

datos := datosSocioChico(a);
if (datos <> nil) then
	writeln('los datos del socio mas chicos son --- num ' ,datos^.dato.numSocio, ' nombre ', datos^.dato.nombre, ' edad ' ,datos^.dato.edad);


writeln('ingrese numero de socio a buscar');
readln(numero);
ok := buscarSocio(a,numero);
if (ok) then
	writeln('se encuntra')
	else
		writeln('no se encuentra');


cantidadSocioEntre(a,10,20,cant);
writeln('la cantidad de socios que se encuentran entre los indices son ', cant);
end.
