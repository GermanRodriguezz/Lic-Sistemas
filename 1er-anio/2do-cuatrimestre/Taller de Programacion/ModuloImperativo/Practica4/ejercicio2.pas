program ejercicio2;
type socio = record
	numsocio : integer;
	nombre : string;
	edad : integer;
end;

arbol = ^nodo;

nodo = record
	dato : socio;
	hi : arbol;
	hd : arbol;
end;

procedure leersocio(var s: socio);
var 
vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
 
 begin
   s.numsocio:= random (51) * 100; writeln('el numero del socio es ',s.numsocio);
   If (s.numsocio <> 0)
   then begin
        s.nombre:= vNombres[random(10)]; writeln('el nombre generado es ',s.nombre);
        s.edad:= 12 + random (79); writeln('la edad del socio es ',s.edad);
        end;
 end; 

procedure agregarArbol(var a: arbol;s:socio);
var aux: arbol;
begin
	if (a = nil)then begin
		new(aux);
		aux^.dato := s;
		aux^.hi := nil;
		aux^.hd := nil;
		a := aux;
	end
		else if (a^.dato.numsocio > s.numsocio) then
			agregarArbol(a^.hi,s)
			else
				agregarArbol(a^.hd,s);
end;

procedure cargarArbol(var a:arbol);
var
	s: socio;
begin
	leersocio(s);
	while (s.numsocio <> 0) do begin
		agregarArbol(a,s);
		leersocio(s);
		end;
end;

function maxSocio(a: arbol): integer;
begin
	if a<>nil then
		if a^.hd <> nil then
			maxSocio:= maxSocio(a^.hd)
		else
			maxSocio := a^.dato.numSocio;
end;

function datosDelMin(a: arbol): socio;
begin
	if a <> nil then
		if a^.hi <> nil then
			datosDelMin:= datosDelMin(a^.hi)
		else
			datosDelMin := a^.dato;
end;

function buscarSocio(a: arbol; n: integer): boolean;
begin
	if a =  nil then
		buscarSocio := false
		else if a^.dato.numsocio = n then
			buscarSocio := true
			else if a^.dato.numsocio > n then
					buscarSocio:= buscarSocio(a^.hi,n)
					else
						buscarSocio:= buscarSocio(a^.hd,n)
end;

procedure retornarSocios(a: arbol; p1,p2: integer; var cant: integer);
begin
	if a <> nil then begin
		if p1 < a^.dato.numsocio then begin
			if p2 > a^.dato.numsocio then begin
				cant := cant + 1;
				retornarSocios(a^.hi,p1,p2,cant);
				retornarSocios(a^.hd,p1,p2,cant);
				end
			else
				retornarSocios(a^.hi,p1,p2,cant)
		end
		else 
			retornarSocios(a^.hd,p1,p2,cant);
end;
end;

var
a: arbol;
dat: socio;
numero,cant,p1,p2 : integer;
begin
randomize;
a:= nil;
cargarArbol(a);

writeln('el socio con numero mas grande es ', maxSocio(a));

dat := datosDelMin(a);
	writeln('el numero de socio minimo es ', dat.numsocio);
	writeln('el nombre es ', dat.nombre);
	writeln('la edad es ', dat.edad);


writeln('ingrese el numero del socio a buscar'); readln(numero);
if buscarSocio(a,numero) then
	writeln('existe el socio con el numero ', numero)
	else
		writeln('no existe el socio con el numero ', numero);

writeln('ingrese p1'); readln(p1); 
writeln('ingrese p2'); readln(p2);
cant := 0;
retornarSocios(a,p1,p2,cant);
	writeln('la cantidad de socios que estan entre los valores son ',cant);
end.
