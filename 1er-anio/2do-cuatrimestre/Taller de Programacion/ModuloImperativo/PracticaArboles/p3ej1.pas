program arboles1;
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
   s.numsocio:= random (51) * 100;
   If (s.numsocio <> 0)
   then begin
        s.nombre:= vNombres[random(10)];
        s.edad:= 12 + random (79);
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
///1///
procedure infCreciente (a:arbol);
begin
	if a <> nil then begin
		writeln(a^.dato.numSocio);
		infCreciente(a^.hi);
		infCreciente(a^.hd);
	end;
end;
///2///
procedure infDecre(a:arbol);
begin
	if (a <> nil) then
		begin
			infDecre(a^.hd);
			writeln (a^.dato.numSocio);
			infDecre(a^.hi);
		end;
end;
///3///
procedure maxEdad(a:arbol; var max: integer);
begin
	if a = nil then max:= max
	else begin
		maxEdad(a^.hi,max); 
		if a^.dato.edad > max then
				max := a^.dato.edad;
		maxEdad(a^.hd,max);
		end;
end;
///4///
procedure aumentaredad(var a:arbol; var cantImp:integer);
begin
	if (a <> nil) and (a^.dato.edad mod 2 = 1) then begin
		a^.dato.edad := a^.dato.edad +1;
		cantImp := cantImp +1;
		aumentaredad(a^.hi,cantImp);
		aumentaredad(a^.hd,cantImp);
	end;
end;
///6////
function buscarNombre(a:arbol; n:string): boolean;
var
existe: boolean;
begin
	if a = nil then 
		buscarNombre := false
	else if a^.dato.nombre = n then
		buscarNombre := true
		else begin
			existe := buscarNombre(a^.hi,n);
			if not existe then
				existe := buscarNombre(a^.hd,n);
			buscarNombre := existe;
		end;
end;
///7///
procedure cantSocios (a:arbol;var cant: integer);
begin
	if a = nil then
		cant := cant + 1
	else 
		cant:= cant + 1;
		cantSocios(a^.hi,cant);
		cantSocios(a^.hd,cant);
end;
///8///
procedure promEdad (a: arbol; cant:integer; var acumulador:integer);
begin
	if a = nil then 
		acumulador := acumulador + 0
	else begin
		acumulador := acumulador + a^.dato.edad;
		promEdad(a^.hi,cant,acumulador);
		promEdad(a^.hd,cant,acumulador);
	end;
end;

var 
a: arbol;
maximaEdad: integer;
cimp: integer;
nombre: string;
cant: integer;
promedio: real;
acumulador: integer;

begin
randomize;

a := nil;

cargarArbol(a);

maximaEdad:= 0;
maxEdad(a,maximaEdad);
writeln('El socio con mayor edad es ', maximaEdad);

cimp := 0;
aumentaredad(a,cimp);


writeln('Ingrese el nombre a buscar!'); readln(nombre);
if buscarNombre(a,nombre) then
	writeln('encontre')
	else writeln('no encontre');
	

cant := 0;
cantSocios(a,cant);
writeln('La cantidad de socios son ',cant);


promedio := 0;
acumulador:= 0;
promEdad(a,cant,acumulador);
promedio := acumulador/cant;
writeln(promedio);

infCreciente(a);

infDecre(a);
end.
