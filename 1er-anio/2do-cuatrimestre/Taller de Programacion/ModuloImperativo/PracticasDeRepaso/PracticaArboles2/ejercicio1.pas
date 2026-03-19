program ejer1;
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
	s.numSocio := random(5);
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

procedure imprimir(s:socio);
begin
	writeln('numero socio ',s.numSocio);
	writeln('nombre socio ',s.nombre);
	writeln('edad socio ',s.edad);
end;

procedure imprimirCreciente(a:arbol); //B1
begin
	while (a <> nil) do begin
		imprimirCreciente(a^.hi);
		imprimir(a^.dato);
		imprimirCreciente(a^.hd);
	end;
end;

procedure imprimirDecreciente(a:arbol); //B2
begin
	imprimirDecreciente(a^.hi);
	imprimirDecreciente(a^.hd);
	imprimir(a^.dato);
end;

procedure SocioMaxEdad(a:arbol; var MaxEdad:integer; var socioMax:integer); //B3
begin
	if (a <> nil) then 
		if (a^.dato.edad > MaxEdad) then begin
			MaxEdad := a^.dato.edad;
			socioMax := a^.dato.numSocio;
		end;
		SocioMaxEdad(a^.hi,MaxEdad,socioMax);
		SocioMaxEdad(a^.hd,MaxEdad,socioMax);
end; 

procedure aumentarEdad(a:arbol; var cant:integer); //B4
begin
	if (a <> nil) then begin
		if (a^.dato.edad mod 2 = 1) then begin
			a^.dato.edad := a^.dato.edad + 1;
			cant := cant + 1;
		end;
	aumentarEdad(a^.hi,cant);
	aumentarEdad(a^.hd,cant);
	end;
end;

function buscarNombre(a:arbol; n: string): boolean; // B5
var existe:boolean;
begin
	if (a = nil) then
		buscarNombre := false
	else 
		if (a^.dato.nombre = n) then
			buscarNombre := true
		else begin
			existe := buscarNombre(a^.hi,n);
			if (not existe) then
				existe := buscarNombre(a^.hd,n);
			buscarNombre := existe;
			end;
end;

procedure cantSociosYedad(a:arbol; var cant,edad: integer);
begin
	if (a <> nil) then begin
		cant := cant + 1;
		edad := edad + a^.dato.edad;
		cantSociosYedad(a^.hi,cant,edad);
		cantSociosYedad(a^.hd,cant,edad);
	end;
end;

function promEdad(cant:integer; prom:real): real;
begin
	promEdad := prom/ cant;
end;

var
a:arbol;
edad,nsocio,cantidad,cant:integer;
esta:boolean;
nom:string;
promedio : real;
begin
randomize;
a := nil;
cargarArbol(a);
writeln('arbol cargado');

writeln('imprimira creciente');
imprimirCreciente(a);

writeln('imprimira decreciente');
imprimirDecreciente(a);

SocioMaxEdad(a,edad,nsocio);
writeln('el numero de socio con max edad es : ',nsocio);

aumentarEdad(a,cantidad);
writeln('se le auemento la edad a ' ,cantidad , ' de socios ');

writeln('ingrese nombre a buscar');
readln(nom);
esta := buscarNombre(a,nom);
if (esta) then
	writeln('se encuentra')
else
	writeln('no se encuentra');

cantSociosYedad(a,cant,edad);
	if (cant <> 0) then
		promedio := promEdad(cant,edad);
		writeln('la cantidad de socios son : ', cant);
		writeln('el promedio de edad es de : ',promedio);
end.
